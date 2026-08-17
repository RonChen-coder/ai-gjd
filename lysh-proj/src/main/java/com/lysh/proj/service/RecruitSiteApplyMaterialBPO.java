package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteApplyMaterial;

import java.util.List;

/**
 * 高基地申请材料业务处理接口。
 * 定义申请材料的新增、修改、删除和查询能力。
 */
public interface RecruitSiteApplyMaterialBPO {

    /**
     * 新增申请材料。
     *
     * @param material 申请材料对象
     * @return 创建后的申请材料对象
     */
    RecruitSiteApplyMaterial create(RecruitSiteApplyMaterial material);

    /**
     * 修改申请材料。
     *
     * @param material 待更新的申请材料对象
     * @return 更新后的申请材料对象
     */
    RecruitSiteApplyMaterial update(RecruitSiteApplyMaterial material);

    /**
     * 删除申请材料。
     *
     * @param materialId 材料主键ID
     */
    void delete(Long materialId);

    /**
     * 根据材料ID查询申请材料。
     *
     * @param materialId 材料主键ID
     * @return 申请材料对象
     */
    RecruitSiteApplyMaterial findById(Long materialId);

    /**
     * 根据基地ID查询申请材料列表。
     *
     * @param siteId 基地主键ID
     * @return 申请材料列表
     */
    List<RecruitSiteApplyMaterial> listBySiteId(Long siteId);
}
