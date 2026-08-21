package com.lysh.proj.service;

import com.lysh.proj.model.RecruitGJDFileModel;
import com.shdata.components.fsstore.FSEntity;
import com.shdata.components.fsstore.FSManager;
import com.wondersgroup.wdls.core.exception.BusinessException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

/**
 * 文件上传业务处理实现类。
 * 使用 FSManager 将文件上传到 GJDbucket，并支持按key查询下载。
 */
@Service
public class RecruitFileUploadBPOImpl implements RecruitFileUploadBPO {

    private static final Logger logger = LoggerFactory.getLogger(RecruitFileUploadBPOImpl.class);
    private static final String BUCKET_NAME = "GJDbucket";
    private static final Set<String> ALLOWED_FILE_TYPES = new HashSet<>(Arrays.asList(
            "pdf", "jpg", "jpeg", "png", "doc", "docx", "xls", "xlsx"));

    private final FSManager fsManager;

    public RecruitFileUploadBPOImpl(FSManager fsManager) {
        this.fsManager = fsManager;
    }

    @Override
    public String upload(RecruitGJDFileModel file) {
        if (file == null || file.getBytes() == null || file.getBytes().length == 0) {
            throw new BusinessException("上传文件为空");
        }
        String originalName = file.getName();
        if (originalName == null || !originalName.contains(".")) {
            throw new BusinessException("文件名不合法");
        }
        String suffix = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase(Locale.ROOT);
        if (!ALLOWED_FILE_TYPES.contains(suffix)) {
            throw new BusinessException("文件上传格式错误");
        }
        String fileName = UUID.randomUUID() + "." + suffix;
        try {
            FSEntity fsEntity = new FSEntity();
            fsEntity.setName(fileName);
            fsEntity.setInputstream(new ByteArrayInputStream(file.getBytes()));
            fsEntity.setContentType(file.getContentType());
            FSEntity resultFsEntity = fsManager.putObject(BUCKET_NAME, fsEntity);
            return resultFsEntity.getKeyId();
        } catch (Exception e) {
            logger.error("上传文件失败", e);
            throw new BusinessException("上传文件失败");
        }
    }

    @Override
    public RecruitGJDFileModel findFileModel(String fileId) {
        if (fileId == null || fileId.isBlank()) {
            throw new BusinessException("文件存储key不能为空");
        }
        try {
            FSEntity fsEntity = fsManager.getObject(BUCKET_NAME, fileId);
            if (fsEntity == null || fsEntity.getInputstream() == null) {
                throw new BusinessException("文件系统中不存在该key");
            }
            byte[] bytes = fsEntity.getInputstream().readAllBytes();
            return new RecruitGJDFileModel(fsEntity.getName(), bytes, fsEntity.getContentType());
        } catch (Exception e) {
            logger.error("从FSManager获取文件失败", e);
            return null;
        }
    }

    @Override
    public void deleteFileModel(String fileId) {
        if (fileId == null || fileId.isBlank()) {
            throw new BusinessException("文件存储key不能为空");
        }
        try {
            fsManager.deleteObject(BUCKET_NAME, fileId);
        } catch (Exception e) {
            logger.error("从FSManager删除文件失败", e);
            throw new BusinessException("删除文件失败");
        }
    }
}
