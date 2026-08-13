package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteWhitelist;

import java.util.List;

/**
 * 高基地白名单业务处理接口。
 * 定义白名单列表、单条查询和存在性校验能力。
 */
public interface RecruitSiteWhitelistBPO {

    /**
     * 查询全部白名单记录。
     *
     * @return 白名单记录模型列表
     */
    List<RecruitSiteWhitelist> listAll();

    /**
     * 根据主键ID查询白名单记录。
     *
     * @param siteWhitelistId 白名单主键ID
     * @return 白名单记录模型
     */
    RecruitSiteWhitelist findById(Long siteWhitelistId);

    /**
     * 根据企业统一社会信用码查询白名单记录。
     *
     * @param tyshxym 企业统一社会信用码
     * @return 白名单记录模型
     */
    RecruitSiteWhitelist findByTyshxym(String tyshxym);

    /**
     * 根据企业统一社会信用码校验白名单记录是否存在。
     *
     * @param tyshxym 企业统一社会信用码
     * @return 存在返回 true，否则返回 false
     */
    boolean existsByTyshxym(String tyshxym);
}
