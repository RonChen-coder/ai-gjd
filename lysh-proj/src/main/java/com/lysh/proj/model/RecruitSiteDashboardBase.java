package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 高基地运行状况看板基地列表项。
 */
public class RecruitSiteDashboardBase implements ValueObject {
    /** 基地ID */
    private Long siteId;
    /** 基地名称 */
    private String siteName;
    /** 单位名称 */
    private String companyName;
    /** 区县编码 */
    private String districtCode;
    /** 行业分类 */
    private String industryCategory;
    /** 项目数 */
    private Long projectCount;
    /** 资产数 */
    private Long assetCount;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getIndustryCategory() {
        return industryCategory;
    }

    public void setIndustryCategory(String industryCategory) {
        this.industryCategory = industryCategory;
    }

    public Long getProjectCount() {
        return projectCount;
    }

    public void setProjectCount(Long projectCount) {
        this.projectCount = projectCount;
    }

    public Long getAssetCount() {
        return assetCount;
    }

    public void setAssetCount(Long assetCount) {
        this.assetCount = assetCount;
    }
}
