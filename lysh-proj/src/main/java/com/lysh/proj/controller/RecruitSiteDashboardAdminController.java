package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteDashboardQueryReq;
import com.lysh.proj.model.RecruitSiteProjectQueryReq;
import com.lysh.proj.service.RecruitSiteDashboardBPO;
import com.lysh.proj.service.RecruitSiteProjectBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地运行状况看板管理端控制层。
 * 为管理端大屏提供看板聚合数据、基地列表和项目详情下钻接口。
 */
@RestController
@RequestMapping("/admin/site-dashboard")
public class RecruitSiteDashboardAdminController {

    private final RecruitSiteDashboardBPO dashboardBPO;
    private final RecruitSiteProjectBPO projectBPO;

    public RecruitSiteDashboardAdminController(RecruitSiteDashboardBPO dashboardBPO,
                                               RecruitSiteProjectBPO projectBPO) {
        this.dashboardBPO = dashboardBPO;
        this.projectBPO = projectBPO;
    }

    /**
     * 获取看板聚合数据。
     * <p>
     * 返回 KPI 汇总以及区县、行业、基地项目数、历年资金、项目状态、预警状态等图表数据。
     *
     * @param req 筛选条件，支持区县、行业
     * @return 看板聚合数据
     */
    @PostMapping("/overview")
    public AjaxResult overview(@RequestBody(required = false) RecruitSiteDashboardQueryReq req) {
        return AjaxResult.SUCCESS(dashboardBPO.getDashboardData(req));
    }

    /**
     * 查询符合条件的基地列表。
     * <p>
     * 用于点击图表后下钻展示基地，支持按区县、行业以及基地至少包含项目数筛选。
     *
     * @param req 筛选条件
     * @return 基地列表
     */
    @PostMapping("/base-list")
    public AjaxResult baseList(@RequestBody(required = false) RecruitSiteDashboardQueryReq req) {
        return AjaxResult.SUCCESS(dashboardBPO.queryBaseList(req));
    }

    /**
     * 查询基地下钻项目列表。
     * <p>
     * 复用现有项目分页查询，支持按基地等条件检索。
     *
     * @param req 项目查询条件
     * @return 项目分页结果
     */
    @PostMapping("/project-list")
    public AjaxResult projectList(@RequestBody(required = false) RecruitSiteProjectQueryReq req) {
        return AjaxResult.PAGE(projectBPO.queryProjectList(req));
    }

    /**
     * 查询项目详情下钻数据。
     * <p>
     * 返回项目基本信息、项目资产列表和项目文档列表。
     *
     * @param projectId 项目ID
     * @return 项目详情聚合数据
     */
    @GetMapping("/project-detail")
    public AjaxResult projectDetail(@RequestParam Long projectId) {
        if (projectId == null) {
            throw new BusinessException("项目ID不能为空");
        }
        return AjaxResult.SUCCESS(dashboardBPO.getProjectDetail(projectId));
    }
}
