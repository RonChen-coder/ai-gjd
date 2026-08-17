package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地信息实体类。
 * 对应表 RECRUIT_SITE_INFO。
 */
@Entity
@Table(name = "RECRUIT_SITE_INFO", schema = "WSBS")
public class RecruitSiteInfoEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_INFO")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_INFO", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_INFO")
    @Column(name = "site_id")
    private Long siteId;

    @Basic
    @Column(name = "tyshxym")
    private String tyshxym;

    @Basic
    @Column(name = "company_name")
    private String companyName;

    @Basic
    @Column(name = "site_name")
    private String siteName;

    @Basic
    @Column(name = "listing_year")
    private String listingYear;

    @Basic
    @Column(name = "site_category")
    private String siteCategory;

    @Basic
    @Column(name = "industry_category")
    private String industryCategory;

    @Basic
    @Column(name = "district_code")
    private String districtCode;

    @Basic
    @Column(name = "superior_department")
    private String superiorDepartment;

    @Basic
    @Column(name = "site_address")
    private String siteAddress;

    @Basic
    @Column(name = "site_intro")
    private String siteIntro;

    @Basic
    @Column(name = "status")
    private String status;

    @Basic
    @Column(name = "reviewer")
    private String reviewer;

    @Basic
    @Column(name = "review_time")
    private Date reviewTime;

    @Basic
    @Column(name = "review_opinion")
    private String reviewOpinion;

    @Basic
    @Column(name = "archive_status")
    private String archiveStatus;

    @Basic
    @Column(name = "created_by")
    private String createdBy;

    @Basic
    @Column(name = "created_at")
    private Date createdAt;

    @Basic
    @Column(name = "updated_by")
    private String updatedBy;

    @Basic
    @Column(name = "updated_at")
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
