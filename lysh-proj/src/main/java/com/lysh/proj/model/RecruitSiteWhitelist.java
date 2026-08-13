package com.lysh.proj.model;

/**
 * 高基地白名单模型。
 * 与实体类 RecruitSiteWhitelistEntity 字段保持一致。
 */
public class RecruitSiteWhitelist {
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
