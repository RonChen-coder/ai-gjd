package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;
import com.wondersgroup.wdls.data.commons.PageParam;

/**
 * 高基地项目信息列表查询请求模型。
 */
public class RecruitSiteProjectQueryReq implements ValueObject {
    /** 基地ID */
    private Long siteId;
    /** 企业统一社会信用代码 */
    private String tyshxym;
    /** 属地区编码 */
    private String districtCode;
    /** 项目名称，模糊查询 */
    private String projectName;
    /** 项目申报方向 */
    private String applyDirection;
    /** 项目状态 */
    private String projectStatus;
    /** 审核状态 */
    private String status;
    /** 关键字，检索表单内容 */
    private String keyword;
    /** 分页参数 */
    private PageParam pageParam;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getTyshxym() {
        return tyshxym;
    }

    public void setTyshxym(String tyshxym) {
        this.tyshxym = tyshxym;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getApplyDirection() {
        return applyDirection;
    }

    public void setApplyDirection(String applyDirection) {
        this.applyDirection = applyDirection;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
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
