package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteAnnualPlanQueryReq;
import com.lysh.proj.model.RecruitSiteAnnualPlanReviewReq;
import com.lysh.proj.service.RecruitSiteAnnualPlanBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地年报计划管理端控制层。
 */
@RestController
@RequestMapping("/admin/site-annual-plan")
public class RecruitSiteAnnualPlanAdminController {

    private final RecruitSiteAnnualPlanBPO annualPlanBPO;

    public RecruitSiteAnnualPlanAdminController(RecruitSiteAnnualPlanBPO annualPlanBPO) {
        this.annualPlanBPO = annualPlanBPO;
    }

    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteAnnualPlanQueryReq req) {
        return AjaxResult.PAGE(annualPlanBPO.queryAdminList(req));
    }

    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long planId) {
        return AjaxResult.SUCCESS(annualPlanBPO.findAdminById(planId));
    }

    @PostMapping("/review")
    public AjaxResult review(@RequestBody RecruitSiteAnnualPlanReviewReq req) {
        if (req == null || req.getPlanId() == null) {
            throw new BusinessException("年报计划ID不能为空");
        }
        return AjaxResult.SUCCESS(annualPlanBPO.review(req.getPlanId(), req.getStatus(), req.getReviewOpinion()));
    }
}
