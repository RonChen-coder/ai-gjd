package com.lysh.proj.service;

import com.lysh.proj.model.RecruitGJDFileModel;

/**
 * 文件上传业务处理接口。
 * 定义上传文件到文件系统和按key查询文件的能力。
 */
public interface RecruitFileUploadBPO {

    /**
     * 上传文件到 GJDbucket。
     *
     * @param file 待上传文件模型
     * @return 文件存储key
     */
    String upload(RecruitGJDFileModel file);

    /**
     * 根据文件存储key查询文件。
     *
     * @param fileId 文件存储key
     * @return 文件模型
     */
    RecruitGJDFileModel findFileModel(String fileId);

    /**
     * 根据文件存储key删除文件。
     *
     * @param fileId 文件存储key
     */
    void deleteFileModel(String fileId);
}
