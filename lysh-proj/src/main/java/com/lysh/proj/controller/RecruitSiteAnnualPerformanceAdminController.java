package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteAnnualPerformanceQueryReq;
import com.lysh.proj.model.RecruitSiteAnnualPerformanceScoreReq;
import com.lysh.proj.service.RecruitSiteAnnualPerformanceBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地年度绩效管理端控制层。
 */
@RestController
@RequestMapping("/admin/site-annual-performance")
public class RecruitSiteAnnualPerformanceAdminController {

    private final RecruitSiteAnnualPerformanceBPO annualPerformanceBPO;

    public RecruitSiteAnnualPerformanceAdminController(RecruitSiteAnnualPerformanceBPO annualPerformanceBPO) {
        this.annualPerformanceBPO = annualPerformanceBPO;
    }

    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteAnnualPerformanceQueryReq req) {
        return AjaxResult.PAGE(annualPerformanceBPO.queryAdminList(req));
    }

    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long performanceId) {
        return AjaxResult.SUCCESS(annualPerformanceBPO.findAdminById(performanceId));
    }

    @PostMapping("/score")
    public AjaxResult score(@RequestBody RecruitSiteAnnualPerformanceScoreReq req) {
        if (req == null || req.getPerformanceId() == null) {
            throw new BusinessException("年度绩效ID不能为空");
        }
        return AjaxResult.SUCCESS(annualPerformanceBPO.score(req.getPerformanceId(), req.getScore(), req.getScoreOpinion()));
    }
}
