package com.wondersgroup.shrs.corp.gjd.bpo.impl;


import com.shdata.components.fsstore.FSAccessControlList;
import com.shdata.components.fsstore.FSEntity;
import com.shdata.components.fsstore.FSManager;
import com.wondersgroup.shrs.corp.gjd.bpo.RecruitGJDFileUploadBPO;
import com.wondersgroup.shrs.corp.gjd.model.RecruitGJDFileModel;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.StringUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.*;

/**
 * 文件上传业务处理实现类。
 * 使用 FSManager 将文件上传到 GJDbucket，并支持按key查询下载。
 */
@Service
public class RecruitFileUploadBPOImpl implements RecruitGJDFileUploadBPO {

    private static final Logger logger = LoggerFactory.getLogger(RecruitFileUploadBPOImpl.class);
    private static final String BUCKET_NAME = "xc-obs-shrs-rsxcgz-06";
    private static final Set<String> ALLOWED_FILE_TYPES = new HashSet<>(Arrays.asList(
            "pdf", "jpg", "jpeg", "png", "doc", "docx", "xls", "xlsx"));

    private final FSManager fsManager;

    public RecruitFileUploadBPOImpl(@Autowired@Qualifier("gjdFSManager") FSManager fsManager) {
        this.fsManager = fsManager;
    }

    @Override
    public String upload(RecruitGJDFileModel file) {
        if (Objects.isNull(file)) {
            throw new BusinessException("上传文件为空");
        }
        String originalName = file.getName();
        if (originalName == null || !originalName.contains(".")) {
            throw new BusinessException("文件名不合法");
        }



        try {
            byte[] bytes = file.getBytes();
            if (bytes == null || bytes.length == 0) {
                throw new BusinessException("上传文件为空");
            }
            FSEntity fsEntity = new FSEntity();
            fsEntity.setName(file.getName());
            fsEntity.setInputstream(new ByteArrayInputStream(bytes));
            fsEntity.setContentType(file.getContentType());
            fsEntity.setSize(bytes.length);
            fsEntity.setAcl(FSAccessControlList.Private);
            FSEntity resultFsEntity = fsManager.putObject(BUCKET_NAME, fsEntity);
            return resultFsEntity.getKeyId();
        } catch (Exception e) {
            logger.error("上传文件失败", e);
            throw new BusinessException("上传文件失败");
        }
    }

    @Override
    public RecruitGJDFileModel findFileModel(String fileId) {
        if (StringUtils.isEmpty(fileId)) {
            throw new BusinessException("文件存储key不能为空");
        }
        try {
            FSEntity fsEntity = fsManager.getObject(BUCKET_NAME, fileId);
            if (fsEntity == null) {
                throw new BusinessException("文件系统中不存在该key");
            }
            byte[] bytes;
            try (InputStream inputStream = fsEntity.getInputstream()) {
                if (inputStream == null) {
                    throw new BusinessException("文件系统中不存在该key");
                }
                bytes = IOUtils.toByteArray(inputStream);
            }
            if (fsEntity.getSize() > 0 && bytes.length != fsEntity.getSize()) {
                throw new BusinessException("文件内容不完整");
            }
            return new RecruitGJDFileModel(fsEntity.getName(), bytes, fsEntity.getContentType());
        } catch (Exception e) {
            logger.error("从FSManager获取文件失败", e);
            return null;
        }
    }

    @Override
    public void deleteFileModel(String fileId) {
        fsManager.deleteObject(BUCKET_NAME, fileId);
    }
}
