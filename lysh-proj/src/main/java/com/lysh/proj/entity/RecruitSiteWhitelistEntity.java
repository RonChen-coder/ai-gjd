package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;

/**
 * 高基地白名单实体类。
 * 对应表 RECRUIT_SITE_WHITELIST。
 */
@Entity
@Table(name = "RECRUIT_SITE_WHITELIST", schema = "WSBS")
public class RecruitSiteWhitelistEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_WHITELIST")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_WHITELIST", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_WHITELIST")
    @Column(name = "whitelist_id")
    private Long whitelistId;

    @Basic
    @Column(name = "tyshxym")
    private String tyshxym;

    @Basic
    @Column(name = "company_name")
    private String companyName;

    @Basic
    @Column(name = "active")
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
