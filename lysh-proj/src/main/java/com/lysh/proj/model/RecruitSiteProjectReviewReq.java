package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 高基地项目信息审核请求模型。
 */
public class RecruitSiteProjectReviewReq implements ValueObject {
    /** 项目ID */
    private Long projectId;
    /** 审核意见 */
    private String reviewOpinion;
    /** 审核结果，已通过或已驳回 */
    private String status;

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getReviewOpinion() {
        return reviewOpinion;
    }

    public void setReviewOpinion(String reviewOpinion) {
        this.reviewOpinion = reviewOpinion;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
