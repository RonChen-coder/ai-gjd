package com.wondersgroup.shrs.admin.policy.controller;

import com.wondersgroup.shrs.admin.meeting.model.DownloadPostReqData;
import com.wondersgroup.shrs.admin.meeting.model.FileModel;
import com.wondersgroup.shrs.admin.policy.bpo.PubAdminPolicyFileBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.StringUtils;
import com.wondersgroup.wdls.web.AjaxResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

/**
 * 公共政策文件
 *
 */
@RestController
@RequestMapping("/admin/policy/file")
public class AdminPolicyFileController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    public PubAdminPolicyFileBPO pubAdminPolicyFileBPO;

    /**
     * 上传文件
     *
     * @return
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public AjaxResult savePolicyWj(@RequestParam("file") MultipartFile fileUpload){
        if (Objects.isNull(fileUpload)){
            throw new BusinessException("上传文件为空");
        }
        String keyId = pubAdminPolicyFileBPO.savePolicyWj(fileUpload);
        return AjaxResult.SUCCESS(keyId);
    }

    /**
     * 下载文件
     * @return
     */
    @RequestMapping(value = "/download", method = RequestMethod.POST)
    public AjaxResult downLoadByFileId(@RequestBody @Validated DownloadPostReqData data, HttpServletResponse response){
        if (Objects.isNull(data) || StringUtils.isEmpty(data.getFileId())){
            throw new BusinessException("下载文件参数错误.");
        }
        try {
            logger.info("进行下载文件ID:{}", data.getFileId());
            FileModel fileModel = pubAdminPolicyFileBPO.findFileModel(data.getFileId());

            if (Objects.isNull(fileModel)) {
                logger.info("下载文件不存在:{}", data.getFileId());
                throw new BusinessException("文件系统中不存在该key.");
            }

            return this.downloadFile(response, fileModel.getBytes(), fileModel.getName(), fileModel.getContentType());
        }catch (Exception e){
            logger.info("下载文件失败:", e);
            response.addHeader("Err-Msg", e.getMessage());
            return AjaxResult.SUCCESS("下载文件失败");
        }

    }


    public AjaxResult downloadFile(HttpServletResponse response, byte[] bytes, String filename, String contentType) {
        try {
            filename = UriUtils.encode(filename, "UTF-8");

            response.setContentType(contentType);
            response.setCharacterEncoding("UTF-8");
            String resultFileName = new String(filename.getBytes(StandardCharsets.UTF_8 ),StandardCharsets.ISO_8859_1 );

            //设置下载的文件名
            response.addHeader("Content-Disposition", "attachment;filename=" + resultFileName);
//            response.addHeader("Content-Disposition", "inline;filename=" + resultFileName);
            response.getOutputStream().write(bytes);

        } catch (Exception e) {
            logger.info("进行下载文件失败:",e);
            response.addHeader("Err-Msg", e.getMessage());
            return AjaxResult.SUCCESS("下载文件失败");
        }
        return null;
    }
}
