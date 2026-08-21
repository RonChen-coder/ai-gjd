package com.lysh.proj.model;

import java.util.Date;

/**
 * 高基地信息模型。
 * 对应表 RECRUIT_SITE_INFO，字段与实体类保持一致。
 */
public class RecruitSiteInfo {
    /** 基地ID */
    private Long siteId;
    /** 企业统一社会信用代码 */
    private String tyshxym;
    /** 单位名称 */
    private String companyName;
    /** 基地名称 */
    private String siteName;
    /** 挂牌年份 */
    private String listingYear;
    /** 基地类别，字典取值 */
    private String siteCategory;
    /** 所属行业类别，字典取值 */
    private String industryCategory;
    /** 属地区编码 */
    private String districtCode;
    /** 上级主管部门 */
    private String superiorDepartment;
    /** 基地地址 */
    private String siteAddress;
    /** 基地简介 */
    private String siteIntro;
    /** 状态，待完善/待审核/已通过/已驳回 */
    private String status;
    /** 审核人 */
    private String reviewer;
    /** 审核时间 */
    private Date reviewTime;
    /** 审核意见 */
    private String reviewOpinion;
    /** 归档状态，未归档/已归档 */
    private String archiveStatus;
    /** 创建人 */
    private String createdBy;
    /** 创建时间 */
    private Date createdAt;
    /** 修改人 */
    private String updatedBy;
    /** 修改时间 */
    private Date updatedAt;

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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getListingYear() {
        return listingYear;
    }

    public void setListingYear(String listingYear) {
        this.listingYear = listingYear;
    }

    public String getSiteCategory() {
        return siteCategory;
    }

    public void setSiteCategory(String siteCategory) {
        this.siteCategory = siteCategory;
    }

    public String getIndustryCategory() {
        return industryCategory;
    }

    public void setIndustryCategory(String industryCategory) {
        this.industryCategory = industryCategory;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getSuperiorDepartment() {
        return superiorDepartment;
    }

    public void setSuperiorDepartment(String superiorDepartment) {
        this.superiorDepartment = superiorDepartment;
    }

    public String getSiteAddress() {
        return siteAddress;
    }

    public void setSiteAddress(String siteAddress) {
        this.siteAddress = siteAddress;
    }

    public String getSiteIntro() {
        return siteIntro;
    }

    public void setSiteIntro(String siteIntro) {
        this.siteIntro = siteIntro;
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

    public String getArchiveStatus() {
        return archiveStatus;
    }

    public void setArchiveStatus(String archiveStatus) {
        this.archiveStatus = archiveStatus;
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
