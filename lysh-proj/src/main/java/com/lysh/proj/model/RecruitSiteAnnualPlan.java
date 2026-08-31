package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 高基地年报计划模型。
 */
public class RecruitSiteAnnualPlan implements ValueObject {
    /** 年报计划ID */
    private Long planId;
    /** 关联基地ID */
    private Long siteId;
    /** 企业统一社会信用代码 */
    private String tyshxym;
    /** 分管区县编码 */
    private String districtCode;
    /** 年度年份 */
    private String annualYear;
    /** 技能服务数，人次 */
    private Long skillServiceCount;
    /** 面向社会开放服务数，人次 */
    private Long openServiceCount;
    /** 开放服务/技能服务占比，百分比值 */
    private BigDecimal serviceRatio;
    /** 上传情况说明，非必填 */
    private String situationDesc;
    /** 年度计划文件存储key */
    private String planFileKey;
    /** 年度计划文件名称 */
    private String planFileName;
    /** 审核状态，待审核/审核通过/待整改 */
    private String status;
    /** 审核人 */
    private String reviewer;
    /** 审核时间 */
    private Date reviewTime;
    /** 审核说明 */
    private String reviewOpinion;
    /** 创建人 */
    private String createdBy;
    /** 创建时间 */
    private Date createdAt;
    /** 修改人 */
    private String updatedBy;
    /** 修改时间 */
    private Date updatedAt;
    /** 基地名称，列表展示 */
    private String siteName;

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
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

    public String getAnnualYear() {
        return annualYear;
    }

    public void setAnnualYear(String annualYear) {
        this.annualYear = annualYear;
    }

    public Long getSkillServiceCount() {
        return skillServiceCount;
    }

    public void setSkillServiceCount(Long skillServiceCount) {
        this.skillServiceCount = skillServiceCount;
    }

    public Long getOpenServiceCount() {
        return openServiceCount;
    }

    public void setOpenServiceCount(Long openServiceCount) {
        this.openServiceCount = openServiceCount;
    }

    public BigDecimal getServiceRatio() {
        return serviceRatio;
    }

    public void setServiceRatio(BigDecimal serviceRatio) {
        this.serviceRatio = serviceRatio;
    }

    public String getSituationDesc() {
        return situationDesc;
    }

    public void setSituationDesc(String situationDesc) {
        this.situationDesc = situationDesc;
    }

    public String getPlanFileKey() {
        return planFileKey;
    }

    public void setPlanFileKey(String planFileKey) {
        this.planFileKey = planFileKey;
    }

    public String getPlanFileName() {
        return planFileName;
    }

    public void setPlanFileName(String planFileName) {
        this.planFileName = planFileName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    public Date getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(Date reviewTime) {
        this.reviewTime = reviewTime;
    }

    public String getReviewOpinion() {
        return reviewOpinion;
    }

    public void setReviewOpinion(String reviewOpinion) {
        this.reviewOpinion = reviewOpinion;
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
}
