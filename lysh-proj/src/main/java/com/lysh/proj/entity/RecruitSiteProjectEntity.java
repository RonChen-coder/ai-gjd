package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 高基地项目信息实体类。
 * 对应表 RECRUIT_SITE_PROJECT。
 */
@Entity
@Table(name = "RECRUIT_SITE_PROJECT", schema = "WSBS")
public class RecruitSiteProjectEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_PROJECT")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_PROJECT", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_PROJECT")
    @Column(name = "project_id")
    /** 项目ID */
    private Long projectId;

    @Basic
    @Column(name = "site_id")
    /** 关联基地ID */
    private Long siteId;

    @Basic
    @Column(name = "district_code")
    /** 分管区县编码，继承所属基地属地区 */
    private String districtCode;

    @Basic
    @Column(name = "project_name")
    /** 项目名称 */
    private String projectName;

    @Basic
    @Column(name = "apply_direction")
    /** 项目申报方向，字典取值 */
    private String applyDirection;

    @Basic
    @Column(name = "apply_direction_project_name")
    /** 申报方向对应项目名称 */
    private String applyDirectionProjectName;

    @Basic
    @Column(name = "project_location")
    /** 项目建设地点 */
    private String projectLocation;

    @Basic
    @Column(name = "implement_unit")
    /** 项目实施单位 */
    private String implementUnit;

    @Basic
    @Column(name = "project_intro")
    /** 项目简介 */
    private String projectIntro;

    @Basic
    @Column(name = "project_status")
    /** 项目状态，字典取值 */
    private String projectStatus;

    @Basic
    @Column(name = "approval_time")
    /** 立项批复时间 */
    private Date approvalTime;

    @Basic
    @Column(name = "approval_amount")
    /** 立项批复资助资金(万元) */
    private BigDecimal approvalAmount;

    @Basic
    @Column(name = "approval_grant_time")
    /** 立项拨付资助金资金时间 */
    private Date approvalGrantTime;

    @Basic
    @Column(name = "approval_grant_amount")
    /** 立项拨付资助金资金(万元) */
    private BigDecimal approvalGrantAmount;

    @Basic
    @Column(name = "acceptance_time")
    /** 验收批复时间 */
    private Date acceptanceTime;

    @Basic
    @Column(name = "acceptance_grant_time")
    /** 验收拨付资助金资金时间 */
    private Date acceptanceGrantTime;

    @Basic
    @Column(name = "acceptance_grant_amount")
    /** 验收拨付资助金资金(万元) */
    private BigDecimal acceptanceGrantAmount;

    @Basic
    @Column(name = "performance_grant_time_1")
    /** 绩效评估(第一年)拨付资助金资金时间 */
    private Date performanceGrantTime1;

    @Basic
    @Column(name = "performance_grant_amount_1")
    /** 绩效评估(第一年)拨付资助金资金(万元) */
    private BigDecimal performanceGrantAmount1;

    @Basic
    @Column(name = "performance_grant_time_2")
    /** 绩效评估(第二年)拨付资助金资金时间 */
    private Date performanceGrantTime2;

    @Basic
    @Column(name = "performance_grant_amount_2")
    /** 绩效评估(第二年)拨付资助金资金(万元) */
    private BigDecimal performanceGrantAmount2;

    @Basic
    @Column(name = "performance_grant_time_3")
    /** 绩效评估(第三年)拨付资助金资金时间 */
    private Date performanceGrantTime3;

    @Basic
    @Column(name = "performance_grant_amount_3")
    /** 绩效评估(第三年)拨付资助金资金(万元) */
    private BigDecimal performanceGrantAmount3;

    @Basic
    @Column(name = "total_grant_amount")
    /** 合计拨付资助资金(万元) */
    private BigDecimal totalGrantAmount;

    @Basic
    @Column(name = "status")
    /** 审核状态，待审核/已通过/已驳回 */
    private String status;

    @Basic
    @Column(name = "reviewer")
    /** 审核人 */
    private String reviewer;

    @Basic
    @Column(name = "review_time")
    /** 审核时间 */
    private Date reviewTime;

    @Basic
    @Column(name = "review_opinion")
    /** 审核意见 */
    private String reviewOpinion;

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
}
