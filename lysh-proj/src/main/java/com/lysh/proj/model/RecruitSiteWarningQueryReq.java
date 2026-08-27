package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;
import com.wondersgroup.wdls.data.commons.PageParam;

/**
 * 高基地预警列表查询请求模型。
 */
public class RecruitSiteWarningQueryReq implements ValueObject {
    /** 关联基地ID */
    private Long siteId;
    /** 关联项目ID */
    private Long projectId;
    /** 关联资产ID */
    private Long assetId;
    /** 预警对象类型，1基地/2项目/3资产 */
    private Integer targetType;
    /** 预警级别 */
    private String warningLevel;
    /** 预警状态，待处理/已处理/已忽略 */
    private String warningStatus;
    /** 分管区县编码 */
    private String districtCode;
    /** 关键字，检索规则名称、预警内容、基地/项目/资产名称 */
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

    public Integer getTargetType() {
        return targetType;
    }

    public void setTargetType(Integer targetType) {
        this.targetType = targetType;
    }

    public String getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(String warningLevel) {
        this.warningLevel = warningLevel;
    }

    public String getWarningStatus() {
        return warningStatus;
    }

    public void setWarningStatus(String warningStatus) {
        this.warningStatus = warningStatus;
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
