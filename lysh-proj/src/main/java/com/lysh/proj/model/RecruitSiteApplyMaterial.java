package com.lysh.proj.model;

import java.util.Date;

/**
 * 高基地申请材料模型。
 * 对应表 RECRUIT_SITE_APPLY_MATERIAL，字段与实体类保持一致。
 */
public class RecruitSiteApplyMaterial {
    /** 材料ID */
    private Long materialId;
    /** 关联基地ID */
    private Long siteId;
    /** 材料名称 */
    private String materialName;
    /** 材料说明 */
    private String materialDesc;
    /** 文件名称 */
    private String fileName;
    /** 文件存储key */
    private String fileStorageKey;
    /** 材料状态，有效/作废/已归档 */
    private String status;
    /** 上传人 */
    private String uploaderName;
    /** 上传人编号 */
    private String uploaderId;
    /** 创建时间 */
    private Date createdAt;
    /** 修改时间 */
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
