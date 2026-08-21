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
    /** 白名单主键ID */
    private Long whitelistId;

    @Basic
    @Column(name = "tyshxym")
    /** 企业统一社会信用码 */
    private String tyshxym;

    @Basic
    @Column(name = "company_name")
    /** 企业名称 */
    private String companyName;

    @Basic
    @Column(name = "active")
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
