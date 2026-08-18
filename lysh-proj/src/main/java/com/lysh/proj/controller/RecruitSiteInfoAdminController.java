package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.model.RecruitSiteInfoReviewReq;
import com.lysh.proj.service.RecruitSiteInfoBPO;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地信息管理端控制层。
 * 面向市级、区级管理员，提供基地信息维护、查询和区级审核接口。
 */
@RestController
@RequestMapping("/admin/site-info")
public class RecruitSiteInfoAdminController {

    private final RecruitSiteInfoBPO siteInfoBPO;

    public RecruitSiteInfoAdminController(RecruitSiteInfoBPO siteInfoBPO) {
        this.siteInfoBPO = siteInfoBPO;
    }

    /**
     * 市区管理员新增高基地信息，免审核直接生效。
     *
     * @param siteInfo 高基地信息请求体
     * @return 创建后的高基地信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteInfo siteInfo) {
        return AjaxResult.SUCCESS(siteInfoBPO.createByAdmin(siteInfo));
    }

    /**
     * 市区管理员修改高基地信息，免审核直接生效。
     *
     * @param siteInfo 待更新的高基地信息
     * @return 更新后的高基地信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteInfo siteInfo) {
        return AjaxResult.SUCCESS(siteInfoBPO.updateByAdmin(siteInfo));
    }

    /**
     * 删除高基地信息。
     *
     * @param siteId 基地主键ID
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestParam Long siteId) {
        siteInfoBPO.delete(siteId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 查询高基地信息列表。
     * 支持按属地区编码或状态过滤，不传条件时市级管理员查看全部。
     *
     * @param districtCode 属地区编码，可选
     * @param status 状态，可选
     * @return 高基地信息列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam(required = false) String districtCode,
                           @RequestParam(required = false) String status) {
        if (districtCode != null && !districtCode.isBlank()) {
            return AjaxResult.SUCCESS(siteInfoBPO.listByDistrictCode(districtCode));
        }
        if (status != null && !status.isBlank()) {
            return AjaxResult.SUCCESS(siteInfoBPO.listByStatus(status));
        }
        return AjaxResult.SUCCESS(siteInfoBPO.listAll());
    }

    /**
     * 根据基地ID查询高基地信息详情。
     *
     * @param siteId 基地主键ID
     * @return 高基地信息详情
     */
    @GetMapping("/detail")
    public AjaxResult findById(@RequestParam Long siteId) {
        return AjaxResult.SUCCESS(siteInfoBPO.findById(siteId));
    }

    /**
     * 区级管理员审核高基地信息。
     *
     * @param siteId 基地主键ID
     * @param reviewer 审核人
     * @param reviewOpinion 审核意见
     * @param status 审核结果，已通过或已驳回
     * @return 审核后的高基地信息
     */
    @PostMapping("/review")
    public AjaxResult review(@RequestBody RecruitSiteInfoReviewReq req) {
        return AjaxResult.SUCCESS(siteInfoBPO.review(req.getSiteId(), req.getReviewer(), req.getReviewOpinion(), req.getStatus()));
    }
}
