package com.lysh.proj.entity;

/**
 * 高基地白名单实体类。
 * 对应表 RECRUIT_SITE_WHITELIST，字段与实体属性一一对应。
 */
public class RecruitSiteWhitelistEntity {
    private Long whitelistId;
    private String tyshxym;
    private String companyName;
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
