package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.util.Date;

/**
 * 高基地预警整改结果模型。
 * 对应表 RECRUIT_SITE_RECTIFICATION，另带基地/项目/资产名称用于列表展示。
 */
public class RecruitSiteRectification implements ValueObject {
    /** 整改ID */
    private Long rectificationId;
    /** 关联预警ID */
    private Long warningId;
    /** 关联规则ID */
    private Long ruleId;
    /** 规则编码快照 */
    private String ruleCode;
    /** 规则名称快照 */
    private String ruleName;
    /** 预警对象类型 */
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
    /** 整改状态，待整改/已整改 */
    private String rectificationStatus;
    /** 整改报告文件存储key */
    private String reportFileKey;
    /** 整改报告文件名称 */
    private String reportFileName;
    /** 上传人 */
    private String uploaderName;
    /** 上传人编号 */
    private String uploaderId;
    /** 上传时间 */
    private Date uploadTime;
    /** 创建人 */
    private String createdBy;
    /** 创建时间 */
    private Date createdAt;
    /** 修改人 */
    private String updatedBy;
    /** 修改时间 */
    private Date updatedAt;
    /** 基地名称，列表关联展示 */
    private String siteName;
    /** 项目名称，列表关联展示 */
    private String projectName;
    /** 资产名称，列表关联展示 */
    private String assetName;

    public Long getRectificationId() {
        return rectificationId;
    }

    public void setRectificationId(Long rectificationId) {
        this.rectificationId = rectificationId;
    }

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

    public String getRectificationStatus() {
        return rectificationStatus;
    }

    public void setRectificationStatus(String rectificationStatus) {
        this.rectificationStatus = rectificationStatus;
    }

    public String getReportFileKey() {
        return reportFileKey;
    }

    public void setReportFileKey(String reportFileKey) {
        this.reportFileKey = reportFileKey;
    }

    public String getReportFileName() {
        return reportFileName;
    }

    public void setReportFileName(String reportFileName) {
        this.reportFileName = reportFileName;
    }

    public String getUploaderName() {
        return uploaderName;
    }

    public void setUploaderName(String uploaderName) {
        this.uploaderName = uploaderName;
    }

    public String getUploaderId() {
        return uploaderId;
    }

    public void setUploaderId(String uploaderId) {
        this.uploaderId = uploaderId;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
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
