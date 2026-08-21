package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 高基地项目信息模型。
 * 对应表 RECRUIT_SITE_PROJECT，siteName/companyName/tyshxym 为列表冗余展示字段。
 */
public class RecruitSiteProject implements ValueObject {
    /** 项目ID */
    private Long projectId;
    /** 关联基地ID */
    private Long siteId;
    /** 分管区县编码，继承所属基地属地区 */
    private String districtCode;
    /** 项目名称 */
    private String projectName;
    /** 项目申报方向，字典取值 */
    private String applyDirection;
    /** 申报方向对应项目名称 */
    private String applyDirectionProjectName;
    /** 项目建设地点 */
    private String projectLocation;
    /** 项目实施单位 */
    private String implementUnit;
    /** 项目简介 */
    private String projectIntro;
    /** 项目状态，字典取值 */
    private String projectStatus;
    /** 立项批复时间 */
    private Date approvalTime;
    /** 立项批复资助资金(万元) */
    private BigDecimal approvalAmount;
    /** 立项拨付资助金资金时间 */
    private Date approvalGrantTime;
    /** 立项拨付资助金资金(万元) */
    private BigDecimal approvalGrantAmount;
    /** 验收批复时间 */
    private Date acceptanceTime;
    /** 验收拨付资助金资金时间 */
    private Date acceptanceGrantTime;
    /** 验收拨付资助金资金(万元) */
    private BigDecimal acceptanceGrantAmount;
    /** 绩效评估(第一年)拨付资助金资金时间 */
    private Date performanceGrantTime1;
    /** 绩效评估(第一年)拨付资助金资金(万元) */
    private BigDecimal performanceGrantAmount1;
    /** 绩效评估(第二年)拨付资助金资金时间 */
    private Date performanceGrantTime2;
    /** 绩效评估(第二年)拨付资助金资金(万元) */
    private BigDecimal performanceGrantAmount2;
    /** 绩效评估(第三年)拨付资助金资金时间 */
    private Date performanceGrantTime3;
    /** 绩效评估(第三年)拨付资助金资金(万元) */
    private BigDecimal performanceGrantAmount3;
    /** 合计拨付资助资金(万元) */
    private BigDecimal totalGrantAmount;
    /** 审核状态，待审核/已通过/已驳回 */
    private String status;
    /** 审核人 */
    private String reviewer;
    /** 审核时间 */
    private Date reviewTime;
    /** 审核意见 */
    private String reviewOpinion;
    /** 创建人 */
    private String createdBy;
    /** 创建时间 */
    private Date createdAt;
    /** 修改人 */
    private String updatedBy;
    /** 修改时间 */
    private Date updatedAt;
    /** 基地名称，列表冗余展示 */
    private String siteName;
    /** 单位名称，列表冗余展示 */
    private String companyName;
    /** 企业统一社会信用代码，列表冗余展示 */
    private String tyshxym;

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getApplyDirection() {
        return applyDirection;
    }

    public void setApplyDirection(String applyDirection) {
        this.applyDirection = applyDirection;
    }

    public String getApplyDirectionProjectName() {
        return applyDirectionProjectName;
    }

    public void setApplyDirectionProjectName(String applyDirectionProjectName) {
        this.applyDirectionProjectName = applyDirectionProjectName;
    }

    public String getProjectLocation() {
        return projectLocation;
    }

    public void setProjectLocation(String projectLocation) {
        this.projectLocation = projectLocation;
    }

    public String getImplementUnit() {
        return implementUnit;
    }

    public void setImplementUnit(String implementUnit) {
        this.implementUnit = implementUnit;
    }

    public String getProjectIntro() {
        return projectIntro;
    }

    public void setProjectIntro(String projectIntro) {
        this.projectIntro = projectIntro;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public Date getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public BigDecimal getApprovalAmount() {
        return approvalAmount;
    }

    public void setApprovalAmount(BigDecimal approvalAmount) {
        this.approvalAmount = approvalAmount;
    }

    public Date getApprovalGrantTime() {
        return approvalGrantTime;
    }

    public void setApprovalGrantTime(Date approvalGrantTime) {
        this.approvalGrantTime = approvalGrantTime;
    }

    public BigDecimal getApprovalGrantAmount() {
        return approvalGrantAmount;
    }

    public void setApprovalGrantAmount(BigDecimal approvalGrantAmount) {
        this.approvalGrantAmount = approvalGrantAmount;
    }

    public Date getAcceptanceTime() {
        return acceptanceTime;
    }

    public void setAcceptanceTime(Date acceptanceTime) {
        this.acceptanceTime = acceptanceTime;
    }

    public Date getAcceptanceGrantTime() {
        return acceptanceGrantTime;
    }

    public void setAcceptanceGrantTime(Date acceptanceGrantTime) {
        this.acceptanceGrantTime = acceptanceGrantTime;
    }

    public BigDecimal getAcceptanceGrantAmount() {
        return acceptanceGrantAmount;
    }

    public void setAcceptanceGrantAmount(BigDecimal acceptanceGrantAmount) {
        this.acceptanceGrantAmount = acceptanceGrantAmount;
    }

    public Date getPerformanceGrantTime1() {
        return performanceGrantTime1;
    }

    public void setPerformanceGrantTime1(Date performanceGrantTime1) {
        this.performanceGrantTime1 = performanceGrantTime1;
    }

    public BigDecimal getPerformanceGrantAmount1() {
        return performanceGrantAmount1;
    }

    public void setPerformanceGrantAmount1(BigDecimal performanceGrantAmount1) {
        this.performanceGrantAmount1 = performanceGrantAmount1;
    }

    public Date getPerformanceGrantTime2() {
        return performanceGrantTime2;
    }

    public void setPerformanceGrantTime2(Date performanceGrantTime2) {
        this.performanceGrantTime2 = performanceGrantTime2;
    }

    public BigDecimal getPerformanceGrantAmount2() {
        return performanceGrantAmount2;
    }

    public void setPerformanceGrantAmount2(BigDecimal performanceGrantAmount2) {
        this.performanceGrantAmount2 = performanceGrantAmount2;
    }

    public Date getPerformanceGrantTime3() {
        return performanceGrantTime3;
    }

    public void setPerformanceGrantTime3(Date performanceGrantTime3) {
        this.performanceGrantTime3 = performanceGrantTime3;
    }

    public BigDecimal getPerformanceGrantAmount3() {
        return performanceGrantAmount3;
    }

    public void setPerformanceGrantAmount3(BigDecimal performanceGrantAmount3) {
        this.performanceGrantAmount3 = performanceGrantAmount3;
    }

    public BigDecimal getTotalGrantAmount() {
        return totalGrantAmount;
    }

    public void setTotalGrantAmount(BigDecimal totalGrantAmount) {
        this.totalGrantAmount = totalGrantAmount;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getTyshxym() {
        return tyshxym;
    }

    public void setTyshxym(String tyshxym) {
        this.tyshxym = tyshxym;
    }
}
