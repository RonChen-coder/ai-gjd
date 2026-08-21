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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

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
     * 管理端上传项目文件。
     *
     * @param file 上传文件
     * @param projectId 项目主键ID
     * @param projectStatus 项目状态
     * @param fileName 文件名称，可选
     * @param fileDesc 文件说明，可选
     * @return 创建后的项目文件
     */
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file,
                             @RequestParam Long projectId,
                             @RequestParam String projectStatus,
                             @RequestParam(required = false) String fileName,
                             @RequestParam(required = false) String fileDesc) {
        try {
            RecruitGJDFileModel fileModel = new RecruitGJDFileModel(
                    file.getOriginalFilename(), file.getBytes(), file.getContentType());
            return AjaxResult.SUCCESS(projectFileBPO.uploadByAdmin(fileModel, projectId, projectStatus, fileName, fileDesc));
        } catch (IOException e) {
            throw new BusinessException("上传文件失败");
        }
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
        return AjaxResult.SUCCESS(projectFileBPO.updateByAdmin(file));
    }

    /**
     * 查询项目文件详情。
     *
     * @param fileId 文件主键ID
     * @return 项目文件详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long fileId) {
        return AjaxResult.SUCCESS(projectFileBPO.findById(fileId));
    }

    /**
     * 查询项目文件列表。
     *
     * @param projectId 项目主键ID
     * @return 项目文件列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(projectFileBPO.listByProjectId(projectId));
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
        RecruitSiteProjectFile projectFile = projectFileBPO.findById(fileId);
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
