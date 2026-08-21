package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.util.Date;

/**
 * 高基地项目文件模型。
 * 对应表 RECRUIT_SITE_PROJECT_FILE。
 */
public class RecruitSiteProjectFile implements ValueObject {
    /** 文件ID */
    private Long fileId;
    /** 关联项目ID */
    private Long projectId;
    /** 项目状态，文件挂接到对应项目进度阶段 */
    private String projectStatus;
    /** 文件名称 */
    private String fileName;
    /** 文件说明 */
    private String fileDesc;
    /** 文件存储key */
    private String fileStorageKey;
    /** 上传人 */
    private String uploaderName;
    /** 上传人编号 */
    private String uploaderId;
    /** 创建时间 */
    private Date createdAt;
    /** 修改时间 */
    private Date updatedAt;

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileDesc() {
        return fileDesc;
    }

    public void setFileDesc(String fileDesc) {
        this.fileDesc = fileDesc;
    }

    public String getFileStorageKey() {
        return fileStorageKey;
    }

    public void setFileStorageKey(String fileStorageKey) {
        this.fileStorageKey = fileStorageKey;
    }

    public String getUploaderName() {
        return uploaderName;
    }

    public void setUploaderName(String uploaderName) {
        this.uploaderName = uploaderName;
    }

    public String getUploaderId() {
        return uploaderId;
    }

    public void setUploaderId(String uploaderId) {
        this.uploaderId = uploaderId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
