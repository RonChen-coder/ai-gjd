package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;
import com.wondersgroup.wdls.data.commons.PageParam;

/**
 * 高基地预警规则列表查询请求模型。
 */
public class RecruitSiteWarningRuleQueryReq implements ValueObject {
    /** 预警对象类型，1基地/2项目/3资产 */
    private Integer targetType;
    /** 预警级别，严重/一般 */
    private String warningLevel;
    /** 是否启用 */
    private Boolean enabled;
    /** 关键字，检索规则编码、规则名称和说明 */
    private String keyword;
    /** 分页参数 */
    private PageParam pageParam;

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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
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
