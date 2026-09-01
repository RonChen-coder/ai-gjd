package com.lysh.proj.model.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;

import java.math.BigDecimal;

/**
 * 年报计划导出Excel模型。
 * 企业端和管理端使用同一套导出字段。
 */
@ColumnWidth(20)
public class RecruitSiteAnnualPlanExcel {
    @ExcelProperty("年度年份")
    private String annualYear;

    @ExcelProperty("基地名称")
    private String siteName;

    @ExcelProperty("企业统一社会信用代码")
    private String tyshxym;

    @ExcelProperty("属地区")
    private String districtCode;

    @ExcelProperty("技能服务数(人次)")
    private Long skillServiceCount;

    @ExcelProperty("面向社会开放服务数(人次)")
    private Long openServiceCount;

    @ExcelProperty("占比(%)")
    private BigDecimal serviceRatio;

    @ExcelProperty("情况说明")
    private String situationDesc;

    @ExcelProperty("文件名称")
    private String planFileName;

    @ExcelProperty("文件key")
    private String planFileKey;

    @ExcelProperty("审核状态")
    private String status;

    @ExcelProperty("审核人")
    private String reviewer;

    @ExcelProperty("审核时间")
    private String reviewTime;

    @ExcelProperty("审核说明")
    private String reviewOpinion;

    @ExcelProperty("创建人")
    private String createdBy;

    @ExcelProperty("创建时间")
    private String createdAt;

    @ExcelProperty("修改人")
    private String updatedBy;

    @ExcelProperty("修改时间")
    private String updatedAt;

    public String getAnnualYear() {
        return annualYear;
    }

    public void setAnnualYear(String annualYear) {
        this.annualYear = annualYear;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
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

    public String getPlanFileName() {
        return planFileName;
    }

    public void setPlanFileName(String planFileName) {
        this.planFileName = planFileName;
    }

    public String getPlanFileKey() {
        return planFileKey;
    }

    public void setPlanFileKey(String planFileKey) {
        this.planFileKey = planFileKey;
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

    public String getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(String reviewTime) {
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

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
