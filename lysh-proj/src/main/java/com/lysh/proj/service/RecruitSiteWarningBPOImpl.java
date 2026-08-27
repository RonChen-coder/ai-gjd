package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteWarningEntity;
import com.lysh.proj.model.RecruitSiteWarning;
import com.lysh.proj.model.RecruitSiteWarningQueryReq;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 高基地预警结果业务处理实现类。
 * 列表使用 QueryBuilder 分页，处理操作直接更新预警状态和处理信息。
 */
@Service
public class RecruitSiteWarningBPOImpl implements RecruitSiteWarningBPO {

    private static final String STATUS_HANDLED = "已处理";
    private static final String STATUS_IGNORED = "已忽略";
    private static final String DISTRICT_CITY = "00";
    private static final String COLUMNS = "warning_id, rule_id, rule_code, rule_name, target_type, target_id, " +
            "site_id, project_id, asset_id, tyshxym, district_code, warning_level, warning_status, " +
            "warning_content, metric_value, threshold_value, first_trigger_time, last_trigger_time, " +
            "trigger_count, handle_by, handle_time, handle_remark, created_at, updated_at";

    @Override
    public PageResult<RecruitSiteWarning> queryList(RecruitSiteWarningQueryReq req) {
        if (req == null) {
            req = new RecruitSiteWarningQueryReq();
        }
        applyAdminDistrict(req);
        PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteWarningList");
        queryBuilder.parseFilter("siteId", req.getSiteId());
        queryBuilder.parseFilter("projectId", req.getProjectId());
        queryBuilder.parseFilter("assetId", req.getAssetId());
        queryBuilder.parseFilter("targetType", req.getTargetType());
        queryBuilder.parseFilter("warningLevel", req.getWarningLevel());
        queryBuilder.parseFilter("warningStatus", req.getWarningStatus());
        queryBuilder.parseFilter("districtCode", req.getDistrictCode());
        queryBuilder.parseFilter("keyword", req.getKeyword());
        return queryBuilder.getPage(pageParam, RecruitSiteWarning.class);
    }

    @Override
    public RecruitSiteWarning findById(Long warningId) {
        if (warningId == null) {
            throw new BusinessException("预警ID不能为空");
        }
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteWarningList");
        queryBuilder.parseFilter("warningId", warningId);
        RecruitSiteWarning warning = queryBuilder.getResult(RecruitSiteWarning.class);
        if (warning == null) {
            throw new BusinessException("预警信息不存在: " + warningId);
        }
        checkAdminDistrict(warning.getDistrictCode());
        return warning;
    }

    @Override
    public RecruitSiteWarning handle(Long warningId, String status, String remark) {
        if (warningId == null) {
            throw new BusinessException("预警ID不能为空");
        }
        if (!STATUS_HANDLED.equals(status) && !STATUS_IGNORED.equals(status)) {
            throw new BusinessException("处理结果只能为已处理或已忽略");
        }
        RecruitSiteWarningEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_WARNING WHERE warning_id = ?",
                RecruitSiteWarningEntity.class, warningId);
        if (entity == null) {
            throw new BusinessException("预警信息不存在: " + warningId);
        }
        checkAdminDistrict(entity.getDistrictCode());
        Date now = new Date();
        entity.setWarningStatus(status);
        entity.setHandleBy(currentAdminOperatorName());
        entity.setHandleTime(now);
        entity.setHandleRemark(remark);
        entity.setUpdatedAt(now);
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_WARNING SET warning_status = ?, handle_by = ?, " +
                        "handle_time = ?, handle_remark = ?, updated_at = ? WHERE warning_id = ?",
                entity.getWarningStatus(),
                entity.getHandleBy(),
                entity.getHandleTime(),
                entity.getHandleRemark(),
                entity.getUpdatedAt(),
                warningId);
        return toModel(entity);
    }

    private void applyAdminDistrict(RecruitSiteWarningQueryReq req) {
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

    private RecruitSiteWarning toModel(RecruitSiteWarningEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteWarning model = new RecruitSiteWarning();
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
        model.setWarningLevel(entity.getWarningLevel());
        model.setWarningStatus(entity.getWarningStatus());
        model.setWarningContent(entity.getWarningContent());
        model.setMetricValue(entity.getMetricValue());
        model.setThresholdValue(entity.getThresholdValue());
        model.setFirstTriggerTime(entity.getFirstTriggerTime());
        model.setLastTriggerTime(entity.getLastTriggerTime());
        model.setTriggerCount(entity.getTriggerCount());
        model.setHandleBy(entity.getHandleBy());
        model.setHandleTime(entity.getHandleTime());
        model.setHandleRemark(entity.getHandleRemark());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
