package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;
import com.wondersgroup.wdls.data.commons.PageParam;

/**
 * 高基地预警整改结果列表查询请求模型。
 */
public class RecruitSiteRectificationQueryReq implements ValueObject {
    /** 关联基地ID */
    private Long siteId;
    /** 关联项目ID */
    private Long projectId;
    /** 关联资产ID */
    private Long assetId;
    /** 关联预警ID */
    private Long warningId;
    /** 整改状态 */
    private String rectificationStatus;
    /** 分管区县编码 */
    private String districtCode;
    /** 关键字，检索规则名称、基地/项目/资产名称 */
    private String keyword;
    /** 分页参数 */
    private PageParam pageParam;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getAssetId() {
        return assetId;
    }

    public void setAssetId(Long assetId) {
        this.assetId = assetId;
    }

    public Long getWarningId() {
        return warningId;
    }

    public void setWarningId(Long warningId) {
        this.warningId = warningId;
    }

    public String getRectificationStatus() {
        return rectificationStatus;
    }

    public void setRectificationStatus(String rectificationStatus) {
        this.rectificationStatus = rectificationStatus;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public PageParam getPageParam() {
        return pageParam;
    }

    public void setPageParam(PageParam pageParam) {
        this.pageParam = pageParam;
    }
}
