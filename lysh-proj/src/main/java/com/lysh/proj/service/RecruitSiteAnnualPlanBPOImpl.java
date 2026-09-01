package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteAnnualPlanEntity;
import com.lysh.proj.model.RecruitCorpDetailData;
import com.lysh.proj.model.RecruitGJDFileModel;
import com.lysh.proj.model.RecruitSiteAnnualPlan;
import com.lysh.proj.model.RecruitSiteAnnualPlanQueryReq;
import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.model.excel.RecruitSiteAnnualPlanExcel;
import com.alibaba.excel.EasyExcel;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 高基地年报计划业务处理实现类。
 * 企业填报并提交后进入待审核，区管理员审核为通过或待整改。
 */
@Service
public class RecruitSiteAnnualPlanBPOImpl implements RecruitSiteAnnualPlanBPO {

    private static final Logger logger = LoggerFactory.getLogger(RecruitSiteAnnualPlanBPOImpl.class);

    private static final String STATUS_PENDING = "待审核";
    private static final String STATUS_PASSED = "审核通过";
    private static final String STATUS_RECTIFY = "待整改";
    private static final String DISTRICT_CITY = "00";
    private static final String COLUMNS = "plan_id, site_id, tyshxym, district_code, annual_year, " +
            "skill_service_count, open_service_count, service_ratio, situation_desc, plan_file_key, plan_file_name, " +
            "status, reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at";

    private final RecruitSiteInfoBPO siteInfoBPO;

    public RecruitSiteAnnualPlanBPOImpl(RecruitSiteInfoBPO siteInfoBPO) {
        this.siteInfoBPO = siteInfoBPO;
    }

    @Override
    public RecruitSiteAnnualPlan saveByCorp(RecruitSiteAnnualPlan plan) {
        RecruitSiteInfo siteInfo = findCorpSite();
        validate(plan);
        BigDecimal ratio = calcRatio(plan.getOpenServiceCount(), plan.getSkillServiceCount());
        validateSubmit(plan.getSkillServiceCount(), ratio);
        Date now = new Date();
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        plan.setSiteId(siteInfo.getSiteId());
        plan.setTyshxym(siteInfo.getTyshxym());
        plan.setDistrictCode(siteInfo.getDistrictCode());
        plan.setServiceRatio(ratio);
        plan.setStatus(STATUS_PENDING);
        RecruitSiteAnnualPlanEntity existing = findBySiteAndYear(siteInfo.getSiteId(), plan.getAnnualYear());
        if (existing == null) {
            plan.setCreatedBy(operatorName);
            plan.setCreatedAt(now);
            plan.setUpdatedBy(operatorName);
            plan.setUpdatedAt(now);
            insert(plan);
        } else {
            if (STATUS_PENDING.equals(existing.getStatus())) {
                throw new BusinessException("年报计划待审核，不能修改");
            }
            plan.setPlanId(existing.getPlanId());
            plan.setCreatedBy(existing.getCreatedBy());
            plan.setCreatedAt(existing.getCreatedAt());
            plan.setReviewer(null);
            plan.setReviewTime(null);
            plan.setReviewOpinion(null);
            plan.setUpdatedBy(operatorName);
            plan.setUpdatedAt(now);
            update(plan);
        }
        return plan;
    }

    @Override
    public PageResult<RecruitSiteAnnualPlan> queryCorpList(RecruitSiteAnnualPlanQueryReq req) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (req == null) {
            req = new RecruitSiteAnnualPlanQueryReq();
        }
        req.setSiteId(siteInfo.getSiteId());
        return doQueryList(req);
    }

    @Override
    public RecruitSiteAnnualPlan findCorpById(Long planId) {
        RecruitSiteAnnualPlan plan = queryById(planId);
        checkCorpOwner(plan.getSiteId());
        return plan;
    }

    @Override
    public PageResult<RecruitSiteAnnualPlan> queryAdminList(RecruitSiteAnnualPlanQueryReq req) {
        if (req == null) {
            req = new RecruitSiteAnnualPlanQueryReq();
        }
        applyAdminDistrict(req);
        return doQueryList(req);
    }

    @Override
    public RecruitSiteAnnualPlan findAdminById(Long planId) {
        RecruitSiteAnnualPlan plan = queryById(planId);
        checkAdminDistrict(plan.getDistrictCode());
        return plan;
    }

    @Override
    public RecruitSiteAnnualPlan review(Long planId, String status, String reviewOpinion) {
        if (!STATUS_PASSED.equals(status) && !STATUS_RECTIFY.equals(status)) {
            throw new BusinessException("审核结果只能为审核通过或待整改");
        }
        RecruitSiteAnnualPlanEntity entity = getEntity(planId);
        if (entity == null) {
            throw new BusinessException("年报计划不存在: " + planId);
        }
        checkAdminDistrict(entity.getDistrictCode());
        Date now = new Date();
        entity.setStatus(status);
        entity.setReviewer(currentAdminOperatorName());
        entity.setReviewTime(now);
        entity.setReviewOpinion(reviewOpinion);
        entity.setUpdatedAt(now);
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_ANNUAL_PLAN SET status = ?, reviewer = ?, review_time = ?, " +
                        "review_opinion = ?, updated_at = ? WHERE plan_id = ?",
                entity.getStatus(), entity.getReviewer(), entity.getReviewTime(), entity.getReviewOpinion(),
                entity.getUpdatedAt(), planId);
        return toModel(entity);
    }

    @Override
    public RecruitGJDFileModel generatorCorpExportFile(RecruitSiteAnnualPlanQueryReq req) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (req == null) {
            req = new RecruitSiteAnnualPlanQueryReq();
        }
        req.setSiteId(siteInfo.getSiteId());
        return generatorExportFile(req);
    }

    @Override
    public RecruitGJDFileModel generatorAdminExportFile(RecruitSiteAnnualPlanQueryReq req) {
        if (req == null) {
            req = new RecruitSiteAnnualPlanQueryReq();
        }
        applyAdminDistrict(req);
        return generatorExportFile(req);
    }

    private RecruitGJDFileModel generatorExportFile(RecruitSiteAnnualPlanQueryReq req) {
        List<RecruitSiteAnnualPlanExcel> rows = buildExportList(req);
        if (rows.isEmpty()) {
            throw new BusinessException("查询列表为空，导出文件失败");
        }
        Path tempFile = null;
        try {
            tempFile = Files.createTempFile("export_annual_plan_", ".xlsx");
            EasyExcel.write(Files.newOutputStream(tempFile))
                    .head(RecruitSiteAnnualPlanExcel.class)
                    .sheet("年报计划")
                    .doWrite(rows);
            String fileName = "年报计划.xlsx";
            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            return new RecruitGJDFileModel(fileName, Files.readAllBytes(tempFile), contentType);
        } catch (Exception e) {
            logger.error("导出年报计划文件失败", e);
            throw new BusinessException("导出年报计划文件失败");
        } finally {
            if (tempFile != null) {
                try {
                    Files.deleteIfExists(tempFile);
                } catch (IOException e) {
                    logger.error("删除年报计划临时文件失败", e);
                }
            }
        }
    }

    private List<RecruitSiteAnnualPlanExcel> buildExportList(RecruitSiteAnnualPlanQueryReq req) {
        List<RecruitSiteAnnualPlanEntity> entities = queryPlanEntities(req);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<RecruitSiteAnnualPlanExcel> rows = new ArrayList<>();
        for (RecruitSiteAnnualPlanEntity entity : entities) {
            RecruitSiteInfo siteInfo = siteInfoBPO.findById(entity.getSiteId());
            String siteName = siteInfo == null ? null : siteInfo.getSiteName();
            if (isNotBlank(req.getKeyword())
                    && !containsKeyword(siteName, req.getKeyword())
                    && !containsKeyword(entity.getAnnualYear(), req.getKeyword())) {
                continue;
            }
            RecruitSiteAnnualPlanExcel row = new RecruitSiteAnnualPlanExcel();
            row.setAnnualYear(entity.getAnnualYear());
            row.setSiteName(siteName);
            row.setTyshxym(entity.getTyshxym());
            row.setDistrictCode(entity.getDistrictCode());
            row.setSkillServiceCount(entity.getSkillServiceCount());
            row.setOpenServiceCount(entity.getOpenServiceCount());
            row.setServiceRatio(entity.getServiceRatio());
            row.setSituationDesc(entity.getSituationDesc());
            row.setPlanFileKey(entity.getPlanFileKey());
            row.setPlanFileName(entity.getPlanFileName());
            row.setStatus(entity.getStatus());
            row.setReviewer(entity.getReviewer());
            row.setReviewTime(entity.getReviewTime() == null ? null : format.format(entity.getReviewTime()));
            row.setReviewOpinion(entity.getReviewOpinion());
            row.setCreatedBy(entity.getCreatedBy());
            row.setCreatedAt(entity.getCreatedAt() == null ? null : format.format(entity.getCreatedAt()));
            row.setUpdatedBy(entity.getUpdatedBy());
            row.setUpdatedAt(entity.getUpdatedAt() == null ? null : format.format(entity.getUpdatedAt()));
            rows.add(row);
        }
        return rows;
    }

    private List<RecruitSiteAnnualPlanEntity> queryPlanEntities(RecruitSiteAnnualPlanQueryReq req) {
        StringBuilder sql = new StringBuilder(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PLAN WHERE 1=1");
        List<Object> params = new ArrayList<>();
        if (req.getSiteId() != null) {
            sql.append(" AND site_id = ?");
            params.add(req.getSiteId());
        }
        if (isNotBlank(req.getDistrictCode())) {
            sql.append(" AND district_code = ?");
            params.add(req.getDistrictCode());
        }
        if (isNotBlank(req.getAnnualYear())) {
            sql.append(" AND annual_year = ?");
            params.add(req.getAnnualYear());
        }
        if (isNotBlank(req.getStatus())) {
            sql.append(" AND status = ?");
            params.add(req.getStatus());
        }
        sql.append(" ORDER BY updated_at DESC, plan_id DESC");
        return DBUtils.query(sql.toString(), RecruitSiteAnnualPlanEntity.class, params.toArray());
    }

    private boolean containsKeyword(String value, String keyword) {
        return value != null && value.contains(keyword);
    }

    private boolean isNotBlank(String value) {
        return value != null && !value.isBlank();
    }

    private PageResult<RecruitSiteAnnualPlan> doQueryList(RecruitSiteAnnualPlanQueryReq req) {
        PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteAnnualPlanList");
        queryBuilder.parseFilter("siteId", req.getSiteId());
        queryBuilder.parseFilter("districtCode", req.getDistrictCode());
        queryBuilder.parseFilter("annualYear", req.getAnnualYear());
        queryBuilder.parseFilter("status", req.getStatus());
        queryBuilder.parseFilter("keyword", req.getKeyword());
        return queryBuilder.getPage(pageParam, RecruitSiteAnnualPlan.class);
    }

    private RecruitSiteAnnualPlan queryById(Long planId) {
        if (planId == null) {
            throw new BusinessException("年报计划ID不能为空");
        }
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteAnnualPlanList");
        queryBuilder.parseFilter("planId", planId);
        queryBuilder.parseFilter("siteId", null);
        queryBuilder.parseFilter("districtCode", null);
        queryBuilder.parseFilter("annualYear", null);
        queryBuilder.parseFilter("status", null);
        queryBuilder.parseFilter("keyword", null);
        RecruitSiteAnnualPlan plan = queryBuilder.getResult(RecruitSiteAnnualPlan.class);
        if (plan == null) {
            throw new BusinessException("年报计划不存在: " + planId);
        }
        return plan;
    }

    private RecruitSiteAnnualPlanEntity findBySiteAndYear(Long siteId, String annualYear) {
        return DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PLAN " +
                        "WHERE site_id = ? AND annual_year = ?",
                RecruitSiteAnnualPlanEntity.class, siteId, annualYear);
    }

    private RecruitSiteAnnualPlanEntity getEntity(Long planId) {
        return DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PLAN WHERE plan_id = ?",
                RecruitSiteAnnualPlanEntity.class, planId);
    }

    private void insert(RecruitSiteAnnualPlan plan) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_ANNUAL_PLAN " +
                        "(plan_id, site_id, tyshxym, district_code, annual_year, skill_service_count, " +
                        "open_service_count, service_ratio, situation_desc, plan_file_key, plan_file_name, status, " +
                        "reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at) " +
                        "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_ANNUAL_PLAN.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                        "?, ?, ?, ?, ?, ?, ?)",
                plan.getSiteId(),
                plan.getTyshxym(),
                plan.getDistrictCode(),
                plan.getAnnualYear(),
                plan.getSkillServiceCount(),
                plan.getOpenServiceCount(),
                plan.getServiceRatio(),
                plan.getSituationDesc(),
                plan.getPlanFileKey(),
                plan.getPlanFileName(),
                plan.getStatus(),
                plan.getReviewer(),
                plan.getReviewTime(),
                plan.getReviewOpinion(),
                plan.getCreatedBy(),
                plan.getCreatedAt(),
                plan.getUpdatedBy(),
                plan.getUpdatedAt());
        plan.setPlanId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_ANNUAL_PLAN.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteAnnualPlan plan) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_ANNUAL_PLAN SET annual_year = ?, skill_service_count = ?, " +
                        "open_service_count = ?, service_ratio = ?, situation_desc = ?, plan_file_key = ?, " +
                        "plan_file_name = ?, status = ?, reviewer = ?, review_time = ?, review_opinion = ?, " +
                        "updated_by = ?, updated_at = ? WHERE plan_id = ?",
                plan.getAnnualYear(),
                plan.getSkillServiceCount(),
                plan.getOpenServiceCount(),
                plan.getServiceRatio(),
                plan.getSituationDesc(),
                plan.getPlanFileKey(),
                plan.getPlanFileName(),
                plan.getStatus(),
                plan.getReviewer(),
                plan.getReviewTime(),
                plan.getReviewOpinion(),
                plan.getUpdatedBy(),
                plan.getUpdatedAt(),
                plan.getPlanId());
    }

    private void validate(RecruitSiteAnnualPlan plan) {
        if (plan == null) {
            throw new BusinessException("年报计划不能为空");
        }
        if (isBlank(plan.getAnnualYear())) {
            throw new BusinessException("年度年份不能为空");
        }
        if (plan.getSkillServiceCount() == null || plan.getSkillServiceCount() <= 0) {
            throw new BusinessException("技能服务数必须大于0");
        }
        if (plan.getOpenServiceCount() == null || plan.getOpenServiceCount() < 0) {
            throw new BusinessException("面向社会开放服务数不能为空");
        }
        if (isBlank(plan.getPlanFileKey())) {
            throw new BusinessException("年度计划文件不能为空");
        }
    }

    private void validateSubmit(Long skillServiceCount, BigDecimal ratio) {
        if (skillServiceCount < 500) {
            throw new BusinessException("技能服务数小于500人次，无法提交");
        }
        if (skillServiceCount <= 1000) {
            if (ratio.compareTo(BigDecimal.valueOf(20)) <= 0) {
                throw new BusinessException("技能服务数在500-1000人次时，占比需大于20%");
            }
        } else if (ratio.compareTo(BigDecimal.valueOf(10)) <= 0) {
            throw new BusinessException("技能服务数在1000人次以上时，占比需大于10%");
        }
    }

    private BigDecimal calcRatio(Long openServiceCount, Long skillServiceCount) {
        return BigDecimal.valueOf(openServiceCount)
                .multiply(BigDecimal.valueOf(100))
                .divide(BigDecimal.valueOf(skillServiceCount), 4, RoundingMode.HALF_UP);
    }

    private RecruitSiteAnnualPlan toModel(RecruitSiteAnnualPlanEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteAnnualPlan model = new RecruitSiteAnnualPlan();
        model.setPlanId(entity.getPlanId());
        model.setSiteId(entity.getSiteId());
        model.setTyshxym(entity.getTyshxym());
        model.setDistrictCode(entity.getDistrictCode());
        model.setAnnualYear(entity.getAnnualYear());
        model.setSkillServiceCount(entity.getSkillServiceCount());
        model.setOpenServiceCount(entity.getOpenServiceCount());
        model.setServiceRatio(entity.getServiceRatio());
        model.setSituationDesc(entity.getSituationDesc());
        model.setPlanFileKey(entity.getPlanFileKey());
        model.setPlanFileName(entity.getPlanFileName());
        model.setStatus(entity.getStatus());
        model.setReviewer(entity.getReviewer());
        model.setReviewTime(entity.getReviewTime());
        model.setReviewOpinion(entity.getReviewOpinion());
        model.setCreatedBy(entity.getCreatedBy());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedBy(entity.getUpdatedBy());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private RecruitSiteInfo findCorpSite() {
        String cid = ShrsContextUtils.getOrganId();
        if (isBlank(cid)) {
            throw new BusinessException("当前企业未登录");
        }
        QueryBuilder queryBuilder = new QueryBuilder("/admin/block/operate/getCorpDetail");
        queryBuilder.parseFilter("cid", cid);
        RecruitCorpDetailData corpDetail = queryBuilder.getResult(RecruitCorpDetailData.class);
        if (corpDetail == null || isBlank(corpDetail.getTyshxym())) {
            throw new BusinessException("未查询到当前企业信息");
        }
        RecruitSiteInfo siteInfo = siteInfoBPO.findByTyshxym(corpDetail.getTyshxym());
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + corpDetail.getTyshxym());
        }
        return siteInfo;
    }

    private void checkCorpOwner(Long siteId) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (!siteId.equals(siteInfo.getSiteId())) {
            throw new BusinessException("无权查看该年报计划");
        }
    }

    private void applyAdminDistrict(RecruitSiteAnnualPlanQueryReq req) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict)) {
            return;
        }
        if (isBlank(currentDistrict)) {
            throw new BusinessException("当前管理员未配置属地区");
        }
        req.setDistrictCode(currentDistrict);
    }

    private void checkAdminDistrict(String districtCode) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict)) {
            return;
        }
        if (isBlank(currentDistrict) || !currentDistrict.equals(districtCode)) {
            throw new BusinessException("数据越权");
        }
    }

    private String currentAdminOperatorName() {
        String userId = ShrsContextUtils.getUserId();
        return isBlank(userId) ? "管理员" : userId;
    }

    private String currentCorpOperatorName(String fallback) {
        String name = ShrsContextUtils.getOrganName();
        return isBlank(name) ? fallback : name;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
