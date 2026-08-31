package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;
import com.wondersgroup.wdls.data.commons.PageParam;

/**
 * 高基地年度绩效列表查询请求模型。
 */
public class RecruitSiteAnnualPerformanceQueryReq implements ValueObject {
    /** 关联基地ID */
    private Long siteId;
    /** 分管区县编码 */
    private String districtCode;
    /** 年度年份 */
    private String annualYear;
    /** 状态，0待评分/1已评分 */
    private String status;
    /** 关键字，检索基地名称和年份 */
    private String keyword;
    /** 分页参数 */
    private PageParam pageParam;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getAnnualYear() {
        return annualYear;
    }

    public void setAnnualYear(String annualYear) {
        this.annualYear = annualYear;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
