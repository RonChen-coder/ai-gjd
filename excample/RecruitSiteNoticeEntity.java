package com.wondersgroup.shrs.corp.gjd.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地专区首页公告实体类。
 * 对应表 RECRUIT_SITE_NOTICE。
 */
@Entity
@Table(name = "RECRUIT_SITE_NOTICE", schema = "WSBS")
public class RecruitSiteNoticeEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_NOTICE")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_NOTICE", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_NOTICE")
    @Column(name = "notice_id")
    private Long noticeId;

    @Basic
    @Column(name = "notice_title")
    private String noticeTitle;

    @Basic
    @Column(name = "notice_content")
    private String noticeContent;

    @Basic
    @Column(name = "publish_date")
    private Date publishDate;

    @Basic
    @Column(name = "update_date")
    private Date updateDate;

    @Basic
    @Column(name = "operator_name")
    private String operatorName;

    @Basic
    @Column(name = "operator_id")
    private String operatorId;

    @Basic
    @Column(name = "district_code")
    private String districtCode;

    @Basic
    @Column(name = "status")
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
