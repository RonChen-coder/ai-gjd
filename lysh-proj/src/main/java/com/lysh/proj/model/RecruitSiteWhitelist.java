package com.lysh.proj.model;

/**
 * 高基地白名单模型。
 * 与实体类 RecruitSiteWhitelistEntity 字段保持一致。
 */
public class RecruitSiteWhitelist {
    /** 白名单主键ID */
    private Long whitelistId;
    /** 企业统一社会信用码 */
    private String tyshxym;
    /** 企业名称 */
    private String companyName;
    /** 是否激活，1激活，0停用 */
    private Boolean active;

    public Long getWhitelistId() {
        return whitelistId;
    }

    public void setWhitelistId(Long whitelistId) {
        this.whitelistId = whitelistId;
    }

    public String getTyshxym() {
        return tyshxym;
    }

    public void setTyshxym(String tyshxym) {
        this.tyshxym = tyshxym;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
