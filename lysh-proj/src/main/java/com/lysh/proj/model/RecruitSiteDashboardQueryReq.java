package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 高基地运行状况看板查询请求模型。
 */
public class RecruitSiteDashboardQueryReq implements ValueObject {
    /** 区县编码 */
    private String districtCode;
    /** 行业分类 */
    private String industryCategory;
    /** 基地至少包含项目数 */
    private Long minProjectCount;

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

    public Long getMinProjectCount() {
        return minProjectCount;
    }

    public void setMinProjectCount(Long minProjectCount) {
        this.minProjectCount = minProjectCount;
    }
}
