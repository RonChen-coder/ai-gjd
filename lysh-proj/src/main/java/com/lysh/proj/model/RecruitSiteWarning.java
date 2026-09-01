package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.util.Date;

/**
 * 高基地预警结果模型。
 * 对应表 RECRUIT_SITE_WARNING，另带基地/项目/资产名称用于列表展示。
 */
public class RecruitSiteWarning implements ValueObject {
    /** 预警ID */
    private Long warningId;
    /** 触发规则ID */
    private Long ruleId;
    /** 规则编码快照 */
    private String ruleCode;
    /** 规则名称快照 */
    private String ruleName;
    /** 预警对象类型，1基地/2项目/3资产/4年报计划 */
    private Integer targetType;
    /** 预警对象主键 */
    private Long targetId;
    /** 关联基地ID */
    private Long siteId;
    /** 关联项目ID */
    private Long projectId;
    /** 关联资产ID */
    private Long assetId;
    /** 企业统一社会信用代码 */
    private String tyshxym;
    /** 分管区县编码 */
    private String districtCode;
    /** 预警级别快照 */
    private String warningLevel;
    /** 预警状态，待处理/已处理/已忽略 */
    private String warningStatus;
    /** 预警中文描述 */
    private String warningContent;
    /** 触发时实际值 */
    private String metricValue;
    /** 触发时阈值快照 */
    private String thresholdValue;
    /** 首次触发时间 */
    private Date firstTriggerTime;
    /** 最近触发时间 */
    private Date lastTriggerTime;
    /** 累计触发次数 */
    private Long triggerCount;
    /** 处理人 */
    private String handleBy;
    /** 处理时间 */
    private Date handleTime;
    /** 处理说明 */
    private String handleRemark;
    /** 创建时间 */
    private Date createdAt;
    /** 修改时间 */
    private Date updatedAt;
    /** 基地名称，列表关联展示 */
    private String siteName;
    /** 项目名称，列表关联展示 */
    private String projectName;
    /** 资产名称，列表关联展示 */
    private String assetName;

    public Long getWarningId() {
        return warningId;
    }

    public void setWarningId(Long warningId) {
        this.warningId = warningId;
    }

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    public String getRuleCode() {
        return ruleCode;
    }

    public void setRuleCode(String ruleCode) {
        this.ruleCode = ruleCode;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public Integer getTargetType() {
        return targetType;
    }

    public void setTargetType(Integer targetType) {
        this.targetType = targetType;
    }

    public Long getTargetId() {
        return targetId;
    }

    public void setTargetId(Long targetId) {
        this.targetId = targetId;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getAssetId() {
        return assetId;
    }

    public void setAssetId(Long assetId) {
        this.assetId = assetId;
    }

    public String getTyshxym() {
        return tyshxym;
    }

    public void setTyshxym(String tyshxym) {
        this.tyshxym = tyshxym;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(String warningLevel) {
        this.warningLevel = warningLevel;
    }

    public String getWarningStatus() {
        return warningStatus;
    }

    public void setWarningStatus(String warningStatus) {
        this.warningStatus = warningStatus;
    }

    public String getWarningContent() {
        return warningContent;
    }

    public void setWarningContent(String warningContent) {
        this.warningContent = warningContent;
    }

    public String getMetricValue() {
        return metricValue;
    }

    public void setMetricValue(String metricValue) {
        this.metricValue = metricValue;
    }

    public String getThresholdValue() {
        return thresholdValue;
    }

    public void setThresholdValue(String thresholdValue) {
        this.thresholdValue = thresholdValue;
    }

    public Date getFirstTriggerTime() {
        return firstTriggerTime;
    }

    public void setFirstTriggerTime(Date firstTriggerTime) {
        this.firstTriggerTime = firstTriggerTime;
    }

    public Date getLastTriggerTime() {
        return lastTriggerTime;
    }

    public void setLastTriggerTime(Date lastTriggerTime) {
        this.lastTriggerTime = lastTriggerTime;
    }

    public Long getTriggerCount() {
        return triggerCount;
    }

    public void setTriggerCount(Long triggerCount) {
        this.triggerCount = triggerCount;
    }

    public String getHandleBy() {
        return handleBy;
    }

    public void setHandleBy(String handleBy) {
        this.handleBy = handleBy;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public String getHandleRemark() {
        return handleRemark;
    }

    public void setHandleRemark(String handleRemark) {
        this.handleRemark = handleRemark;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }
}
