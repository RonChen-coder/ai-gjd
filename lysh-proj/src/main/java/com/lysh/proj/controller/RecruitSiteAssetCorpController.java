package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteAsset;
import com.lysh.proj.model.RecruitSiteAssetDeleteReq;
import com.lysh.proj.service.RecruitSiteAssetBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地项目资产企业端控制层。
 * 面向白名单内单位，提供本单位项目资产的维护接口，
 * 使用频次字段由企业端填写维护。
 */
@RestController
@RequestMapping("/corp/site-asset")
public class RecruitSiteAssetCorpController {

    private final RecruitSiteAssetBPO assetBPO;

    public RecruitSiteAssetCorpController(RecruitSiteAssetBPO assetBPO) {
        this.assetBPO = assetBPO;
    }

    /**
     * 企业端新增当前单位项目资产，使用频次由企业填写。
     *
     * @param asset 资产请求体，projectId 必填
     * @return 创建后的资产信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteAsset asset) {
        if (asset == null) {
            throw new BusinessException("资产信息不能为空");
        }
        return AjaxResult.SUCCESS(assetBPO.createByCorp(asset));
    }

    /**
     * 企业端修改当前单位项目资产。
     *
     * @param asset 待更新的资产信息
     * @return 更新后的资产信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteAsset asset) {
        if (asset == null) {
            throw new BusinessException("资产信息不能为空");
        }
        return AjaxResult.SUCCESS(assetBPO.updateByCorp(asset));
    }

    /**
     * 企业端删除当前单位项目资产。
     *
     * @param req 删除请求体，assetId 必填
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestBody RecruitSiteAssetDeleteReq req) {
        if (req == null || req.getAssetId() == null) {
            throw new BusinessException("资产ID不能为空");
        }
        assetBPO.deleteByCorp(req.getAssetId());
        return AjaxResult.SUCCESS();
    }

    /**
     * 企业端根据资产ID查询本单位资产详情。
     *
     * @param assetId 资产主键ID
     * @return 资产信息详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long assetId) {
        return AjaxResult.SUCCESS(assetBPO.queryAssetCorpById(assetId));
    }

    /**
     * 企业端查询当前单位项目资产清单，不分页。
     *
     * @param projectId 项目主键ID
     * @return 资产信息列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(assetBPO.queryAssetCorpList(projectId));
    }
}
