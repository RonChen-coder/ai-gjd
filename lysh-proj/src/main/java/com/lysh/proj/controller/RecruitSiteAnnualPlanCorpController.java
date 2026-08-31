package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteAnnualPlan;
import com.lysh.proj.model.RecruitSiteAnnualPlanQueryReq;
import com.lysh.proj.service.RecruitSiteAnnualPlanBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地年报计划企业端控制层。
 */
@RestController
@RequestMapping("/corp/site-annual-plan")
public class RecruitSiteAnnualPlanCorpController {

    private final RecruitSiteAnnualPlanBPO annualPlanBPO;

    public RecruitSiteAnnualPlanCorpController(RecruitSiteAnnualPlanBPO annualPlanBPO) {
        this.annualPlanBPO = annualPlanBPO;
    }

    @PostMapping("/save")
    public AjaxResult save(@RequestBody RecruitSiteAnnualPlan plan) {
        if (plan == null) {
            throw new BusinessException("年报计划不能为空");
        }
        return AjaxResult.SUCCESS(annualPlanBPO.saveByCorp(plan));
    }

    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteAnnualPlanQueryReq req) {
        return AjaxResult.PAGE(annualPlanBPO.queryCorpList(req));
    }

    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long planId) {
        return AjaxResult.SUCCESS(annualPlanBPO.findCorpById(planId));
    }
}
