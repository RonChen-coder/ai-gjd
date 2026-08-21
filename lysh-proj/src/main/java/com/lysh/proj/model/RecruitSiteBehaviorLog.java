package com.lysh.proj.model;

import java.util.Date;

/**
 * 行为日志模型。
 * 记录谁在什么时间修改了哪个业务对象的哪个字段。
 */
public class RecruitSiteBehaviorLog {
    /** 日志ID */
    private Long logId;
    /** 业务对象类型编码，1基地/2项目/3资产 */
    private Integer bizType;
    /** 业务对象主键 */
    private Long bizId;
    /** 操作人姓名 */
    private String operatorName;
    /** 操作人编号 */
    private String operatorId;
    /** 操作角色，市级管理员/区级管理员/基地申报单位 */
    private String operatorRole;
    /** 操作类型，修改/审核/上传/删除 */
    private String operationType;
    /** 变更字段名称 */
    private String fieldName;
    /** 变更前内容 */
    private String oldValue;
    /** 变更后内容 */
    private String newValue;
    /** 中文行为日志描述 */
    private String logContent;
    /** 日志生成时间 */
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
