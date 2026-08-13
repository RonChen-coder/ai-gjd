package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteInfo;

import java.util.List;

/**
 * 基地基础信息服务接口。
 * 定义基地基础信息的业务能力，便于后续扩展与依赖注入。
 */
public interface RecruitSiteInfoServiceInterface {

    /**
     * 创建基地信息。
     *
     * @param recruitSiteInfo 基地信息对象
     * @return 保存后的基地信息对象
     */
    RecruitSiteInfo create(RecruitSiteInfo recruitSiteInfo);

    /**
     * 更新基地信息。
     *
     * @param recruitSiteInfo 待更新的基地信息对象
     * @return 更新后的基地信息对象
     */
    RecruitSiteInfo update(RecruitSiteInfo recruitSiteInfo);

    /**
     * 删除基地信息。
     *
     * @param siteId 基地主键ID
     */
    void delete(Long siteId);

    /**
     * 根据基地ID查询基地信息。
     *
     * @param siteId 基地主键ID
     * @return 基地信息对象
     */
    RecruitSiteInfo findById(Long siteId);

    /**
     * 根据区县查询基地信息列表。
     *
     * @param districtName 区县名称
     * @return 基地信息列表
     */
    List<RecruitSiteInfo> listByDistrict(String districtName);

    /**
     * 查询全部基地信息。
     *
     * @return 基地信息列表
     */
    List<RecruitSiteInfo> listAll();

    /**
     * 审核基地信息。
     *
     * @param siteId 基地主键ID
     * @param reviewer 审核人
     * @param reviewOpinion 审核意见
     * @param status 审核状态
     * @return 审核后的基地信息对象
     */
    RecruitSiteInfo review(Long siteId, String reviewer, String reviewOpinion, String status);
}
