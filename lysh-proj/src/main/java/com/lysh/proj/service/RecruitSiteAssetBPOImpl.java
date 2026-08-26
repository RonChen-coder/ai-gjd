package com.lysh.proj.service;

import com.lysh.proj.common.BehaviorBizType;
import com.lysh.proj.entity.RecruitSiteAssetEntity;
import com.lysh.proj.model.RecruitCorpDetailData;
import com.lysh.proj.model.RecruitSiteAsset;
import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.model.RecruitSiteProject;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 高基地项目资产业务处理实现类。
 * 管理端维护项目资产清单，企业端维护资产表单；每次维护均生成行为日志。
 */
@Service
public class RecruitSiteAssetBPOImpl implements RecruitSiteAssetBPO {

    private static final String DISTRICT_CITY = "00";
    private static final String COLUMNS = "asset_id, project_id, site_id, tyshxym, district_code, asset_name, " +
            "quantity, unit, brand_model, storage_location, asset_status, usage_frequency, asset_photo, " +
            "created_by, created_at, updated_by, updated_at";

    private final RecruitSiteProjectBPO projectBPO;
    private final RecruitSiteInfoBPO siteInfoBPO;
    private final BehaviorLogRecorder behaviorLogRecorder;

    public RecruitSiteAssetBPOImpl(RecruitSiteProjectBPO projectBPO,
                                   RecruitSiteInfoBPO siteInfoBPO,
                                   BehaviorLogRecorder behaviorLogRecorder) {
        this.projectBPO = projectBPO;
        this.siteInfoBPO = siteInfoBPO;
        this.behaviorLogRecorder = behaviorLogRecorder;
    }

    @Override
    public RecruitSiteAsset createByAdmin(RecruitSiteAsset asset) {
        validateCreateParams(asset);
        RecruitSiteProject project = projectBPO.queryProjectById(asset.getProjectId());
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + asset.getProjectId());
        }
        checkAdminDistrict(project.getDistrictCode());
        RecruitSiteInfo siteInfo = siteInfoBPO.findById(project.getSiteId());
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + project.getSiteId());
        }
        Date now = new Date();
        String operatorName = currentAdminOperatorName();
        asset.setSiteId(project.getSiteId());
        asset.setTyshxym(siteInfo.getTyshxym());
        asset.setDistrictCode(project.getDistrictCode());
        // 使用频次由企业端维护，管理端新增时不写入
        asset.setUsageFrequency(null);
        asset.setCreatedBy(operatorName);
        asset.setCreatedAt(now);
        asset.setUpdatedBy(operatorName);
        asset.setUpdatedAt(now);
        insert(asset);
        behaviorLogRecorder.recordAssetChanges(asset.getAssetId(), null, asset,
                operatorName, ShrsContextUtils.getUserId(), "管理员", "新增");
        return asset;
    }

    @Override
    public RecruitSiteAsset updateByAdmin(RecruitSiteAsset asset) {
        if (asset.getAssetId() == null) {
            throw new BusinessException("资产ID不能为空");
        }
        RecruitSiteAsset old = queryAsset(asset.getAssetId());
        if (old == null) {
            throw new BusinessException("资产信息不存在: " + asset.getAssetId());
        }
        checkAdminDistrict(old.getDistrictCode());
        checkAssetProjectBinding(old, asset);
        mergeAssetFields(old, asset);
        // 使用频次由企业端维护，管理端修改时保留原值
        asset.setUsageFrequency(old.getUsageFrequency());
        String operatorName = currentAdminOperatorName();
        asset.setUpdatedBy(operatorName);
        asset.setUpdatedAt(new Date());
        behaviorLogRecorder.recordAssetChanges(asset.getAssetId(), old, asset,
                operatorName, ShrsContextUtils.getUserId(), "管理员", "修改");
        update(asset);
        return asset;
    }

    @Override
    public void deleteByAdmin(Long assetId) {
        RecruitSiteAsset old = queryAsset(assetId);
        if (old == null) {
            throw new BusinessException("资产信息不存在: " + assetId);
        }
        checkAdminDistrict(old.getDistrictCode());
        String operatorName = currentAdminOperatorName();
        behaviorLogRecorder.recordChange(BehaviorBizType.ASSET.getCode(), assetId, operatorName,
                ShrsContextUtils.getUserId(), "管理员", "删除", "资产名称", old.getAssetName(), null);
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_ASSET WHERE asset_id = ?", assetId);
    }

    @Override
    public RecruitSiteAsset createByCorp(RecruitSiteAsset asset) {
        validateCreateParams(asset);
        RecruitSiteProject project = projectBPO.queryProjectCorpById(asset.getProjectId());
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + asset.getProjectId());
        }
        RecruitSiteInfo siteInfo = findCorpSite();
        Date now = new Date();
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        asset.setSiteId(project.getSiteId());
        asset.setTyshxym(siteInfo.getTyshxym());
        asset.setDistrictCode(project.getDistrictCode());
        asset.setCreatedBy(operatorName);
        asset.setCreatedAt(now);
        asset.setUpdatedBy(operatorName);
        asset.setUpdatedAt(now);
        insert(asset);
        behaviorLogRecorder.recordAssetChanges(asset.getAssetId(), null, asset,
                operatorName, ShrsContextUtils.getOrganId(), "基地申报单位", "新增");
        return asset;
    }

    @Override
    public RecruitSiteAsset updateByCorp(RecruitSiteAsset asset) {
        if (asset.getAssetId() == null) {
            throw new BusinessException("资产ID不能为空");
        }
        RecruitSiteAsset old = queryAsset(asset.getAssetId());
        if (old == null) {
            throw new BusinessException("资产信息不存在: " + asset.getAssetId());
        }
        checkAssetOwner(old.getSiteId());
        checkAssetProjectBinding(old, asset);
        mergeAssetFields(old, asset);
        RecruitSiteInfo siteInfo = findCorpSite();
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        asset.setUpdatedBy(operatorName);
        asset.setUpdatedAt(new Date());
        behaviorLogRecorder.recordAssetChanges(asset.getAssetId(), old, asset,
                operatorName, ShrsContextUtils.getOrganId(), "基地申报单位", "修改");
        update(asset);
        return asset;
    }

    @Override
    public void deleteByCorp(Long assetId) {
        RecruitSiteAsset old = queryAsset(assetId);
        if (old == null) {
            throw new BusinessException("资产信息不存在: " + assetId);
        }
        checkAssetOwner(old.getSiteId());
        RecruitSiteInfo siteInfo = findCorpSite();
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        behaviorLogRecorder.recordChange(BehaviorBizType.ASSET.getCode(), assetId, operatorName,
                ShrsContextUtils.getOrganId(), "基地申报单位", "删除", "资产名称", old.getAssetName(), null);
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_ASSET WHERE asset_id = ?", assetId);
    }

    @Override
    public RecruitSiteAsset queryAssetById(Long assetId) {
        RecruitSiteAsset asset = queryAsset(assetId);
        if (asset != null) {
            checkAdminDistrict(asset.getDistrictCode());
        }
        return asset;
    }

    @Override
    public RecruitSiteAsset queryAssetCorpById(Long assetId) {
        RecruitSiteAsset asset = queryAsset(assetId);
        if (asset != null) {
            checkAssetOwner(asset.getSiteId());
        }
        return asset;
    }

    @Override
    public List<RecruitSiteAsset> queryAssetList(Long projectId) {
        RecruitSiteProject project = projectBPO.queryProjectById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkAdminDistrict(project.getDistrictCode());
        return queryAssetByProject(projectId);
    }

    @Override
    public List<RecruitSiteAsset> queryAssetCorpList(Long projectId) {
        RecruitSiteProject project = projectBPO.queryProjectCorpById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        return queryAssetByProject(projectId);
    }

    private void validateCreateParams(RecruitSiteAsset asset) {
        if (asset == null) {
            throw new BusinessException("资产信息不能为空");
        }
        if (asset.getProjectId() == null) {
            throw new BusinessException("项目ID不能为空");
        }
        if (isBlank(asset.getAssetName())) {
            throw new BusinessException("资产名称不能为空");
        }
    }

    private void checkAssetProjectBinding(RecruitSiteAsset old, RecruitSiteAsset asset) {
        if (asset.getProjectId() != null && !old.getProjectId().equals(asset.getProjectId())) {
            throw new BusinessException("资产创建后不能变更关联项目");
        }
        asset.setProjectId(old.getProjectId());
        asset.setSiteId(old.getSiteId());
        asset.setDistrictCode(old.getDistrictCode());
    }

    private void mergeAssetFields(RecruitSiteAsset old, RecruitSiteAsset asset) {
        if (isBlank(asset.getAssetName())) {
            asset.setAssetName(old.getAssetName());
        }
        if (asset.getQuantity() == null) {
            asset.setQuantity(old.getQuantity());
        }
        if (isBlank(asset.getUnit())) {
            asset.setUnit(old.getUnit());
        }
        if (isBlank(asset.getBrandModel())) {
            asset.setBrandModel(old.getBrandModel());
        }
        if (isBlank(asset.getStorageLocation())) {
            asset.setStorageLocation(old.getStorageLocation());
        }
        if (isBlank(asset.getAssetStatus())) {
            asset.setAssetStatus(old.getAssetStatus());
        }
        if (asset.getUsageFrequency() == null) {
            asset.setUsageFrequency(old.getUsageFrequency());
        }
        if (isBlank(asset.getAssetPhoto())) {
            asset.setAssetPhoto(old.getAssetPhoto());
        }
    }

    private void insert(RecruitSiteAsset asset) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_ASSET " +
                "(asset_id, project_id, site_id, tyshxym, district_code, asset_name, quantity, unit, brand_model, " +
                "storage_location, asset_status, usage_frequency, asset_photo, created_by, created_at, " +
                "updated_by, updated_at) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_ASSET.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                asset.getProjectId(),
                asset.getSiteId(),
                asset.getTyshxym(),
                asset.getDistrictCode(),
                asset.getAssetName(),
                asset.getQuantity(),
                asset.getUnit(),
                asset.getBrandModel(),
                asset.getStorageLocation(),
                asset.getAssetStatus(),
                asset.getUsageFrequency(),
                asset.getAssetPhoto(),
                asset.getCreatedBy(),
                asset.getCreatedAt(),
                asset.getUpdatedBy(),
                asset.getUpdatedAt());
        asset.setAssetId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_ASSET.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteAsset asset) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_ASSET SET " +
                "asset_name = ?, quantity = ?, unit = ?, brand_model = ?, storage_location = ?, " +
                "asset_status = ?, usage_frequency = ?, asset_photo = ?, updated_by = ?, updated_at = ? " +
                "WHERE asset_id = ?",
                asset.getAssetName(),
                asset.getQuantity(),
                asset.getUnit(),
                asset.getBrandModel(),
                asset.getStorageLocation(),
                asset.getAssetStatus(),
                asset.getUsageFrequency(),
                asset.getAssetPhoto(),
                asset.getUpdatedBy(),
                asset.getUpdatedAt(),
                asset.getAssetId());
    }

    private RecruitSiteAsset queryAsset(Long assetId) {
        RecruitSiteAssetEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET WHERE asset_id = ?",
                RecruitSiteAssetEntity.class, assetId);
        return toModel(entity);
    }

    private List<RecruitSiteAsset> queryAssetByProject(Long projectId) {
        List<RecruitSiteAssetEntity> entities = DBUtils.query(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET " +
                        "WHERE project_id = ? ORDER BY created_at DESC, asset_id DESC",
                RecruitSiteAssetEntity.class, projectId);
        return toModels(entities);
    }

    private List<RecruitSiteAsset> toModels(List<RecruitSiteAssetEntity> entities) {
        List<RecruitSiteAsset> models = new ArrayList<>();
        for (RecruitSiteAssetEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteAsset toModel(RecruitSiteAssetEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteAsset model = new RecruitSiteAsset();
        model.setAssetId(entity.getAssetId());
        model.setProjectId(entity.getProjectId());
        model.setSiteId(entity.getSiteId());
        model.setTyshxym(entity.getTyshxym());
        model.setDistrictCode(entity.getDistrictCode());
        model.setAssetName(entity.getAssetName());
        model.setQuantity(entity.getQuantity());
        model.setUnit(entity.getUnit());
        model.setBrandModel(entity.getBrandModel());
        model.setStorageLocation(entity.getStorageLocation());
        model.setAssetStatus(entity.getAssetStatus());
        model.setUsageFrequency(entity.getUsageFrequency());
        model.setAssetPhoto(entity.getAssetPhoto());
        model.setCreatedBy(entity.getCreatedBy());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedBy(entity.getUpdatedBy());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private RecruitSiteInfo findCorpSite() {
        String cid = ShrsContextUtils.getOrganId();
        if (isBlank(cid)) {
            throw new BusinessException("当前企业未登录");
        }
        QueryBuilder queryBuilder = new QueryBuilder("/admin/block/operate/getCorpDetail");
        queryBuilder.parseFilter("cid", cid);
        RecruitCorpDetailData corpDetail = queryBuilder.getResult(RecruitCorpDetailData.class);
        if (corpDetail == null || isBlank(corpDetail.getTyshxym())) {
            throw new BusinessException("未查询到当前企业信息");
        }
        RecruitSiteInfo siteInfo = siteInfoBPO.findByTyshxym(corpDetail.getTyshxym());
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + corpDetail.getTyshxym());
        }
        return siteInfo;
    }

    private void checkAssetOwner(Long siteId) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (!siteId.equals(siteInfo.getSiteId())) {
            throw new BusinessException("无权操作该基地的资产");
        }
    }

    private void checkAdminDistrict(String districtCode) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict)) {
            return;
        }
        if (isBlank(currentDistrict) || !currentDistrict.equals(districtCode)) {
            throw new BusinessException("数据越权");
        }
    }

    private String currentCorpOperatorName(String fallback) {
        String name = ShrsContextUtils.getOrganName();
        return isBlank(name) ? fallback : name;
    }

    private String currentAdminOperatorName() {
        String userId = ShrsContextUtils.getUserId();
        return isBlank(userId) ? "管理员" : userId;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
