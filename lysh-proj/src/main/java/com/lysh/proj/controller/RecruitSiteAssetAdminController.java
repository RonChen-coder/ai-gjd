package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteAsset;
import com.lysh.proj.model.RecruitSiteAssetDeleteReq;
import com.lysh.proj.service.RecruitSiteAssetBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地项目资产管理端控制层。
 * 面向市级、区级管理员，提供项目资产清单的新增、修改、删除和查询接口，
 * 使用频次由企业端维护，管理端不维护该字段。
 */
@RestController
@RequestMapping("/admin/site-asset")
public class RecruitSiteAssetAdminController {

    private final RecruitSiteAssetBPO assetBPO;

    public RecruitSiteAssetAdminController(RecruitSiteAssetBPO assetBPO) {
        this.assetBPO = assetBPO;
    }

    /**
     * 管理端新增项目资产清单项。
     *
     * @param asset 资产请求体，projectId 必填
     * @return 创建后的资产信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteAsset asset) {
        if (asset == null) {
            throw new BusinessException("资产信息不能为空");
        }
        return AjaxResult.SUCCESS(assetBPO.createByAdmin(asset));
    }

    /**
     * 管理端修改项目资产清单项。
     *
     * @param asset 待更新的资产信息
     * @return 更新后的资产信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteAsset asset) {
        if (asset == null) {
            throw new BusinessException("资产信息不能为空");
        }
        return AjaxResult.SUCCESS(assetBPO.updateByAdmin(asset));
    }

    /**
     * 管理端删除项目资产清单项。
     *
     * @param req 删除请求体，assetId 必填
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestBody RecruitSiteAssetDeleteReq req) {
        if (req == null || req.getAssetId() == null) {
            throw new BusinessException("资产ID不能为空");
        }
        assetBPO.deleteByAdmin(req.getAssetId());
        return AjaxResult.SUCCESS();
    }

    /**
     * 管理端根据资产ID查询资产详情。
     *
     * @param assetId 资产主键ID
     * @return 资产信息详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long assetId) {
        return AjaxResult.SUCCESS(assetBPO.queryAssetById(assetId));
    }

    /**
     * 管理端查询项目资产清单，不分页。
     *
     * @param projectId 项目主键ID
     * @return 资产信息列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(assetBPO.queryAssetList(projectId));
    }
}
