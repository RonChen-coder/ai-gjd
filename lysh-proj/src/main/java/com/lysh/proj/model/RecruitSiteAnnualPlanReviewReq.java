package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 高基地年报计划审核请求模型。
 */
public class RecruitSiteAnnualPlanReviewReq implements ValueObject {
    /** 年报计划ID */
    private Long planId;
    /** 审核结果，审核通过/待整改 */
    private String status;
    /** 审核说明 */
    private String reviewOpinion;

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReviewOpinion() {
        return reviewOpinion;
    }

    public void setReviewOpinion(String reviewOpinion) {
        this.reviewOpinion = reviewOpinion;
    }
}
