package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地行为日志实体类。
 * 对应表 RECRUIT_SITE_BEHAVIOR_LOG。
 */
@Entity
@Table(name = "RECRUIT_SITE_BEHAVIOR_LOG", schema = "WSBS")
public class RecruitSiteBehaviorLogEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG")
    @Column(name = "log_id")
    private Long logId;

    @Basic
    @Column(name = "biz_type")
    private Integer bizType;

    @Basic
    @Column(name = "biz_id")
    private Long bizId;

    @Basic
    @Column(name = "operator_name")
    private String operatorName;

    @Basic
    @Column(name = "operator_id")
    private String operatorId;

    @Basic
    @Column(name = "operator_role")
    private String operatorRole;

    @Basic
    @Column(name = "operation_type")
    private String operationType;

    @Basic
    @Column(name = "field_name")
    private String fieldName;

    @Basic
    @Column(name = "old_value")
    private String oldValue;

    @Basic
    @Column(name = "new_value")
    private String newValue;

    @Basic
    @Column(name = "log_content")
    private String logContent;

    @Basic
    @Column(name = "created_at")
    private Date createdAt;

    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    public Integer getBizType() {
        return bizType;
    }

    public void setBizType(Integer bizType) {
        this.bizType = bizType;
    }

    public Long getBizId() {
        return bizId;
    }

    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperatorRole() {
        return operatorRole;
    }

    public void setOperatorRole(String operatorRole) {
        this.operatorRole = operatorRole;
    }

    public String getOperationType() {
        return operationType;
    }

    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getNewValue() {
        return newValue;
    }

    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
