package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 高基地预警处理请求模型。
 */
public class RecruitSiteWarningHandleReq implements ValueObject {
    /** 预警ID */
    private Long warningId;
    /** 处理结果，已处理/已忽略 */
    private String status;
    /** 处理说明 */
    private String remark;

    public Long getWarningId() {
        return warningId;
    }

    public void setWarningId(Long warningId) {
        this.warningId = warningId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
