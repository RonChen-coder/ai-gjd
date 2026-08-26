package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.util.Date;

/**
 * 高基地项目资产模型。
 * 对应表 RECRUIT_SITE_ASSET，字段与实体类保持一致。
 */
public class RecruitSiteAsset implements ValueObject {
    /** 资产ID */
    private Long assetId;
    /** 关联项目ID */
    private Long projectId;
    /** 关联基地ID */
    private Long siteId;
    /** 企业统一社会信用代码，冗余用于统计和搜索 */
    private String tyshxym;
    /** 分管区县编码，继承所属基地属地区 */
    private String districtCode;
    /** 资产名称 */
    private String assetName;
    /** 数量 */
    private Long quantity;
    /** 单位 */
    private String unit;
    /** 品牌型号 */
    private String brandModel;
    /** 存放地点 */
    private String storageLocation;
    /** 资产状态，字典取值 */
    private String assetStatus;
    /** 使用频次，由企业端维护 */
    private Long usageFrequency;
    /** 资产照片，文件存储key */
    private String assetPhoto;
    /** 创建人 */
    private String createdBy;
    /** 创建时间 */
    private Date createdAt;
    /** 修改人 */
    private String updatedBy;
    /** 修改时间 */
    private Date updatedAt;

    public Long getAssetId() {
        return assetId;
    }

    public void setAssetId(Long assetId) {
        this.assetId = assetId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getTyshxym() {
        return tyshxym;
    }

    public void setTyshxym(String tyshxym) {
        this.tyshxym = tyshxym;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getBrandModel() {
        return brandModel;
    }

    public void setBrandModel(String brandModel) {
        this.brandModel = brandModel;
    }

    public String getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(String storageLocation) {
        this.storageLocation = storageLocation;
    }

    public String getAssetStatus() {
        return assetStatus;
    }

    public void setAssetStatus(String assetStatus) {
        this.assetStatus = assetStatus;
    }

    public Long getUsageFrequency() {
        return usageFrequency;
    }

    public void setUsageFrequency(Long usageFrequency) {
        this.usageFrequency = usageFrequency;
    }

    public String getAssetPhoto() {
        return assetPhoto;
    }

    public void setAssetPhoto(String assetPhoto) {
        this.assetPhoto = assetPhoto;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
