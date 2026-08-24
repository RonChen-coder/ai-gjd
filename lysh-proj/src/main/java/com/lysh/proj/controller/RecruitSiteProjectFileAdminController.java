package com.lysh.proj.controller;

import com.lysh.proj.common.RecruitFileDownloadUtils;
import com.lysh.proj.model.RecruitGJDFileModel;
import com.lysh.proj.model.RecruitSiteProjectFile;
import com.lysh.proj.service.RecruitFileUploadBPO;
import com.lysh.proj.service.RecruitSiteProjectFileBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地项目文件管理端控制层。
 * 面向市级、区级管理员，提供项目文件上传、修改、下载和列表查询。
 */
@RestController
@RequestMapping("/admin/site-project-file")
public class RecruitSiteProjectFileAdminController {

    private final RecruitSiteProjectFileBPO projectFileBPO;
    private final RecruitFileUploadBPO fileUploadBPO;

    public RecruitSiteProjectFileAdminController(RecruitSiteProjectFileBPO projectFileBPO,
                                                 RecruitFileUploadBPO fileUploadBPO) {
        this.projectFileBPO = projectFileBPO;
        this.fileUploadBPO = fileUploadBPO;
    }

    /**
     * 管理端新增项目文件记录，fileStorageKey 由文件上传接口返回。
     *
     * @param file 项目文件请求体
     * @return 创建后的项目文件
     */
    @PostMapping("/upload")
    public AjaxResult upload(@RequestBody RecruitSiteProjectFile file) {
        if (file == null) {
            throw new BusinessException("项目文件不能为空");
        }
        return AjaxResult.SUCCESS(projectFileBPO.saveProjectFileByAdmin(file));
    }

    /**
     * 管理端修改项目文件。
     *
     * @param file 待更新的项目文件
     * @return 更新后的项目文件
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteProjectFile file) {
        if (file == null) {
            throw new BusinessException("项目文件不能为空");
        }
        return AjaxResult.SUCCESS(projectFileBPO.saveProjectFileChangesByAdmin(file));
    }

    /**
     * 查询项目文件详情。
     *
     * @param fileId 文件主键ID
     * @return 项目文件详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long fileId) {
        return AjaxResult.SUCCESS(projectFileBPO.queryProjectFileById(fileId));
    }

    /**
     * 查询项目文件列表。
     *
     * @param projectId 项目主键ID
     * @return 项目文件列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(projectFileBPO.queryProjectFilesByProjectId(projectId));
    }

    /**
     * 下载项目文件。
     *
     * @param fileId 文件主键ID
     * @param response HTTP响应
     * @return 下载失败时返回提示
     */
    @GetMapping("/download")
    public AjaxResult download(@RequestParam Long fileId, HttpServletResponse response) {
        RecruitSiteProjectFile projectFile = projectFileBPO.queryProjectFileById(fileId);
        if (projectFile == null) {
            throw new BusinessException("项目文件不存在: " + fileId);
        }
        RecruitGJDFileModel fileModel = fileUploadBPO.findFileModel(projectFile.getFileStorageKey());
        if (fileModel == null) {
            throw new BusinessException("文件系统中不存在该key");
        }
        return RecruitFileDownloadUtils.download(response, fileModel.getBytes(), fileModel.getName(), fileModel.getContentType());
    }
}
