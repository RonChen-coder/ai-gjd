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
     * 企业端新增当前单位项目文件记录，fileStorageKey 由文件上传接口返回。
     *
     * @param file 项目文件请求体
     * @return 创建后的项目文件
     */
    @PostMapping("/upload")
    public AjaxResult upload(@RequestBody RecruitSiteProjectFile file) {
        if (file == null) {
            throw new BusinessException("项目文件不能为空");
        }
        return AjaxResult.SUCCESS(projectFileBPO.saveProjectFileByCorp(file));
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
        return AjaxResult.SUCCESS(projectFileBPO.saveProjectFileChangesByCorp(file));
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
        return AjaxResult.SUCCESS(projectFileBPO.queryProjectFileCorpById(fileId));
    }

    /**
     * 查询当前单位项目文件列表。
     *
     * @param projectId 项目主键ID
     * @return 项目文件列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long projectId) {
        return AjaxResult.SUCCESS(projectFileBPO.queryProjectFilesCorpByProjectId(projectId));
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
        RecruitSiteProjectFile projectFile = projectFileBPO.queryProjectFileCorpById(fileId);
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
