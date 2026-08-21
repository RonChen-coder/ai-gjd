package com.lysh.proj.model;

/**
 * 高基地公告发布请求模型。
 */
public class RecruitSiteNoticePublishReq {
    /** 公告ID */
    private Long noticeId;
    /** 操作人 */
    private String operatorName;
    /** 操作人编号 */
    private String operatorId;

    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }
}
