package com.wondersgroup.shrs.admin.policy.bpo.impl;

import cn.hutool.core.io.FileTypeUtil;
import cn.hutool.core.lang.UUID;
import com.shdata.components.fsstore.FSEntity;
import com.shdata.components.fsstore.FSManager;
import com.wondersgroup.shrs.admin.meeting.model.FileModel;
import com.wondersgroup.shrs.admin.policy.bpo.PubAdminPolicyFileBPO;
import com.wondersgroup.shrs.admin.policy.entity.PubAdminPolicyFileInfoEntity;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.*;

@Service
public class pubAdminPolicyFileBPOImpl implements PubAdminPolicyFileBPO {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private FSManager fsManager;

    @Override
    public String savePolicyWj(MultipartFile fileUpload) {
        String keyId = null;
        try {
            if (Boolean.FALSE.equals(this.checkFileType(fileUpload))){
                throw new BusinessException("文件上传格式错误");
            }
            //获取文件名
            String fileName = fileUpload.getOriginalFilename();
            //获取文件后缀名
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            //重新生成文件名
            fileName = UUID.randomUUID()+suffixName;

            keyId = this.saveFileInfoToFSManager(fileUpload, fileName, "policyBucket");
        } catch (Exception e) {
            logger.error("上传文件失败", e );
            throw new BusinessException("上传文件失败");
        }
        return keyId;
    }

    public String saveFileInfoToFSManager(MultipartFile fileUpload, String fileName, String bucket) throws IOException {
        FSEntity fsEntity = new FSEntity();
        fsEntity.setName(fileName);
        fsEntity.setInputstream(new ByteArrayInputStream(fileUpload.getBytes()));
        fsEntity.setContentType(fileUpload.getContentType());
        FSEntity resultFsEntity = fsManager.putObject(bucket, fsEntity);

        this.doPolicyWj(fileUpload,resultFsEntity);
        return resultFsEntity.getKeyId();
    }

    /**
     * 校验文件是否符合格式
     * 允许pdf格式
     * @param file
     * @return
     */
    private boolean checkFileType(MultipartFile file) throws IOException {
        String fileType = FileTypeUtil.getType(file.getInputStream());
        // 限制的文件类型集合
        Set<String> set = new HashSet<>(Arrays.asList("pdf"));

        return Optional.ofNullable(fileType).map(set::contains).orElse(false);
    }

    @Override
    public FileModel findFileModel(String fileId) {
        try {
            logger.info("进行下载文件ID:{}", fileId);
            FSEntity fsEntity = fsManager.getObject("policyBucket", fileId);

            if (Objects.isNull(fsEntity)) {
                logger.info("下载文件不存在:{}", fileId);
                throw new BusinessException("文件系统中不存在该key.");
            }
            byte[] bytes = new byte[fsEntity.getInputstream().available()];
            IOUtils.readFully(fsEntity.getInputstream(),bytes);
            return new FileModel(fsEntity.getName(), bytes, fsEntity.getContentType());
        }catch (Exception e){
            logger.error("从FsManager获取文件失败:",e);
        }

        return null;
    }

    private void doPolicyWj(MultipartFile fileUpload,FSEntity resultFsEntity){
        PubAdminPolicyFileInfoEntity entity = new PubAdminPolicyFileInfoEntity();
        entity.setZcwjId(resultFsEntity.getKeyId());
        entity.setFileName(fileUpload.getOriginalFilename());
        entity.setFileSize(String.valueOf(fileUpload.getSize()));
        entity.setCjsj(new Date());
        DBUtils.save(entity);
        logger.info("111");
    }
}
