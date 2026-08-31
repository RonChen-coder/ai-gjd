package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteAnnualPerformanceEntity;
import com.lysh.proj.model.RecruitCorpDetailData;
import com.lysh.proj.model.RecruitSiteAnnualPerformance;
import com.lysh.proj.model.RecruitSiteAnnualPerformanceQueryReq;
import com.lysh.proj.model.RecruitSiteInfo;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

/**
 * 高基地年度绩效业务处理实现类。
 * 企业填报绩效表单并上传情况说明，区管理员进行评分。
 */
@Service
public class RecruitSiteAnnualPerformanceBPOImpl implements RecruitSiteAnnualPerformanceBPO {

    private static final String STATUS_UNSCORED = "0";
    private static final String STATUS_SCORED = "1";
    private static final String DISTRICT_CITY = "00";
    private static final String COLUMNS = "performance_id, site_id, tyshxym, district_code, annual_year, " +
            "skill_service_count, open_service_count, service_ratio, situation_desc, performance_file_key, " +
            "performance_file_name, status, score, score_opinion, scorer, score_time, created_by, created_at, " +
            "updated_by, updated_at";

    private final RecruitSiteInfoBPO siteInfoBPO;

    public RecruitSiteAnnualPerformanceBPOImpl(RecruitSiteInfoBPO siteInfoBPO) {
        this.siteInfoBPO = siteInfoBPO;
    }

    @Override
    public RecruitSiteAnnualPerformance saveByCorp(RecruitSiteAnnualPerformance performance) {
        RecruitSiteInfo siteInfo = findCorpSite();
        validate(performance);
        BigDecimal ratio = calcRatio(performance.getOpenServiceCount(), performance.getSkillServiceCount());
        validateSubmit(performance.getSkillServiceCount(), ratio, performance.getSituationDesc());
        Date now = new Date();
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        performance.setSiteId(siteInfo.getSiteId());
        performance.setTyshxym(siteInfo.getTyshxym());
        performance.setDistrictCode(siteInfo.getDistrictCode());
        performance.setServiceRatio(ratio);
        performance.setStatus(STATUS_UNSCORED);
        RecruitSiteAnnualPerformanceEntity existing = findBySiteAndYear(siteInfo.getSiteId(), performance.getAnnualYear());
        if (existing == null) {
            performance.setCreatedBy(operatorName);
            performance.setCreatedAt(now);
            performance.setUpdatedBy(operatorName);
            performance.setUpdatedAt(now);
            insert(performance);
        } else {
            if (STATUS_SCORED.equals(existing.getStatus())) {
                throw new BusinessException("年度绩效已评分，不能修改");
            }
            performance.setPerformanceId(existing.getPerformanceId());
            performance.setCreatedBy(existing.getCreatedBy());
            performance.setCreatedAt(existing.getCreatedAt());
            performance.setUpdatedBy(operatorName);
            performance.setUpdatedAt(now);
            update(performance);
        }
        return performance;
    }

    @Override
    public PageResult<RecruitSiteAnnualPerformance> queryCorpList(RecruitSiteAnnualPerformanceQueryReq req) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (req == null) {
            req = new RecruitSiteAnnualPerformanceQueryReq();
        }
        req.setSiteId(siteInfo.getSiteId());
        return doQueryList(req);
    }

    @Override
    public RecruitSiteAnnualPerformance findCorpById(Long performanceId) {
        RecruitSiteAnnualPerformance performance = queryById(performanceId);
        checkCorpOwner(performance.getSiteId());
        return performance;
    }

    @Override
    public PageResult<RecruitSiteAnnualPerformance> queryAdminList(RecruitSiteAnnualPerformanceQueryReq req) {
        if (req == null) {
            req = new RecruitSiteAnnualPerformanceQueryReq();
        }
        applyAdminDistrict(req);
        return doQueryList(req);
    }

    @Override
    public RecruitSiteAnnualPerformance findAdminById(Long performanceId) {
        RecruitSiteAnnualPerformance performance = queryById(performanceId);
        checkAdminDistrict(performance.getDistrictCode());
        return performance;
    }

    @Override
    public RecruitSiteAnnualPerformance score(Long performanceId, BigDecimal score, String scoreOpinion) {
        if (score == null) {
            throw new BusinessException("评分不能为空");
        }
        RecruitSiteAnnualPerformanceEntity entity = getEntity(performanceId);
        if (entity == null) {
            throw new BusinessException("年度绩效不存在: " + performanceId);
        }
        checkAdminDistrict(entity.getDistrictCode());
        Date now = new Date();
        entity.setScore(score);
        entity.setScoreOpinion(scoreOpinion);
        entity.setScorer(currentAdminOperatorName());
        entity.setScoreTime(now);
        entity.setStatus(STATUS_SCORED);
        entity.setUpdatedAt(now);
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_ANNUAL_PERFORMANCE SET score = ?, score_opinion = ?, " +
                        "scorer = ?, score_time = ?, status = ?, updated_at = ? WHERE performance_id = ?",
                entity.getScore(), entity.getScoreOpinion(), entity.getScorer(), entity.getScoreTime(),
                entity.getStatus(), entity.getUpdatedAt(), performanceId);
        return toModel(entity);
    }

    private PageResult<RecruitSiteAnnualPerformance> doQueryList(RecruitSiteAnnualPerformanceQueryReq req) {
        PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteAnnualPerformanceList");
        queryBuilder.parseFilter("siteId", req.getSiteId());
        queryBuilder.parseFilter("districtCode", req.getDistrictCode());
        queryBuilder.parseFilter("annualYear", req.getAnnualYear());
        queryBuilder.parseFilter("status", req.getStatus());
        queryBuilder.parseFilter("keyword", req.getKeyword());
        return queryBuilder.getPage(pageParam, RecruitSiteAnnualPerformance.class);
    }

    private RecruitSiteAnnualPerformance queryById(Long performanceId) {
        if (performanceId == null) {
            throw new BusinessException("年度绩效ID不能为空");
        }
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteAnnualPerformanceList");
        queryBuilder.parseFilter("performanceId", performanceId);
        queryBuilder.parseFilter("siteId", null);
        queryBuilder.parseFilter("districtCode", null);
        queryBuilder.parseFilter("annualYear", null);
        queryBuilder.parseFilter("status", null);
        queryBuilder.parseFilter("keyword", null);
        RecruitSiteAnnualPerformance performance = queryBuilder.getResult(RecruitSiteAnnualPerformance.class);
        if (performance == null) {
            throw new BusinessException("年度绩效不存在: " + performanceId);
        }
        return performance;
    }

    private RecruitSiteAnnualPerformanceEntity findBySiteAndYear(Long siteId, String annualYear) {
        return DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PERFORMANCE " +
                        "WHERE site_id = ? AND annual_year = ?",
                RecruitSiteAnnualPerformanceEntity.class, siteId, annualYear);
    }

    private RecruitSiteAnnualPerformanceEntity getEntity(Long performanceId) {
        return DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PERFORMANCE WHERE performance_id = ?",
                RecruitSiteAnnualPerformanceEntity.class, performanceId);
    }

    private void insert(RecruitSiteAnnualPerformance performance) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_ANNUAL_PERFORMANCE " +
                        "(performance_id, site_id, tyshxym, district_code, annual_year, skill_service_count, " +
                        "open_service_count, service_ratio, situation_desc, performance_file_key, " +
                        "performance_file_name, status, score, score_opinion, scorer, score_time, " +
                        "created_by, created_at, updated_by, updated_at) " +
                        "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_ANNUAL_PERFORMANCE.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                performance.getSiteId(),
                performance.getTyshxym(),
                performance.getDistrictCode(),
                performance.getAnnualYear(),
                performance.getSkillServiceCount(),
                performance.getOpenServiceCount(),
                performance.getServiceRatio(),
                performance.getSituationDesc(),
                performance.getPerformanceFileKey(),
                performance.getPerformanceFileName(),
                performance.getStatus(),
                performance.getScore(),
                performance.getScoreOpinion(),
                performance.getScorer(),
                performance.getScoreTime(),
                performance.getCreatedBy(),
                performance.getCreatedAt(),
                performance.getUpdatedBy(),
                performance.getUpdatedAt());
        performance.setPerformanceId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_ANNUAL_PERFORMANCE.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteAnnualPerformance performance) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_ANNUAL_PERFORMANCE SET annual_year = ?, skill_service_count = ?, " +
                        "open_service_count = ?, service_ratio = ?, situation_desc = ?, performance_file_key = ?, " +
                        "performance_file_name = ?, status = ?, updated_by = ?, updated_at = ? WHERE performance_id = ?",
                performance.getAnnualYear(),
                performance.getSkillServiceCount(),
                performance.getOpenServiceCount(),
                performance.getServiceRatio(),
                performance.getSituationDesc(),
                performance.getPerformanceFileKey(),
                performance.getPerformanceFileName(),
                performance.getStatus(),
                performance.getUpdatedBy(),
                performance.getUpdatedAt(),
                performance.getPerformanceId());
    }

    private void validate(RecruitSiteAnnualPerformance performance) {
        if (performance == null) {
            throw new BusinessException("年度绩效不能为空");
        }
        if (isBlank(performance.getAnnualYear())) {
            throw new BusinessException("年度年份不能为空");
        }
        if (performance.getSkillServiceCount() == null || performance.getSkillServiceCount() <= 0) {
            throw new BusinessException("技能服务数必须大于0");
        }
        if (performance.getOpenServiceCount() == null || performance.getOpenServiceCount() < 0) {
            throw new BusinessException("面向社会开放服务数不能为空");
        }
        if (isBlank(performance.getPerformanceFileKey())) {
            throw new BusinessException("年度绩效文件不能为空");
        }
        if (isBlank(performance.getSituationDesc())) {
            throw new BusinessException("上传情况说明不能为空");
        }
    }

    private void validateSubmit(Long skillServiceCount, BigDecimal ratio, String situationDesc) {
        if (skillServiceCount < 500) {
            return;
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

    private RecruitSiteAnnualPerformance toModel(RecruitSiteAnnualPerformanceEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteAnnualPerformance model = new RecruitSiteAnnualPerformance();
        model.setPerformanceId(entity.getPerformanceId());
        model.setSiteId(entity.getSiteId());
        model.setTyshxym(entity.getTyshxym());
        model.setDistrictCode(entity.getDistrictCode());
        model.setAnnualYear(entity.getAnnualYear());
        model.setSkillServiceCount(entity.getSkillServiceCount());
        model.setOpenServiceCount(entity.getOpenServiceCount());
        model.setServiceRatio(entity.getServiceRatio());
        model.setSituationDesc(entity.getSituationDesc());
        model.setPerformanceFileKey(entity.getPerformanceFileKey());
        model.setPerformanceFileName(entity.getPerformanceFileName());
        model.setStatus(entity.getStatus());
        model.setScore(entity.getScore());
        model.setScoreOpinion(entity.getScoreOpinion());
        model.setScorer(entity.getScorer());
        model.setScoreTime(entity.getScoreTime());
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
            throw new BusinessException("无权查看该年度绩效");
        }
    }

    private void applyAdminDistrict(RecruitSiteAnnualPerformanceQueryReq req) {
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
