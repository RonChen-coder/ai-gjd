package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteApplyMaterial;
import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.service.RecruitSiteApplyMaterialBPO;
import com.lysh.proj.service.RecruitSiteInfoBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地申请材料企业端控制层。
 * 面向白名单内单位，提供本单位申请材料的上传、修改和删除接口。
 */
@RestController
@RequestMapping("/corp/site-apply-material")
public class RecruitSiteApplyMaterialCorpController {

    private final RecruitSiteApplyMaterialBPO applyMaterialBPO;
    private final RecruitSiteInfoBPO siteInfoBPO;

    public RecruitSiteApplyMaterialCorpController(RecruitSiteApplyMaterialBPO applyMaterialBPO,
                                                  RecruitSiteInfoBPO siteInfoBPO) {
        this.applyMaterialBPO = applyMaterialBPO;
        this.siteInfoBPO = siteInfoBPO;
    }

    /**
     * 单位上传申请材料。
     *
     * @param material 申请材料请求体，siteId 必填
     * @param tyshxym 企业统一社会信用代码
     * @return 创建后的申请材料
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteApplyMaterial material,
                             @RequestParam String tyshxym) {
        checkSiteOwner(material.getSiteId(), tyshxym);
        return AjaxResult.SUCCESS(applyMaterialBPO.create(material));
    }

    /**
     * 单位修改申请材料。
     *
     * @param material 待更新的申请材料
     * @param tyshxym 企业统一社会信用代码
     * @return 更新后的申请材料
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteApplyMaterial material,
                             @RequestParam String tyshxym) {
        if (material.getMaterialId() == null) {
            throw new BusinessException("材料ID不能为空");
        }
        RecruitSiteApplyMaterial old = applyMaterialBPO.findById(material.getMaterialId());
        if (old == null) {
            throw new BusinessException("申请材料不存在: " + material.getMaterialId());
        }
        Long siteId = material.getSiteId() == null ? old.getSiteId() : material.getSiteId();
        checkSiteOwner(siteId, tyshxym);
        return AjaxResult.SUCCESS(applyMaterialBPO.update(material));
    }

    /**
     * 单位删除申请材料。
     *
     * @param materialId 材料主键ID
     * @param tyshxym 企业统一社会信用代码
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestParam Long materialId,
                             @RequestParam String tyshxym) {
        RecruitSiteApplyMaterial old = applyMaterialBPO.findById(materialId);
        if (old == null) {
            throw new BusinessException("申请材料不存在: " + materialId);
        }
        checkSiteOwner(old.getSiteId(), tyshxym);
        applyMaterialBPO.delete(materialId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 查询本单位某个基地的申请材料列表。
     *
     * @param siteId 基地主键ID
     * @param tyshxym 企业统一社会信用代码
     * @return 申请材料列表
     */
    @GetMapping("/list")
    public AjaxResult listBySiteId(@RequestParam Long siteId,
                                   @RequestParam String tyshxym) {
        checkSiteOwner(siteId, tyshxym);
        return AjaxResult.SUCCESS(applyMaterialBPO.listBySiteId(siteId));
    }

    /**
     * 查询本单位申请材料详情。
     *
     * @param materialId 材料主键ID
     * @param tyshxym 企业统一社会信用代码
     * @return 申请材料详情
     */
    @GetMapping("/detail")
    public AjaxResult findById(@RequestParam Long materialId,
                               @RequestParam String tyshxym) {
        RecruitSiteApplyMaterial old = applyMaterialBPO.findById(materialId);
        if (old == null) {
            throw new BusinessException("申请材料不存在: " + materialId);
        }
        checkSiteOwner(old.getSiteId(), tyshxym);
        return AjaxResult.SUCCESS(old);
    }

    private void checkSiteOwner(Long siteId, String tyshxym) {
        RecruitSiteInfo siteInfo = siteInfoBPO.findByTyshxym(tyshxym);
        if (siteInfo == null || !siteId.equals(siteInfo.getSiteId())) {
            throw new BusinessException("无权操作该基地的申请材料");
        }
    }
}
