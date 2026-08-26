package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteAsset;

import java.util.List;

/**
 * 高基地项目资产业务处理接口。
 * 管理端维护项目资产清单，企业端维护资产表单（含使用频次）。
 */
public interface RecruitSiteAssetBPO {

    /**
     * 管理端新增项目资产清单项。
     *
     * @param asset 资产对象
     * @return 创建后的资产对象
     */
    RecruitSiteAsset createByAdmin(RecruitSiteAsset asset);

    /**
     * 管理端修改项目资产清单项。
     *
     * @param asset 待更新的资产对象
     * @return 更新后的资产对象
     */
    RecruitSiteAsset updateByAdmin(RecruitSiteAsset asset);

    /**
     * 管理端删除项目资产清单项。
     *
     * @param assetId 资产主键ID
     */
    void deleteByAdmin(Long assetId);

    /**
     * 企业端新增当前单位项目资产，使用频次由企业填写。
     *
     * @param asset 资产对象
     * @return 创建后的资产对象
     */
    RecruitSiteAsset createByCorp(RecruitSiteAsset asset);

    /**
     * 企业端修改当前单位项目资产。
     *
     * @param asset 待更新的资产对象
     * @return 更新后的资产对象
     */
    RecruitSiteAsset updateByCorp(RecruitSiteAsset asset);

    /**
     * 企业端删除当前单位项目资产。
     *
     * @param assetId 资产主键ID
     */
    void deleteByCorp(Long assetId);

    /**
     * 管理端根据资产ID查询资产。
     *
     * @param assetId 资产主键ID
     * @return 资产对象
     */
    RecruitSiteAsset queryAssetById(Long assetId);

    /**
     * 企业端根据资产ID查询本单位资产。
     *
     * @param assetId 资产主键ID
     * @return 资产对象
     */
    RecruitSiteAsset queryAssetCorpById(Long assetId);

    /**
     * 管理端查询项目资产清单，不分页。
     *
     * @param projectId 项目主键ID
     * @return 资产列表
     */
    List<RecruitSiteAsset> queryAssetList(Long projectId);

    /**
     * 企业端查询当前单位项目资产清单，不分页。
     *
     * @param projectId 项目主键ID
     * @return 资产列表
     */
    List<RecruitSiteAsset> queryAssetCorpList(Long projectId);
}
