package com.lysh.proj.entity;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 高基地申请材料实体类。
 * 对应表 RECRUIT_SITE_APPLY_MATERIAL。
 */
@Entity
@Table(name = "RECRUIT_SITE_APPLY_MATERIAL", schema = "WSBS")
public class RecruitSiteApplyMaterialEntity implements ValueObject {

    @Id
    @GeneratedValue(generator = "SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL")
    @SequenceGenerator(name = "SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL", allocationSize = 1, sequenceName = "SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL")
    @Column(name = "material_id")
    private Long materialId;

    @Basic
    @Column(name = "site_id")
    private Long siteId;

    @Basic
    @Column(name = "material_name")
    private String materialName;

    @Basic
    @Column(name = "material_desc")
    private String materialDesc;

    @Basic
    @Column(name = "file_name")
    private String fileName;

    @Basic
    @Column(name = "file_storage_key")
    private String fileStorageKey;

    @Basic
    @Column(name = "status")
    private String status;

    @Basic
    @Column(name = "uploader_name")
    private String uploaderName;

    @Basic
    @Column(name = "uploader_id")
    private String uploaderId;

    @Basic
    @Column(name = "created_at")
    private Date createdAt;

    @Basic
    @Column(name = "updated_at")
    private Date updatedAt;

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getMaterialDesc() {
        return materialDesc;
    }

    public void setMaterialDesc(String materialDesc) {
        this.materialDesc = materialDesc;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileStorageKey() {
        return fileStorageKey;
    }

    public void setFileStorageKey(String fileStorageKey) {
        this.fileStorageKey = fileStorageKey;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
