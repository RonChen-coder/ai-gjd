package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 企业上传整改报告请求模型。
 */
public class RecruitSiteRectificationUploadReq implements ValueObject {
    /** 整改ID */
    private Long rectificationId;
    /** 报告文件存储key */
    private String reportFileKey;
    /** 报告文件名称 */
    private String reportFileName;

    public Long getRectificationId() {
        return rectificationId;
    }

    public void setRectificationId(Long rectificationId) {
        this.rectificationId = rectificationId;
    }

    public String getReportFileKey() {
        return reportFileKey;
    }

    public void setReportFileKey(String reportFileKey) {
        this.reportFileKey = reportFileKey;
    }

    public String getReportFileName() {
        return reportFileName;
    }

    public void setReportFileName(String reportFileName) {
        this.reportFileName = reportFileName;
    }
}
