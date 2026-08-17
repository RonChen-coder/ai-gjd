package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteWhitelistEntity;
import com.lysh.proj.model.RecruitSiteWhitelist;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 高基地白名单业务处理实现类。
 * 使用内部框架 DBUtils 实现白名单列表、单条查询和存在性校验逻辑。
 */
@Service
public class RecruitSiteWhitelistBPOImpl implements RecruitSiteWhitelistBPO {

    /**
     * 查询全部白名单记录。
     *
     * @return 白名单记录模型列表
     */
    @Override
    public List<RecruitSiteWhitelist> listAll() {
        List<RecruitSiteWhitelistEntity> entities = DBUtils.query(
                "SELECT whitelist_id, tyshxym, company_name, active " +
                "FROM wsbs.RECRUIT_SITE_WHITELIST ORDER BY whitelist_id DESC", RecruitSiteWhitelistEntity.class);
        List<RecruitSiteWhitelist> models = new ArrayList<>();
        for (RecruitSiteWhitelistEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    /**
     * 根据主键ID查询白名单记录。
     *
     * @param siteWhitelistId 白名单主键ID
     * @return 白名单记录模型
     */
    @Override
    public RecruitSiteWhitelist findById(Long siteWhitelistId) {
        RecruitSiteWhitelistEntity entity = DBUtils.get(
                "SELECT whitelist_id, tyshxym, company_name, active " +
                "FROM wsbs.RECRUIT_SITE_WHITELIST WHERE whitelist_id = ?",
                RecruitSiteWhitelistEntity.class, siteWhitelistId);
        return toModel(entity);
    }

    /**
     * 根据企业统一社会信用码查询白名单记录。
     *
     * @param tyshxym 企业统一社会信用码
     * @return 白名单记录模型
     */
    @Override
    public RecruitSiteWhitelist findByTyshxym(String tyshxym) {
        RecruitSiteWhitelistEntity entity = DBUtils.get(
                "SELECT whitelist_id, tyshxym, company_name, active " +
                "FROM wsbs.RECRUIT_SITE_WHITELIST WHERE tyshxym = ?",
                RecruitSiteWhitelistEntity.class, tyshxym);
        return toModel(entity);
    }

    /**
     * 根据企业统一社会信用码校验白名单记录是否存在。
     *
     * @param tyshxym 企业统一社会信用码
     * @return 存在返回 true，否则返回 false
     */
    @Override
    public boolean existsByTyshxym(String tyshxym) {
        return DBUtils.getInt("SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_WHITELIST WHERE tyshxym = ? AND active = 1",
                tyshxym) > 0;
    }

    private RecruitSiteWhitelist toModel(RecruitSiteWhitelistEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteWhitelist model = new RecruitSiteWhitelist();
        model.setWhitelistId(entity.getWhitelistId());
        model.setTyshxym(entity.getTyshxym());
        model.setCompanyName(entity.getCompanyName());
        model.setActive(entity.getActive());
        return model;
    }
}
