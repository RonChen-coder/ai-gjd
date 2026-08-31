package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 高基地年度绩效实体类。
 * 对应表 RECRUIT_SITE_ANNUAL_PERFORMANCE。
 */
@Entity
@Table(name = "RECRUIT_SITE_ANNUAL_PERFORMANCE", schema = "WSBS")
public class RecruitSiteAnnualPerformanceEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_ANNUAL_PERFORMANCE")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_ANNUAL_PERFORMANCE", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_ANNUAL_PERFORMANCE")
    @Column(name = "performance_id")
    private Long performanceId;

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
    @Column(name = "performance_file_key")
    private String performanceFileKey;

    @Basic
    @Column(name = "performance_file_name")
    private String performanceFileName;

    @Basic
    @Column(name = "status")
    private String status;

    @Basic
    @Column(name = "score")
    private BigDecimal score;

    @Basic
    @Column(name = "score_opinion")
    private String scoreOpinion;

    @Basic
    @Column(name = "scorer")
    private String scorer;

    @Basic
    @Column(name = "score_time")
    private Date scoreTime;

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

    public Long getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(Long performanceId) {
        this.performanceId = performanceId;
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

    public String getPerformanceFileKey() {
        return performanceFileKey;
    }

    public void setPerformanceFileKey(String performanceFileKey) {
        this.performanceFileKey = performanceFileKey;
    }

    public String getPerformanceFileName() {
        return performanceFileName;
    }

    public void setPerformanceFileName(String performanceFileName) {
        this.performanceFileName = performanceFileName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getScore() {
        return score;
    }

    public void setScore(BigDecimal score) {
        this.score = score;
    }

    public String getScoreOpinion() {
        return scoreOpinion;
    }

    public void setScoreOpinion(String scoreOpinion) {
        this.scoreOpinion = scoreOpinion;
    }

    public String getScorer() {
        return scorer;
    }

    public void setScorer(String scorer) {
        this.scorer = scorer;
    }

    public Date getScoreTime() {
        return scoreTime;
    }

    public void setScoreTime(Date scoreTime) {
        this.scoreTime = scoreTime;
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
