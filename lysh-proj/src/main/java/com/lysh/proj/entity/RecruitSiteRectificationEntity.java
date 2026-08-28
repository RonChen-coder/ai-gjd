package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地预警整改结果实体类。
 * 对应表 RECRUIT_SITE_RECTIFICATION。
 */
@Entity
@Table(name = "RECRUIT_SITE_RECTIFICATION", schema = "WSBS")
public class RecruitSiteRectificationEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_RECTIFICATION")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_RECTIFICATION", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_RECTIFICATION")
    @Column(name = "rectification_id")
    /** 整改ID */
    private Long rectificationId;

    @Basic
    @Column(name = "warning_id")
    /** 关联预警ID */
    private Long warningId;

    @Basic
    @Column(name = "rule_id")
    /** 关联规则ID */
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
    /** 预警对象类型 */
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
    @Column(name = "rectification_status")
    /** 整改状态，待整改/已整改 */
    private String rectificationStatus;

    @Basic
    @Column(name = "report_file_key")
    /** 整改报告文件存储key */
    private String reportFileKey;

    @Basic
    @Column(name = "report_file_name")
    /** 整改报告文件名称 */
    private String reportFileName;

    @Basic
    @Column(name = "uploader_name")
    /** 上传人 */
    private String uploaderName;

    @Basic
    @Column(name = "uploader_id")
    /** 上传人编号 */
    private String uploaderId;

    @Basic
    @Column(name = "upload_time")
    /** 上传时间 */
    private Date uploadTime;

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
}
