package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地预警结果实体类。
 * 对应表 RECRUIT_SITE_WARNING。
 */
@Entity
@Table(name = "RECRUIT_SITE_WARNING", schema = "WSBS")
public class RecruitSiteWarningEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_WARNING")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_WARNING", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_WARNING")
    @Column(name = "warning_id")
    /** 预警ID */
    private Long warningId;

    @Basic
    @Column(name = "rule_id")
    /** 触发规则ID */
    private Long ruleId;

    @Basic
    @Column(name = "rule_code")
    /** 规则编码快照 */
    private String ruleCode;

    @Basic
    @Column(name = "rule_name")
    /** 规则名称快照 */
    private String ruleName;

    @Basic
    @Column(name = "target_type")
    /** 预警对象类型，1基地/2项目/3资产 */
    private Integer targetType;

    @Basic
    @Column(name = "target_id")
    /** 预警对象主键 */
    private Long targetId;

    @Basic
    @Column(name = "site_id")
    /** 关联基地ID */
    private Long siteId;

    @Basic
    @Column(name = "project_id")
    /** 关联项目ID */
    private Long projectId;

    @Basic
    @Column(name = "asset_id")
    /** 关联资产ID */
    private Long assetId;

    @Basic
    @Column(name = "tyshxym")
    /** 企业统一社会信用代码 */
    private String tyshxym;

    @Basic
    @Column(name = "district_code")
    /** 分管区县编码 */
    private String districtCode;

    @Basic
    @Column(name = "warning_level")
    /** 预警级别快照 */
    private String warningLevel;

    @Basic
    @Column(name = "warning_status")
    /** 预警状态，待处理/已处理/已忽略 */
    private String warningStatus;

    @Basic
    @Column(name = "warning_content")
    /** 预警中文描述 */
    private String warningContent;

    @Basic
    @Column(name = "metric_value")
    /** 触发时实际值 */
    private String metricValue;

    @Basic
    @Column(name = "threshold_value")
    /** 触发时阈值快照 */
    private String thresholdValue;

    @Basic
    @Column(name = "first_trigger_time")
    /** 首次触发时间 */
    private Date firstTriggerTime;

    @Basic
    @Column(name = "last_trigger_time")
    /** 最近触发时间 */
    private Date lastTriggerTime;

    @Basic
    @Column(name = "trigger_count")
    /** 累计触发次数 */
    private Long triggerCount;

    @Basic
    @Column(name = "handle_by")
    /** 处理人 */
    private String handleBy;

    @Basic
    @Column(name = "handle_time")
    /** 处理时间 */
    private Date handleTime;

    @Basic
    @Column(name = "handle_remark")
    /** 处理说明 */
    private String handleRemark;

    @Basic
    @Column(name = "created_at")
    /** 创建时间 */
    private Date createdAt;

    @Basic
    @Column(name = "updated_at")
    /** 修改时间 */
    private Date updatedAt;

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
}
