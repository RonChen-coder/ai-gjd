package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地预警规则配置实体类。
 * 对应表 RECRUIT_SITE_WARNING_RULE。
 */
@Entity
@Table(name = "RECRUIT_SITE_WARNING_RULE", schema = "WSBS")
public class RecruitSiteWarningRuleEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_WARNING_RULE")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_WARNING_RULE", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_WARNING_RULE")
    @Column(name = "rule_id")
    /** 规则ID */
    private Long ruleId;

    @Basic
    @Column(name = "rule_code")
    /** 规则编码 */
    private String ruleCode;

    @Basic
    @Column(name = "rule_name")
    /** 规则名称 */
    private String ruleName;

    @Basic
    @Column(name = "target_type")
    /** 预警对象类型，1基地/2项目/3资产 */
    private Integer targetType;

    @Basic
    @Column(name = "warning_level")
    /** 预警级别，严重/一般 */
    private String warningLevel;

    @Basic
    @Column(name = "condition_config")
    /** 规则条件参数，JSON格式 */
    private String conditionConfig;

    @Basic
    @Column(name = "content_template")
    /** 预警文案模板 */
    private String contentTemplate;

    @Basic
    @Column(name = "description")
    /** 规则说明 */
    private String description;

    @Basic
    @Column(name = "enabled")
    /** 是否启用 */
    private Boolean enabled;

    @Basic
    @Column(name = "sort_no")
    /** 排序号 */
    private Long sortNo;

    @Basic
    @Column(name = "created_by")
    /** 创建人 */
    private String createdBy;

    @Basic
    @Column(name = "created_at")
    /** 创建时间 */
    private Date createdAt;

    @Basic
    @Column(name = "updated_by")
    /** 修改人 */
    private String updatedBy;

    @Basic
    @Column(name = "updated_at")
    /** 修改时间 */
    private Date updatedAt;

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

    public String getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(String warningLevel) {
        this.warningLevel = warningLevel;
    }

    public String getConditionConfig() {
        return conditionConfig;
    }

    public void setConditionConfig(String conditionConfig) {
        this.conditionConfig = conditionConfig;
    }

    public String getContentTemplate() {
        return contentTemplate;
    }

    public void setContentTemplate(String contentTemplate) {
        this.contentTemplate = contentTemplate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Long getSortNo() {
        return sortNo;
    }

    public void setSortNo(Long sortNo) {
        this.sortNo = sortNo;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
