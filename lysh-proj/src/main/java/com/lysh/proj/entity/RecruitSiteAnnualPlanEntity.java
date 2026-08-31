package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 高基地年报计划实体类。
 * 对应表 RECRUIT_SITE_ANNUAL_PLAN。
 */
@Entity
@Table(name = "RECRUIT_SITE_ANNUAL_PLAN", schema = "WSBS")
public class RecruitSiteAnnualPlanEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_ANNUAL_PLAN")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_ANNUAL_PLAN", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_ANNUAL_PLAN")
    @Column(name = "plan_id")
    private Long planId;

    @Basic
    @Column(name = "site_id")
    private Long siteId;

    @Basic
    @Column(name = "tyshxym")
    private String tyshxym;

    @Basic
    @Column(name = "district_code")
    private String districtCode;

    @Basic
    @Column(name = "annual_year")
    private String annualYear;

    @Basic
    @Column(name = "skill_service_count")
    private Long skillServiceCount;

    @Basic
    @Column(name = "open_service_count")
    private Long openServiceCount;

    @Basic
    @Column(name = "service_ratio")
    private BigDecimal serviceRatio;

    @Basic
    @Column(name = "situation_desc")
    private String situationDesc;

    @Basic
    @Column(name = "plan_file_key")
    private String planFileKey;

    @Basic
    @Column(name = "plan_file_name")
    private String planFileName;

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
}
