package com.lysh.proj.controller;

import com.lysh.proj.service.RecruitSiteApplyMaterialBPO;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地申请材料管理端控制层。
 * 面向市级、区级管理员，提供申请材料的查看和删除接口。
 */
@RestController
@RequestMapping("/admin/site-apply-material")
public class RecruitSiteApplyMaterialAdminController {

    private final RecruitSiteApplyMaterialBPO applyMaterialBPO;

    public RecruitSiteApplyMaterialAdminController(RecruitSiteApplyMaterialBPO applyMaterialBPO) {
        this.applyMaterialBPO = applyMaterialBPO;
    }

    /**
     * 根据基地ID查询申请材料列表。
     *
     * @param siteId 基地主键ID
     * @return 申请材料列表
     */
    @GetMapping("/site/{siteId}")
    public AjaxResult listBySiteId(@PathVariable Long siteId) {
        return AjaxResult.SUCCESS(applyMaterialBPO.listBySiteId(siteId));
    }

    /**
     * 根据材料ID查询申请材料详情。
     *
     * @param materialId 材料主键ID
     * @return 申请材料详情
     */
    @GetMapping("/{materialId}")
    public AjaxResult findById(@PathVariable Long materialId) {
        return AjaxResult.SUCCESS(applyMaterialBPO.findById(materialId));
    }

    /**
     * 删除申请材料。
     *
     * @param materialId 材料主键ID
     * @return 无内容响应
     */
    @DeleteMapping("/{materialId}")
    public AjaxResult delete(@PathVariable Long materialId) {
        applyMaterialBPO.delete(materialId);
        return AjaxResult.SUCCESS();
    }
}
