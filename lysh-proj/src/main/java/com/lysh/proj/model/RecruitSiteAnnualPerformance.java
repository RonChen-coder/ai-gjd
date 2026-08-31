package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 高基地年度绩效模型。
 */
public class RecruitSiteAnnualPerformance implements ValueObject {
    /** 年度绩效ID */
    private Long performanceId;
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
    /** 上传情况说明，必填 */
    private String situationDesc;
    /** 年度绩效文件存储key */
    private String performanceFileKey;
    /** 年度绩效文件名称 */
    private String performanceFileName;
    /** 状态，0待评分/1已评分 */
    private String status;
    /** 评分 */
    private BigDecimal score;
    /** 评分说明 */
    private String scoreOpinion;
    /** 评分人 */
    private String scorer;
    /** 评分时间 */
    private Date scoreTime;
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

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }
}
