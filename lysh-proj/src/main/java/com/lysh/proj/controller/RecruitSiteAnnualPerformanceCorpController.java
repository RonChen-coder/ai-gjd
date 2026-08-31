package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteAnnualPerformance;
import com.lysh.proj.model.RecruitSiteAnnualPerformanceQueryReq;
import com.lysh.proj.service.RecruitSiteAnnualPerformanceBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地年度绩效企业端控制层。
 */
@RestController
@RequestMapping("/corp/site-annual-performance")
public class RecruitSiteAnnualPerformanceCorpController {

    private final RecruitSiteAnnualPerformanceBPO annualPerformanceBPO;

    public RecruitSiteAnnualPerformanceCorpController(RecruitSiteAnnualPerformanceBPO annualPerformanceBPO) {
        this.annualPerformanceBPO = annualPerformanceBPO;
    }

    @PostMapping("/save")
    public AjaxResult save(@RequestBody RecruitSiteAnnualPerformance performance) {
        if (performance == null) {
            throw new BusinessException("年度绩效不能为空");
        }
        return AjaxResult.SUCCESS(annualPerformanceBPO.saveByCorp(performance));
    }

    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteAnnualPerformanceQueryReq req) {
        return AjaxResult.PAGE(annualPerformanceBPO.queryCorpList(req));
    }

    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long performanceId) {
        return AjaxResult.SUCCESS(annualPerformanceBPO.findCorpById(performanceId));
    }
}
