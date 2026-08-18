package com.lysh.proj.controller;

import com.lysh.proj.common.RecruitFileDownloadUtils;
import com.lysh.proj.model.RecruitGJDFileDownloadReqData;
import com.lysh.proj.model.RecruitGJDFileModel;
import com.lysh.proj.service.RecruitFileUploadBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传管理端控制层。
 * 面向市级、区级管理员，提供文件上传和下载接口。
 */
@RestController
@RequestMapping("/admin/file-upload")
public class RecruitFileUploadAdminController {

    private final RecruitFileUploadBPO fileUploadBPO;

    public RecruitFileUploadAdminController(RecruitFileUploadBPO fileUploadBPO) {
        this.fileUploadBPO = fileUploadBPO;
    }

    /**
     * 上传文件。
     *
     * @param file 上传文件
     * @return 文件存储key
     */
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            throw new BusinessException("上传文件为空");
        }
        return AjaxResult.SUCCESS(fileUploadBPO.upload(file));
    }

    /**
     * 下载文件。
     *
     * @param data 下载请求，fileId 必填
     * @param response HTTP响应
     * @return 下载失败时返回提示
     */
    @PostMapping("/download")
    public AjaxResult download(@RequestBody RecruitGJDFileDownloadReqData data, HttpServletResponse response) {
        if (data == null || data.getFileId() == null || data.getFileId().isBlank()) {
            throw new BusinessException("下载文件参数错误");
        }
        RecruitGJDFileModel fileModel = fileUploadBPO.findFileModel(data.getFileId());
        if (fileModel == null) {
            throw new BusinessException("文件系统中不存在该key");
        }
        return RecruitFileDownloadUtils.download(response, fileModel.getBytes(), fileModel.getName(), fileModel.getContentType());
    }
}
