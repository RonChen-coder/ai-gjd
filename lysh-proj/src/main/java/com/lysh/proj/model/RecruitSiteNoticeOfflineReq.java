package com.lysh.proj.model;

/**
 * 高基地公告下线请求模型。
 */
public class RecruitSiteNoticeOfflineReq {
    private Long noticeId;
    private String operatorName;
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
