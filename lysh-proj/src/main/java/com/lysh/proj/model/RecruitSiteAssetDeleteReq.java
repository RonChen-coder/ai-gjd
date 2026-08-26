package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 高基地项目资产删除请求模型。
 */
public class RecruitSiteAssetDeleteReq implements ValueObject {
    /** 资产ID */
    private Long assetId;

    public Long getAssetId() {
        return assetId;
    }

    public void setAssetId(Long assetId) {
        this.assetId = assetId;
    }
}
