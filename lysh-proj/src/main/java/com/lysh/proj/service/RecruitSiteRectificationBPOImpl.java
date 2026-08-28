package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteRectificationEntity;
import com.lysh.proj.model.RecruitCorpDetailData;
import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.model.RecruitSiteRectification;
import com.lysh.proj.model.RecruitSiteRectificationQueryReq;
import com.lysh.proj.model.RecruitSiteRectificationUploadReq;
import com.lysh.proj.model.RecruitSiteWarning;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 高基地预警整改结果业务处理实现类。
 * 整改记录由管理端处理预警时生成，企业端上传整改报告后状态更新为已整改。
 */
@Service
public class RecruitSiteRectificationBPOImpl implements RecruitSiteRectificationBPO {

    private static final String STATUS_PENDING = "待整改";
    private static final String STATUS_FINISHED = "已整改";
    private static final String DISTRICT_CITY = "00";

    private final RecruitSiteInfoBPO siteInfoBPO;

    public RecruitSiteRectificationBPOImpl(RecruitSiteInfoBPO siteInfoBPO) {
        this.siteInfoBPO = siteInfoBPO;
    }

    @Override
    public RecruitSiteRectification createByWarning(RecruitSiteWarning warning, String createdBy) {
        if (warning == null || warning.getWarningId() == null) {
            throw new BusinessException("预警信息不能为空");
        }
        if (existsByWarningId(warning.getWarningId())) {
            throw new BusinessException("该预警已生成整改记录");
        }
        Date now = new Date();
        RecruitSiteRectificationEntity entity = new RecruitSiteRectificationEntity();
        entity.setWarningId(warning.getWarningId());
        entity.setRuleId(warning.getRuleId());
        entity.setRuleCode(warning.getRuleCode());
        entity.setRuleName(warning.getRuleName());
        entity.setTargetType(warning.getTargetType());
        entity.setTargetId(warning.getTargetId());
        entity.setSiteId(warning.getSiteId());
        entity.setProjectId(warning.getProjectId());
        entity.setAssetId(warning.getAssetId());
        entity.setTyshxym(warning.getTyshxym());
        entity.setDistrictCode(warning.getDistrictCode());
        entity.setRectificationStatus(STATUS_PENDING);
        entity.setCreatedBy(createdBy);
        entity.setCreatedAt(now);
        entity.setUpdatedBy(createdBy);
        entity.setUpdatedAt(now);
        insert(entity);
        return toModel(entity);
    }

    @Override
    public PageResult<RecruitSiteRectification> queryAdminList(RecruitSiteRectificationQueryReq req) {
        if (req == null) {
            req = new RecruitSiteRectificationQueryReq();
        }
        applyAdminDistrict(req);
        return doQueryList(req);
    }

    @Override
    public PageResult<RecruitSiteRectification> queryCorpList(RecruitSiteRectificationQueryReq req) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (req == null) {
            req = new RecruitSiteRectificationQueryReq();
        }
        req.setSiteId(siteInfo.getSiteId());
        return doQueryList(req);
    }

    @Override
    public RecruitSiteRectification findAdminById(Long rectificationId) {
        if (rectificationId == null) {
            throw new BusinessException("整改ID不能为空");
        }
        RecruitSiteRectification rectification = queryById(rectificationId);
        if (rectification == null) {
            throw new BusinessException("整改记录不存在: " + rectificationId);
        }
        checkAdminDistrict(rectification.getDistrictCode());
        return rectification;
    }

    @Override
    public RecruitSiteRectification findCorpById(Long rectificationId) {
        if (rectificationId == null) {
            throw new BusinessException("整改ID不能为空");
        }
        RecruitSiteRectification rectification = queryById(rectificationId);
        if (rectification == null) {
            throw new BusinessException("整改记录不存在: " + rectificationId);
        }
        checkCorpOwner(rectification.getSiteId());
        return rectification;
    }

    @Override
    public RecruitSiteRectification uploadByCorp(RecruitSiteRectificationUploadReq req) {
        if (req == null || req.getRectificationId() == null) {
            throw new BusinessException("整改ID不能为空");
        }
        if (isBlank(req.getReportFileKey())) {
            throw new BusinessException("报告文件key不能为空");
        }
        RecruitSiteRectificationEntity entity = getEntity(req.getRectificationId());
        if (entity == null) {
            throw new BusinessException("整改记录不存在: " + req.getRectificationId());
        }
        checkCorpOwner(entity.getSiteId());
        RecruitSiteInfo siteInfo = findCorpSite();
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        Date now = new Date();
        entity.setReportFileKey(req.getReportFileKey());
        entity.setReportFileName(req.getReportFileName());
        entity.setUploaderName(operatorName);
        entity.setUploaderId(ShrsContextUtils.getOrganId());
        entity.setUploadTime(now);
        entity.setRectificationStatus(STATUS_FINISHED);
        entity.setUpdatedBy(operatorName);
        entity.setUpdatedAt(now);
        update(entity);
        return toModel(entity);
    }

    private PageResult<RecruitSiteRectification> doQueryList(RecruitSiteRectificationQueryReq req) {
        PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteRectificationList");
        queryBuilder.parseFilter("rectificationId", null);
        queryBuilder.parseFilter("siteId", req.getSiteId());
        queryBuilder.parseFilter("projectId", req.getProjectId());
        queryBuilder.parseFilter("assetId", req.getAssetId());
        queryBuilder.parseFilter("warningId", req.getWarningId());
        queryBuilder.parseFilter("rectificationStatus", req.getRectificationStatus());
        queryBuilder.parseFilter("districtCode", req.getDistrictCode());
        queryBuilder.parseFilter("keyword", req.getKeyword());
        return queryBuilder.getPage(pageParam, RecruitSiteRectification.class);
    }

    private RecruitSiteRectification queryById(Long rectificationId) {
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteRectificationList");
        queryBuilder.parseFilter("rectificationId", rectificationId);
        queryBuilder.parseFilter("siteId", null);
        queryBuilder.parseFilter("projectId", null);
        queryBuilder.parseFilter("assetId", null);
        queryBuilder.parseFilter("warningId", null);
        queryBuilder.parseFilter("rectificationStatus", null);
        queryBuilder.parseFilter("districtCode", null);
        queryBuilder.parseFilter("keyword", null);
        return queryBuilder.getResult(RecruitSiteRectification.class);
    }

    private boolean existsByWarningId(Long warningId) {
        return DBUtils.getInt(
                "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_RECTIFICATION WHERE warning_id = ?",
                warningId) > 0;
    }

    private RecruitSiteRectificationEntity getEntity(Long rectificationId) {
        return DBUtils.get(
                "SELECT rectification_id, warning_id, rule_id, rule_code, rule_name, target_type, target_id, " +
                        "site_id, project_id, asset_id, tyshxym, district_code, rectification_status, " +
                        "report_file_key, report_file_name, uploader_name, uploader_id, upload_time, " +
                        "created_by, created_at, updated_by, updated_at " +
                        "FROM wsbs.RECRUIT_SITE_RECTIFICATION WHERE rectification_id = ?",
                RecruitSiteRectificationEntity.class, rectificationId);
    }

    private void insert(RecruitSiteRectificationEntity entity) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_RECTIFICATION " +
                        "(rectification_id, warning_id, rule_id, rule_code, rule_name, target_type, target_id, " +
                        "site_id, project_id, asset_id, tyshxym, district_code, rectification_status, " +
                        "report_file_key, report_file_name, uploader_name, uploader_id, upload_time, " +
                        "created_by, created_at, updated_by, updated_at) " +
                        "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_RECTIFICATION.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                        "?, ?, ?, ?, ?, ?, ?, ?, ?)",
                entity.getWarningId(),
                entity.getRuleId(),
                entity.getRuleCode(),
                entity.getRuleName(),
                entity.getTargetType(),
                entity.getTargetId(),
                entity.getSiteId(),
                entity.getProjectId(),
                entity.getAssetId(),
                entity.getTyshxym(),
                entity.getDistrictCode(),
                entity.getRectificationStatus(),
                entity.getReportFileKey(),
                entity.getReportFileName(),
                entity.getUploaderName(),
                entity.getUploaderId(),
                entity.getUploadTime(),
                entity.getCreatedBy(),
                entity.getCreatedAt(),
                entity.getUpdatedBy(),
                entity.getUpdatedAt());
        entity.setRectificationId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_RECTIFICATION.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteRectificationEntity entity) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_RECTIFICATION SET " +
                        "rectification_status = ?, report_file_key = ?, report_file_name = ?, uploader_name = ?, " +
                        "uploader_id = ?, upload_time = ?, updated_by = ?, updated_at = ? WHERE rectification_id = ?",
                entity.getRectificationStatus(),
                entity.getReportFileKey(),
                entity.getReportFileName(),
                entity.getUploaderName(),
                entity.getUploaderId(),
                entity.getUploadTime(),
                entity.getUpdatedBy(),
                entity.getUpdatedAt(),
                entity.getRectificationId());
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
            throw new BusinessException("无权查看该整改记录");
        }
    }

    private void applyAdminDistrict(RecruitSiteRectificationQueryReq req) {
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

    private String currentCorpOperatorName(String fallback) {
        String name = ShrsContextUtils.getOrganName();
        return isBlank(name) ? fallback : name;
    }

    private RecruitSiteRectification toModel(RecruitSiteRectificationEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteRectification model = new RecruitSiteRectification();
        model.setRectificationId(entity.getRectificationId());
        model.setWarningId(entity.getWarningId());
        model.setRuleId(entity.getRuleId());
        model.setRuleCode(entity.getRuleCode());
        model.setRuleName(entity.getRuleName());
        model.setTargetType(entity.getTargetType());
        model.setTargetId(entity.getTargetId());
        model.setSiteId(entity.getSiteId());
        model.setProjectId(entity.getProjectId());
        model.setAssetId(entity.getAssetId());
        model.setTyshxym(entity.getTyshxym());
        model.setDistrictCode(entity.getDistrictCode());
        model.setRectificationStatus(entity.getRectificationStatus());
        model.setReportFileKey(entity.getReportFileKey());
        model.setReportFileName(entity.getReportFileName());
        model.setUploaderName(entity.getUploaderName());
        model.setUploaderId(entity.getUploaderId());
        model.setUploadTime(entity.getUploadTime());
        model.setCreatedBy(entity.getCreatedBy());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedBy(entity.getUpdatedBy());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
