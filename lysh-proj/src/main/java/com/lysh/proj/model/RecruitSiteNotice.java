package com.lysh.proj.model;

import java.util.Date;

/**
 * 高基地专区首页公告模型。
 * 与实体类 RecruitSiteNoticeEntity 字段保持一致。
 */
public class RecruitSiteNotice {
    /** 公告ID */
    private Long noticeId;
    /** 公告标题 */
    private String noticeTitle;
    /** 公告内容 */
    private String noticeContent;
    /** 发布日期 */
    private Date publishDate;
    /** 修改日期 */
    private Date updateDate;
    /** 操作人 */
    private String operatorName;
    /** 操作人编号 */
    private String operatorId;
    /** 地区编码 */
    private String districtCode;
    /** 公告状态，草稿/已发布/已下线 */
    private String status;

    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
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

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
