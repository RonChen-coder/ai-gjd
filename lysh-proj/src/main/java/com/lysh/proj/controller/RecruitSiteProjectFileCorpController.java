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
 * 高基地项目文件企业端控制层。
 * 面向白名单内单位，提供项目文件上传、修改、下载和删除。
 */
@RestController
@RequestMapping("/corp/site-project-file")
public class RecruitSiteProjectFileCorpController {

    private final RecruitSiteProjectFileBPO projectFileBPO;
    private final RecruitFileUploadBPO fileUploadBPO;

    public RecruitSiteProjectFileCorpController(RecruitSiteProjectFileBPO projectFileBPO,
                                                RecruitFileUploadBPO fileUploadBPO) {
        this.projectFileBPO = projectFileBPO;
        this.fileUploadBPO = fileUploadBPO;
    }

    /**
     * 企业端上传当前单位项目文件。
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
            return AjaxResult.SUCCESS(projectFileBPO.uploadByCorp(fileModel, projectId, projectStatus, fileName, fileDesc));
        } catch (IOException e) {
            throw new BusinessException("上传文件失败");
        }
    }

    /**
     * 企业端修改当前单位项目文件。
     *
     * @param file 待更新的项目文件
     * @return 更新后的项目文件
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteProjectFile file) {
        if (file == null) {
            throw new BusinessException("项目文件不能为空");
        }
        return AjaxResult.SUCCESS(projectFileBPO.updateByCorp(file));
    }

    /**
     * 企业端删除项目文件，同时删除文件存储。
     *
     * @param fileId 文件主键ID
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestParam Long fileId) {
        projectFileBPO.deleteByCorp(fileId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 查询当前单位项目文件详情。
     *
     * @param fileId 文件主键ID
     * @return 项目文件详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long fileId) {
        return AjaxResult.SUCCESS(projectFileBPO.findCorpById(fileId));
    }

    /**
     * 查询当前单位项目文件列表。
     *
     * @param projectId 项目主键ID
     * @return 项目文件列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(projectFileBPO.listCorpByProjectId(projectId));
    }

    /**
     * 下载当前单位项目文件。
     *
     * @param fileId 文件主键ID
     * @param response HTTP响应
     * @return 下载失败时返回提示
     */
    @GetMapping("/download")
    public AjaxResult download(@RequestParam Long fileId, HttpServletResponse response) {
        RecruitSiteProjectFile projectFile = projectFileBPO.findCorpById(fileId);
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
