package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地项目文件实体类。
 * 对应表 RECRUIT_SITE_PROJECT_FILE。
 */
@Entity
@Table(name = "RECRUIT_SITE_PROJECT_FILE", schema = "WSBS")
public class RecruitSiteProjectFileEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_PROJECT_FILE")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_PROJECT_FILE", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_PROJECT_FILE")
    @Column(name = "file_id")
    /** 文件ID */
    private Long fileId;

    @Basic
    @Column(name = "project_id")
    /** 关联项目ID */
    private Long projectId;

    @Basic
    @Column(name = "project_status")
    /** 项目状态，文件挂接到对应项目进度阶段 */
    private String projectStatus;

    @Basic
    @Column(name = "file_name")
    /** 文件名称 */
    private String fileName;

    @Basic
    @Column(name = "file_desc")
    /** 文件说明 */
    private String fileDesc;

    @Basic
    @Column(name = "file_storage_key")
    /** 文件存储key */
    private String fileStorageKey;

    @Basic
    @Column(name = "uploader_name")
    /** 上传人 */
    private String uploaderName;

    @Basic
    @Column(name = "uploader_id")
    /** 上传人编号 */
    private String uploaderId;

    @Basic
    @Column(name = "created_at")
    /** 创建时间 */
    private Date createdAt;

    @Basic
    @Column(name = "updated_at")
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
