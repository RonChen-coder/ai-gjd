package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

/**
 * 企业档案查询结果模型。
 * 用于从当前登录企业ID反查企业统一社会信用代码。
 */
public class RecruitCorpDetailData implements ValueObject {
    /** 企业ID */
    private String cid;
    /** 企业统一社会信用代码 */
    private String tyshxym;
    /** 企业名称 */
    private String corpName;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getTyshxym() {
        return tyshxym;
    }

    public void setTyshxym(String tyshxym) {
        this.tyshxym = tyshxym;
    }

    public String getCorpName() {
        return corpName;
    }

    public void setCorpName(String corpName) {
        this.corpName = corpName;
    }
}
