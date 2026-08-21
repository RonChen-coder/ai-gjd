package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteProject;
import com.lysh.proj.model.RecruitSiteProjectQueryReq;
import com.lysh.proj.service.RecruitSiteProjectBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地项目信息企业端控制层。
 * 面向白名单内单位，提供本单位项目信息的上传、修改、删除和分页查询接口。
 */
@RestController
@RequestMapping("/corp/site-project")
public class RecruitSiteProjectCorpController {

    private final RecruitSiteProjectBPO projectBPO;

    public RecruitSiteProjectCorpController(RecruitSiteProjectBPO projectBPO) {
        this.projectBPO = projectBPO;
    }

    /**
     * 单位上传项目信息，提交后进入待审核。
     *
     * @param project 项目信息请求体
     * @return 创建后的项目信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteProject project) {
        if (project == null) {
            throw new BusinessException("项目信息不能为空");
        }
        return AjaxResult.SUCCESS(projectBPO.createByCorp(project));
    }

    /**
     * 单位修改本单位项目信息，修改后进入待审核。
     *
     * @param project 待更新的项目信息
     * @return 更新后的项目信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteProject project) {
        if (project == null) {
            throw new BusinessException("项目信息不能为空");
        }
        return AjaxResult.SUCCESS(projectBPO.updateByCorp(project));
    }

    /**
     * 单位删除本单位项目信息。
     *
     * @param projectId 项目主键ID
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestParam Long projectId) {
        projectBPO.deleteByCorp(projectId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 查询本单位项目信息详情。
     *
     * @param projectId 项目主键ID
     * @return 项目信息详情
     */
    @GetMapping("/detail")
    public AjaxResult findById(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(projectBPO.findCorpById(projectId));
    }

    /**
     * 分页查询本单位项目信息列表。
     *
     * @param req 查询条件
     * @return 项目信息分页结果
     */
    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteProjectQueryReq req) {
        return AjaxResult.PAGE(projectBPO.queryCorpList(req));
    }
}
