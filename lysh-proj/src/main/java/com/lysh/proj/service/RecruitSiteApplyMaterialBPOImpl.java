package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteApplyMaterialEntity;
import com.lysh.proj.model.RecruitSiteApplyMaterial;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 高基地申请材料业务处理实现类。
 * 使用内部框架 DBUtils 实现申请材料的新增、修改、删除和查询。
 */
@Service
public class RecruitSiteApplyMaterialBPOImpl implements RecruitSiteApplyMaterialBPO {

    private static final String STATUS_VALID = "有效";
    private static final String COLUMNS = "material_id, site_id, material_name, material_desc, file_name, " +
            "file_storage_key, status, uploader_name, uploader_id, created_at, updated_at";

    @Override
    public RecruitSiteApplyMaterial create(RecruitSiteApplyMaterial material) {
        if (material.getSiteId() == null) {
            throw new BusinessException("基地ID不能为空");
        }
        if (isBlank(material.getMaterialName())) {
            throw new BusinessException("材料名称不能为空");
        }
        if (isBlank(material.getFileStorageKey())) {
            throw new BusinessException("文件存储key不能为空");
        }
        Date now = new Date();
        material.setStatus(isBlank(material.getStatus()) ? STATUS_VALID : material.getStatus());
        material.setCreatedAt(now);
        material.setUpdatedAt(now);
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_APPLY_MATERIAL " +
                "(material_id, site_id, material_name, material_desc, file_name, file_storage_key, status, " +
                "uploader_name, uploader_id, created_at, updated_at) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                material.getSiteId(),
                material.getMaterialName(),
                material.getMaterialDesc(),
                material.getFileName(),
                material.getFileStorageKey(),
                material.getStatus(),
                material.getUploaderName(),
                material.getUploaderId(),
                material.getCreatedAt(),
                material.getUpdatedAt());
        material.setMaterialId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL.CURRVAL FROM DUAL")));
        return material;
    }

    @Override
    public RecruitSiteApplyMaterial update(RecruitSiteApplyMaterial material) {
        if (material.getMaterialId() == null) {
            throw new BusinessException("材料ID不能为空");
        }
        RecruitSiteApplyMaterial old = findById(material.getMaterialId());
        if (old == null) {
            throw new BusinessException("申请材料不存在: " + material.getMaterialId());
        }
        if (material.getSiteId() == null) {
            material.setSiteId(old.getSiteId());
        }
        if (isBlank(material.getMaterialName())) {
            material.setMaterialName(old.getMaterialName());
        }
        if (isBlank(material.getFileStorageKey())) {
            material.setFileStorageKey(old.getFileStorageKey());
        }
        if (isBlank(material.getStatus())) {
            material.setStatus(old.getStatus());
        }
        material.setUpdatedAt(new Date());
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_APPLY_MATERIAL SET " +
                "site_id = ?, material_name = ?, material_desc = ?, file_name = ?, file_storage_key = ?, " +
                "status = ?, uploader_name = ?, uploader_id = ?, updated_at = ? WHERE material_id = ?",
                material.getSiteId(),
                material.getMaterialName(),
                material.getMaterialDesc(),
                material.getFileName(),
                material.getFileStorageKey(),
                material.getStatus(),
                material.getUploaderName(),
                material.getUploaderId(),
                material.getUpdatedAt(),
                material.getMaterialId());
        return material;
    }

    @Override
    public void delete(Long materialId) {
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_APPLY_MATERIAL WHERE material_id = ?", materialId);
    }

    @Override
    public RecruitSiteApplyMaterial findById(Long materialId) {
        RecruitSiteApplyMaterialEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_APPLY_MATERIAL WHERE material_id = ?",
                RecruitSiteApplyMaterialEntity.class, materialId);
        return toModel(entity);
    }

    @Override
    public List<RecruitSiteApplyMaterial> listBySiteId(Long siteId) {
        List<RecruitSiteApplyMaterialEntity> entities = DBUtils.query(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_APPLY_MATERIAL WHERE site_id = ? ORDER BY material_id DESC",
                RecruitSiteApplyMaterialEntity.class, siteId);
        return toModels(entities);
    }

    private List<RecruitSiteApplyMaterial> toModels(List<RecruitSiteApplyMaterialEntity> entities) {
        List<RecruitSiteApplyMaterial> models = new ArrayList<>();
        for (RecruitSiteApplyMaterialEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteApplyMaterial toModel(RecruitSiteApplyMaterialEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteApplyMaterial model = new RecruitSiteApplyMaterial();
        model.setMaterialId(entity.getMaterialId());
        model.setSiteId(entity.getSiteId());
        model.setMaterialName(entity.getMaterialName());
        model.setMaterialDesc(entity.getMaterialDesc());
        model.setFileName(entity.getFileName());
        model.setFileStorageKey(entity.getFileStorageKey());
        model.setStatus(entity.getStatus());
        model.setUploaderName(entity.getUploaderName());
        model.setUploaderId(entity.getUploaderId());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
