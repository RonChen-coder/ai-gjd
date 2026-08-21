package com.wondersgroup.shrs.admin.gjd;

import com.wondersgroup.shrs.corp.gjd.bpo.RecruitGJDFileUploadBPO;
import com.wondersgroup.shrs.corp.gjd.model.RecruitGJDFileDownloadReqData;
import com.wondersgroup.shrs.corp.gjd.model.RecruitGJDFileModel;
import com.wondersgroup.shrs.myutils.RecruitFileDownloadUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.StringUtils;
import com.wondersgroup.wdls.web.AjaxResult;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * 文件上传管理端控制层。
 * 面向市级、区级管理员，提供文件上传和下载接口。
 */
@RestController
@RequestMapping("/admin/file-upload")
public class RecruitGJDFileUploadAdminController {
    private static final Logger log = LoggerFactory.getLogger(RecruitGJDFileUploadAdminController.class);
    @Autowired
    private RecruitGJDFileUploadBPO fileUploadBPO;
    private static final Set<String> ALLOWED_FILE_TYPES = new HashSet<>(Arrays.asList(
            "pdf", "jpg", "jpeg", "png", "doc", "docx", "xls", "xlsx"));

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
        // 3. 文件大小限制(可在配置文件中配置)
        long maxSize = 10 * 1024 * 1024; // 10MB
        if (file.getSize() > maxSize) {
            throw new BusinessException("文件大小不能超过10M");
        }
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase(Locale.ROOT);
        if (!ALLOWED_FILE_TYPES.contains(suffix)) {
            throw new BusinessException("文件上传格式错误");
        }
        try {
            return AjaxResult.SUCCESS(fileUploadBPO.upload(new RecruitGJDFileModel(originalFilename,file.getBytes(), file.getContentType())));
        } catch (IOException e) {
            log.error("上传文件失败");
        }
        return AjaxResult.FAILURE("上传文件失败");
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
        if (data == null || StringUtils.isEmpty(data.getFileId())) {
            throw new BusinessException("下载文件参数错误");
        }
        RecruitGJDFileModel fileModel = fileUploadBPO.findFileModel(data.getFileId());
        if (fileModel == null) {
            throw new BusinessException("文件系统中不存在该key");
        }
        return RecruitFileDownloadUtils.download(response, fileModel.getBytes(), fileModel.getName(), fileModel.getContentType());
    }
}
