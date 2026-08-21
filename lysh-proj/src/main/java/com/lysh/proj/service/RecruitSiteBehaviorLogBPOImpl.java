package com.lysh.proj.service;

import com.lysh.proj.common.BehaviorBizType;
import com.lysh.proj.entity.RecruitSiteBehaviorLogEntity;
import com.lysh.proj.model.RecruitSiteBehaviorLog;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 行为日志业务处理实现类。
 * 使用 DBUtils 写入和查询 RECRUIT_SITE_BEHAVIOR_LOG。
 */
@Service
public class RecruitSiteBehaviorLogBPOImpl implements RecruitSiteBehaviorLogBPO {

    private static final String COLUMNS = "log_id, biz_type, biz_id, operator_name, operator_id, operator_role, " +
            "operation_type, field_name, old_value, new_value, log_content, created_at";

    @Override
    public void record(RecruitSiteBehaviorLog log) {
        Date now = new Date();
        if (isBlank(log.getOperatorName())) {
            log.setOperatorName("系统用户");
        }
        if (isBlank(log.getOperationType())) {
            log.setOperationType("修改");
        }
        if (isBlank(log.getFieldName())) {
            log.setFieldName("未知字段");
        }
        if (log.getCreatedAt() == null) {
            log.setCreatedAt(now);
        }
        if (isBlank(log.getLogContent())) {
            BehaviorBizType bizType = BehaviorBizType.fromCode(log.getBizType());
            String bizTypeLabel = bizType == null ? "业务对象" : bizType.getLabel();
            log.setLogContent("操作人【" + orEmpty(log.getOperatorName()) + "】" + orEmpty(log.getOperationType()) +
                    "了" + bizTypeLabel + "信息字段【" + orEmpty(log.getFieldName()) + "】，" +
                    "由【" + orEmpty(log.getOldValue()) + "】变更为【" + orEmpty(log.getNewValue()) + "】");
        }
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_BEHAVIOR_LOG " +
                        "(log_id, biz_type, biz_id, operator_name, operator_id, operator_role, operation_type, " +
                        "field_name, old_value, new_value, log_content, created_at) " +
                        "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                log.getBizType(),
                log.getBizId(),
                log.getOperatorName(),
                log.getOperatorId(),
                log.getOperatorRole(),
                log.getOperationType(),
                log.getFieldName(),
                log.getOldValue(),
                log.getNewValue(),
                log.getLogContent(),
                log.getCreatedAt());
        log.setLogId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG.CURRVAL FROM DUAL")));
    }

    @Override
    public List<RecruitSiteBehaviorLog> listByBiz(Integer bizType, Long bizId) {
        List<RecruitSiteBehaviorLogEntity> entities = DBUtils.query(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_BEHAVIOR_LOG " +
                        "WHERE biz_type = ? AND biz_id = ? ORDER BY created_at DESC, log_id DESC",
                RecruitSiteBehaviorLogEntity.class, bizType, bizId);
        return toModels(entities);
    }

    private List<RecruitSiteBehaviorLog> toModels(List<RecruitSiteBehaviorLogEntity> entities) {
        List<RecruitSiteBehaviorLog> models = new ArrayList<>();
        for (RecruitSiteBehaviorLogEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteBehaviorLog toModel(RecruitSiteBehaviorLogEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteBehaviorLog model = new RecruitSiteBehaviorLog();
        model.setLogId(entity.getLogId());
        model.setBizType(entity.getBizType());
        model.setBizId(entity.getBizId());
        model.setOperatorName(entity.getOperatorName());
        model.setOperatorId(entity.getOperatorId());
        model.setOperatorRole(entity.getOperatorRole());
        model.setOperationType(entity.getOperationType());
        model.setFieldName(entity.getFieldName());
        model.setOldValue(entity.getOldValue());
        model.setNewValue(entity.getNewValue());
        model.setLogContent(entity.getLogContent());
        model.setCreatedAt(entity.getCreatedAt());
        return model;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }

    private String orEmpty(String value) {
        return value == null ? "" : value;
    }
}
