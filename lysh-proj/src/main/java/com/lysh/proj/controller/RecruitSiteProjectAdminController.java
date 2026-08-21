package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteProject;
import com.lysh.proj.model.RecruitSiteProjectQueryReq;
import com.lysh.proj.model.RecruitSiteProjectReviewReq;
import com.lysh.proj.service.RecruitSiteProjectBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地项目信息管理端控制层。
 * 面向市级、区级管理员，提供项目信息维护、分页检索和区级审核接口。
 */
@RestController
@RequestMapping("/admin/site-project")
public class RecruitSiteProjectAdminController {

    private final RecruitSiteProjectBPO projectBPO;

    public RecruitSiteProjectAdminController(RecruitSiteProjectBPO projectBPO) {
        this.projectBPO = projectBPO;
    }

    /**
     * 市区管理员新增项目信息，免审核直接生效。
     *
     * @param project 项目信息请求体，siteId 必填
     * @return 创建后的项目信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteProject project) {
        if (project == null) {
            throw new BusinessException("项目信息不能为空");
        }
        return AjaxResult.SUCCESS(projectBPO.createByAdmin(project));
    }

    /**
     * 市区管理员修改项目信息，免审核直接生效。
     *
     * @param project 待更新的项目信息
     * @return 更新后的项目信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteProject project) {
        if (project == null) {
            throw new BusinessException("项目信息不能为空");
        }
        return AjaxResult.SUCCESS(projectBPO.updateByAdmin(project));
    }

    /**
     * 删除项目信息。
     *
     * @param projectId 项目主键ID
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestParam Long projectId) {
        projectBPO.delete(projectId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 根据项目ID查询项目信息详情。
     *
     * @param projectId 项目主键ID
     * @return 项目信息详情
     */
    @GetMapping("/detail")
    public AjaxResult findById(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(projectBPO.findById(projectId));
    }

    /**
     * 分页查询项目信息列表。
     * 支持按基地、区县、项目名称、申报方向、项目状态、审核状态和关键字检索。
     *
     * @param req 查询条件
     * @return 项目信息分页结果
     */
    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteProjectQueryReq req) {
        return AjaxResult.PAGE(projectBPO.queryList(req));
    }

    /**
     * 区级管理员审核项目信息。
     *
     * @param req 审核请求体
     * @return 审核后的项目信息
     */
    @PostMapping("/review")
    public AjaxResult review(@RequestBody RecruitSiteProjectReviewReq req) {
        if (req == null || req.getProjectId() == null) {
            throw new BusinessException("项目ID不能为空");
        }
        return AjaxResult.SUCCESS(projectBPO.review(req.getProjectId(), req.getReviewOpinion(), req.getStatus()));
    }
}
