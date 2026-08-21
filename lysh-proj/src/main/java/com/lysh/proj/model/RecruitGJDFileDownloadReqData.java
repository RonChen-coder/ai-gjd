package com.lysh.proj.model;

/**
 * 文件下载请求模型。
 * 通过文件存储key下载文件。
 */
public class RecruitGJDFileDownloadReqData {
    /** 文件存储key */
    private String fileId;

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }
}
