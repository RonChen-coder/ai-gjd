package com.wondersgroup.shrs.corp.gjd.bpo.impl;


import com.wondersgroup.shrs.admin.block.model.QueryRecruitCorpInfoListData;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.shrs.corp.corpinfo.model.CorporationData;
import com.wondersgroup.shrs.corp.gjd.bpo.RecruitSiteInfoBPO;
import com.wondersgroup.shrs.corp.gjd.bpo.RecruitSiteWhitelistBPO;
import com.wondersgroup.shrs.corp.gjd.entity.RecruitSiteInfoEntity;
import com.wondersgroup.shrs.corp.gjd.model.BehaviorBizType;
import com.wondersgroup.shrs.corp.gjd.model.RecruitSiteInfo;
import com.wondersgroup.shrs.corp.gjd.model.RecruitSiteInfoQueryReq;
import com.wondersgroup.shrs.corp.gjd.model.RecruitSiteWhitelist;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.StringUtils;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 高基地信息业务处理实现类。
 * 使用内部框架 DBUtils 实现白名单校验、单位提交、市区免审修改和区级审核。
 */
@Service
public class RecruitSiteInfoBPOImpl implements RecruitSiteInfoBPO {

    private static final String STATUS_PENDING = "0";
    private static final String STATUS_PASSED = "1";
    private static final String STATUS_REJECTED = "2";
    private static final String STATUS_UNARCHIVED = "0";
    private static final String COLUMNS = "site_id, tyshxym, company_name, site_name, listing_year, site_category, " +
            "industry_category, district_code, superior_department, site_address, site_intro, status, " +
            "reviewer, review_time, review_opinion, archive_status, created_by, created_at, updated_by, updated_at";

    @Autowired
    private RecruitSiteWhitelistBPO siteWhitelistBPO;
    @Autowired
    private  BehaviorLogRecorder behaviorLogRecorder;



    @Override
    public RecruitSiteInfo createByCorp(RecruitSiteInfo siteInfo) {
        checkCorpPermission(siteInfo.getTyshxym());
        if (findByTyshxym(siteInfo.getTyshxym()) != null) {
            throw new BusinessException("该单位已存在高基地信息: " + siteInfo.getTyshxym());
        }
        fillCorpInfo(siteInfo);
        if (isBlank(siteInfo.getDistrictCode())) {
            throw new BusinessException("属地区编码不能为空");
        }
        siteInfo.setStatus(STATUS_PENDING);
     //   siteInfo.setArchiveStatus(STATUS_UNARCHIVED);
        siteInfo.setDistrictCode("00");
        siteInfo.setCreatedBy("企业自主创建");
        siteInfo.setCreatedAt(new Date());
        siteInfo.setUpdatedAt(new Date());
        insert(siteInfo);
        return siteInfo;
    }

    @Override
    public RecruitSiteInfo createByAdmin(RecruitSiteInfo siteInfo) {
        if (isBlank(siteInfo.getTyshxym())) {
            throw new BusinessException("企业统一社会信用代码不能为空");
        }
        if (isBlank(siteInfo.getSiteName())) {
            throw new BusinessException("基地名称不能为空");
        }
        if (findByTyshxym(siteInfo.getTyshxym()) != null) {
            throw new BusinessException("该单位已存在高基地信息: " + siteInfo.getTyshxym());
        }
        if (isBlank(siteInfo.getCompanyName())) {
            RecruitSiteWhitelist whitelist = siteWhitelistBPO.findByTyshxym(siteInfo.getTyshxym());
            if (whitelist != null) {
                siteInfo.setCompanyName(whitelist.getCompanyName());
            }
        }
        if (isBlank(siteInfo.getCompanyName())) {
            throw new BusinessException("单位名称不能为空");
        }
        if (isBlank(siteInfo.getDistrictCode())) {
            throw new BusinessException("属地区编码不能为空");
        }
        siteInfo.setStatus(STATUS_PASSED);
   //     siteInfo.setArchiveStatus(STATUS_UNARCHIVED);
        Date now = new Date();
        if (siteInfo.getCreatedAt() == null) {
            siteInfo.setCreatedAt(now);
        }

        if (StringUtils.equals("00",ShrsContextUtils.getDistrictCode())){
            siteInfo.setDistrictCode(siteInfo.getDistrictCode());
        }else {
            siteInfo.setDistrictCode(ShrsContextUtils.getDistrictCode());
        }

        siteInfo.setUpdatedAt(now);
        siteInfo.setCreatedBy(ShrsContextUtils.getUserId());
        siteInfo.setCreatedAt(now);
        insert(siteInfo);
        return siteInfo;
    }

    @Override
    public RecruitSiteInfo updateByCorp(RecruitSiteInfo siteInfo) {
        if (siteInfo.getSiteId() == null) {
            throw new BusinessException("基地ID不能为空");
        }
        checkCorpPermission(siteInfo.getTyshxym());
        RecruitSiteInfo old = findById(siteInfo.getSiteId());
        if (old == null) {
            throw new BusinessException("高基地信息不存在: " + siteInfo.getSiteId());
        }
        if (!old.getTyshxym().equals(siteInfo.getTyshxym())) {
            throw new BusinessException("只能修改本单位的高基地信息");
        }
        siteInfo.setTyshxym(old.getTyshxym());
        fillCorpInfo(siteInfo);
        if (isBlank(siteInfo.getDistrictCode())) {
            siteInfo.setDistrictCode(old.getDistrictCode());
        }
        siteInfo.setStatus(STATUS_PENDING);
        siteInfo.setReviewer(null);
        siteInfo.setReviewTime(null);
        siteInfo.setReviewOpinion(null);
        siteInfo.setUpdatedAt(new Date());
        behaviorLogRecorder.recordSiteInfoChanges(siteInfo.getSiteId(), old, siteInfo,
                isBlank(siteInfo.getUpdatedBy()) ? siteInfo.getCompanyName() : siteInfo.getUpdatedBy(),
                siteInfo.getTyshxym(), "基地申报单位", "修改");
        update(siteInfo);
        return siteInfo;
    }

    @Override
    public RecruitSiteInfo updateByAdmin(RecruitSiteInfo siteInfo) {
        if (siteInfo.getSiteId() == null) {
            throw new BusinessException("基地ID不能为空");
        }
        RecruitSiteInfo old = findById(siteInfo.getSiteId());
        if (old == null) {
            throw new BusinessException("高基地信息不存在: " + siteInfo.getSiteId());
        }
        if (isBlank(siteInfo.getTyshxym())) {
            siteInfo.setTyshxym(old.getTyshxym());
        }
        if (isBlank(siteInfo.getCompanyName())) {
            siteInfo.setCompanyName(old.getCompanyName());
        }
        if (isBlank(siteInfo.getDistrictCode())) {
            siteInfo.setDistrictCode(old.getDistrictCode());
        }
        siteInfo.setStatus(STATUS_PASSED);
        siteInfo.setUpdatedAt(new Date());
        behaviorLogRecorder.recordSiteInfoChanges(siteInfo.getSiteId(), old, siteInfo,
                isBlank(siteInfo.getUpdatedBy()) ? "管理员" : siteInfo.getUpdatedBy(), null, "管理员", "修改");
        update(siteInfo);
        return siteInfo;
    }

    @Override
    public void delete(Long siteId) {
        RecruitSiteInfo siteInfo = this.findById(siteId);

        if (!StringUtils.equals("00", ShrsContextUtils.getDistrictCode())
        && !StringUtils.equals(ShrsContextUtils.getDistrictCode(),siteInfo.getDistrictCode())) {

                throw new BusinessException("数据越权");
        }
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_INFO WHERE site_id = ?", siteId);
    }

    @Override
    public RecruitSiteInfo findById(Long siteId) {
        RecruitSiteInfoEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO WHERE site_id = ?",
                RecruitSiteInfoEntity.class, siteId);
        return toModel(entity);
    }

    @Override
    public RecruitSiteInfo findByTyshxym(String tyshxym) {
        RecruitSiteInfoEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO WHERE tyshxym = ?",
                RecruitSiteInfoEntity.class, tyshxym);
        return toModel(entity);
    }

    @Override
    public RecruitSiteInfo findByCid(String cid) {

        QueryBuilder queryBuilder = new QueryBuilder("/admin/block/operate/getCorpDetail");
        queryBuilder.parseFilter("cid", cid);
        QueryRecruitCorpInfoListData cResult = queryBuilder.getResult(QueryRecruitCorpInfoListData.class);

        if (Objects.isNull(cResult)){
            throw new BusinessException("外网库未找到对应企业");
        }
        return this.findByTyshxym(cResult.getTyshxym());
    }

    @Override
    public PageResult<RecruitSiteInfo> listAll(RecruitSiteInfoQueryReq req) {
//        List<RecruitSiteInfoEntity> entities = DBUtils.query(
//                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO ORDER BY site_id DESC",
//                RecruitSiteInfoEntity.class);

        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteInfoList");

        queryBuilder.parseFilter("tyshxym", req.getTyshxym());
        queryBuilder.parseFilter("siteName", req.getSiteName());
        queryBuilder.parseFilter("siteCategory", req.getSiteCategory());
        queryBuilder.parseFilter("industryCategory",req.getIndustryCategory());
        queryBuilder.parseFilter("districtCode", req.getDistrictCode());
        queryBuilder.parseFilter("listingYear", req.getListingYear());
        queryBuilder.parseFilter("status", req.getStatus());

        return queryBuilder.getPage(Objects.nonNull(req.getPageParam())?
                req.getPageParam() : new PageParam(), RecruitSiteInfo.class);
    }



    @Override
    public RecruitSiteInfo saveReview(Long siteId, String reviewer, String reviewOpinion, String status) {
        if (!STATUS_PASSED.equals(status) && !STATUS_REJECTED.equals(status)) {
            throw new BusinessException("审核状态只能为已通过或已驳回");
        }
        RecruitSiteInfo siteInfo = findById(siteId);
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + siteId);
        }
        String oldStatus = siteInfo.getStatus();
        String oldReviewer = siteInfo.getReviewer();
        String oldReviewOpinion = siteInfo.getReviewOpinion();
        siteInfo.setReviewer(ShrsContextUtils.getUserId());
        siteInfo.setReviewOpinion(reviewOpinion);
        siteInfo.setStatus(status);
        siteInfo.setReviewTime(new Date());
        siteInfo.setUpdatedAt(new Date());
        behaviorLogRecorder.recordChange(BehaviorBizType.BASE.getCode(), siteId, reviewer, null,
                "区级管理员", "审核", "状态", oldStatus, siteInfo.getStatus());
        behaviorLogRecorder.recordChange(BehaviorBizType.BASE.getCode(), siteId, reviewer, null,
                "区级管理员", "审核", "审核人", oldReviewer, reviewer);
        behaviorLogRecorder.recordChange(BehaviorBizType.BASE.getCode(), siteId, reviewer, null,
                "区级管理员", "审核", "审核意见", oldReviewOpinion, reviewOpinion);
        update(siteInfo);
        return siteInfo;
    }

    private void checkCorpPermission(String tyshxym) {
        CorporationData corporationData = DBUtils.get("/corp/keyPointCorpInfo/queryCorporationByTyshxym",CorporationData.class,tyshxym);
        if (Objects.isNull(corporationData) || !StringUtils.equals(ShrsContextUtils.getOrganId(), corporationData.getCid())){
            throw new BusinessException("统一社会信用码越权");
        }

        if (isBlank(tyshxym)) {
            throw new BusinessException("企业统一社会信用代码不能为空");
        }
        if (!siteWhitelistBPO.existsByTyshxym(tyshxym)) {
            throw new BusinessException("非白名单单位，不能操作高基地信息");
        }
    }

    private void fillCorpInfo(RecruitSiteInfo siteInfo) {
        if (isBlank(siteInfo.getCompanyName())) {
            siteInfo.setCompanyName(siteWhitelistBPO.findByTyshxym(siteInfo.getTyshxym()).getCompanyName());
        }
        Date now = new Date();
        if (siteInfo.getCreatedAt() == null) {
            siteInfo.setCreatedAt(now);
        }
        if (siteInfo.getUpdatedAt() == null) {
            siteInfo.setUpdatedAt(now);
        }
    }

    private void insert(RecruitSiteInfo siteInfo) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_INFO " +
                "(site_id, tyshxym, company_name, site_name, listing_year, site_category, industry_category, " +
                "district_code, superior_department, site_address, site_intro, status, " +
                "reviewer, review_time, review_opinion, archive_status, created_by, created_at, updated_by, updated_at) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                siteInfo.getTyshxym(),
                siteInfo.getCompanyName(),
                siteInfo.getSiteName(),
                siteInfo.getListingYear(),
                siteInfo.getSiteCategory(),
                siteInfo.getIndustryCategory(),
                siteInfo.getDistrictCode(),
                siteInfo.getSuperiorDepartment(),
                siteInfo.getSiteAddress(),
                siteInfo.getSiteIntro(),
                siteInfo.getStatus(),
                siteInfo.getReviewer(),
                siteInfo.getReviewTime(),
                siteInfo.getReviewOpinion(),
                "0",
                siteInfo.getCreatedBy(),
                siteInfo.getCreatedAt(),
                siteInfo.getUpdatedBy(),
                siteInfo.getUpdatedAt());
        siteInfo.setSiteId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_INFO.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteInfo siteInfo) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_INFO SET " +
                "tyshxym = ?, company_name = ?, site_name = ?, listing_year = ?, site_category = ?, " +
                "industry_category = ?, district_code = ?, superior_department = ?, " +
                "site_address = ?, site_intro = ?, status = ?, reviewer = ?, review_time = ?, " +
                "review_opinion = ?, updated_by = ?, updated_at = ? WHERE site_id = ?",
                siteInfo.getTyshxym(),
                siteInfo.getCompanyName(),
                siteInfo.getSiteName(),
                siteInfo.getListingYear(),
                siteInfo.getSiteCategory(),
                siteInfo.getIndustryCategory(),
                siteInfo.getDistrictCode(),
                siteInfo.getSuperiorDepartment(),
                siteInfo.getSiteAddress(),
                siteInfo.getSiteIntro(),
                siteInfo.getStatus(),
                siteInfo.getReviewer(),
                siteInfo.getReviewTime(),
                siteInfo.getReviewOpinion(),
                siteInfo.getUpdatedBy(),
                siteInfo.getUpdatedAt(),
                siteInfo.getSiteId());
    }

    private List<RecruitSiteInfo> toModels(List<RecruitSiteInfoEntity> entities) {
        List<RecruitSiteInfo> models = new ArrayList<>();
        for (RecruitSiteInfoEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteInfo toModel(RecruitSiteInfoEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteInfo model = new RecruitSiteInfo();
        model.setSiteId(entity.getSiteId());
        model.setTyshxym(entity.getTyshxym());
        model.setCompanyName(entity.getCompanyName());
        model.setSiteName(entity.getSiteName());
        model.setListingYear(entity.getListingYear());
        model.setSiteCategory(entity.getSiteCategory());
        model.setIndustryCategory(entity.getIndustryCategory());
        model.setDistrictCode(entity.getDistrictCode());
        model.setSuperiorDepartment(entity.getSuperiorDepartment());
        model.setSiteAddress(entity.getSiteAddress());
        model.setSiteIntro(entity.getSiteIntro());
        model.setStatus(entity.getStatus());
        model.setReviewer(entity.getReviewer());
        model.setReviewTime(entity.getReviewTime());
        model.setReviewOpinion(entity.getReviewOpinion());
        model.setArchiveStatus(entity.getArchiveStatus());
        model.setCreatedBy(entity.getCreatedBy());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedBy(entity.getUpdatedBy());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private boolean isBlank(String value) {
       return StringUtils.isEmpty(value);
    }
}
