package com.lysh.proj.service;

import com.lysh.proj.common.BehaviorBizType;
import com.lysh.proj.entity.RecruitSiteProjectEntity;
import com.lysh.proj.model.RecruitCorpDetailData;
import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.model.RecruitSiteProject;
import com.lysh.proj.model.RecruitSiteProjectQueryReq;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 高基地项目信息业务处理实现类。
 * 使用 DBUtils 完成项目增删改，使用 QueryBuilder 分页检索项目列表。
 */
@Service
public class RecruitSiteProjectBPOImpl implements RecruitSiteProjectBPO {

    private static final String STATUS_PENDING = "待审核";
    private static final String STATUS_PASSED = "已通过";
    private static final String STATUS_REJECTED = "已驳回";
    private static final String DISTRICT_CITY = "00";
    private static final String COLUMNS = "project_id, site_id, district_code, project_name, apply_direction, " +
            "apply_direction_project_name, project_location, implement_unit, project_intro, project_status, " +
            "approval_time, approval_amount, approval_grant_time, approval_grant_amount, " +
            "acceptance_time, acceptance_grant_time, acceptance_grant_amount, " +
            "performance_grant_time_1, performance_grant_amount_1, " +
            "performance_grant_time_2, performance_grant_amount_2, " +
            "performance_grant_time_3, performance_grant_amount_3, total_grant_amount, status, " +
            "reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at";

    private final RecruitSiteWhitelistBPO siteWhitelistBPO;
    private final RecruitSiteInfoBPO siteInfoBPO;
    private final BehaviorLogRecorder behaviorLogRecorder;

    public RecruitSiteProjectBPOImpl(RecruitSiteWhitelistBPO siteWhitelistBPO,
                                     RecruitSiteInfoBPO siteInfoBPO,
                                     BehaviorLogRecorder behaviorLogRecorder) {
        this.siteWhitelistBPO = siteWhitelistBPO;
        this.siteInfoBPO = siteInfoBPO;
        this.behaviorLogRecorder = behaviorLogRecorder;
    }

    @Override
    public RecruitSiteProject createByCorp(RecruitSiteProject project) {
        validateProject(project);
        RecruitSiteInfo siteInfo = findCorpSite();
        project.setSiteId(siteInfo.getSiteId());
        Date now = new Date();
        project.setDistrictCode(siteInfo.getDistrictCode());
        project.setStatus(STATUS_PENDING);
        project.setReviewer(null);
        project.setReviewTime(null);
        project.setReviewOpinion(null);
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        project.setCreatedBy(operatorName);
        project.setCreatedAt(now);
        project.setUpdatedBy(operatorName);
        project.setUpdatedAt(now);
        insert(project);
        behaviorLogRecorder.recordProjectChanges(project.getProjectId(), null, project,
                operatorName, ShrsContextUtils.getOrganId(), "基地申报单位", "新增");
        return project;
    }

    @Override
    public RecruitSiteProject createByAdmin(RecruitSiteProject project) {
        validateProject(project);
        if (project.getSiteId() == null) {
            throw new BusinessException("基地ID不能为空");
        }
        RecruitSiteInfo siteInfo = siteInfoBPO.findById(project.getSiteId());
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + project.getSiteId());
        }
        project.setDistrictCode(siteInfo.getDistrictCode());
        checkAdminDistrict(project.getDistrictCode());
        Date now = new Date();
        project.setStatus(STATUS_PASSED);
        project.setReviewer(null);
        project.setReviewTime(null);
        project.setReviewOpinion(null);
        String operatorName = currentAdminOperatorName();
        project.setCreatedBy(operatorName);
        project.setCreatedAt(now);
        project.setUpdatedBy(operatorName);
        project.setUpdatedAt(now);
        insert(project);
        behaviorLogRecorder.recordProjectChanges(project.getProjectId(), null, project,
                operatorName, ShrsContextUtils.getUserId(), "管理员", "新增");
        return project;
    }

    @Override
    public RecruitSiteProject updateByCorp(RecruitSiteProject project) {
        if (project.getProjectId() == null) {
            throw new BusinessException("项目ID不能为空");
        }
        RecruitSiteProject old = findById(project.getProjectId());
        if (old == null) {
            throw new BusinessException("项目信息不存在: " + project.getProjectId());
        }
        checkProjectOwner(old.getSiteId());
        if (project.getSiteId() != null && !old.getSiteId().equals(project.getSiteId())) {
            throw new BusinessException("项目创建后不能变更关联基地");
        }
        project.setSiteId(old.getSiteId());
        mergeProjectFields(old, project);
        RecruitSiteInfo siteInfo = findCorpSite();
        project.setDistrictCode(siteInfo.getDistrictCode());
        project.setStatus(STATUS_PENDING);
        project.setReviewer(null);
        project.setReviewTime(null);
        project.setReviewOpinion(null);
        String operatorName = currentCorpOperatorName(siteInfo.getCompanyName());
        project.setUpdatedBy(operatorName);
        project.setUpdatedAt(new Date());
        behaviorLogRecorder.recordProjectChanges(project.getProjectId(), old, project,
                operatorName, ShrsContextUtils.getOrganId(), "基地申报单位", "修改");
        update(project);
        return project;
    }

    @Override
    public RecruitSiteProject updateByAdmin(RecruitSiteProject project) {
        if (project.getProjectId() == null) {
            throw new BusinessException("项目ID不能为空");
        }
        RecruitSiteProject old = findById(project.getProjectId());
        if (old == null) {
            throw new BusinessException("项目信息不存在: " + project.getProjectId());
        }
        if (project.getSiteId() != null && !old.getSiteId().equals(project.getSiteId())) {
            throw new BusinessException("项目创建后不能变更关联基地");
        }
        project.setSiteId(old.getSiteId());
        mergeProjectFields(old, project);
        RecruitSiteInfo siteInfo = siteInfoBPO.findById(old.getSiteId());
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + old.getSiteId());
        }
        project.setDistrictCode(siteInfo.getDistrictCode());
        checkAdminDistrict(project.getDistrictCode());
        project.setStatus(STATUS_PASSED);
        String operatorName = currentAdminOperatorName();
        project.setUpdatedBy(operatorName);
        project.setUpdatedAt(new Date());
        behaviorLogRecorder.recordProjectChanges(project.getProjectId(), old, project,
                operatorName, ShrsContextUtils.getUserId(), "管理员", "修改");
        update(project);
        return project;
    }

    @Override
    public void deleteByCorp(Long projectId) {
        RecruitSiteProject old = findById(projectId);
        if (old == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkProjectOwner(old.getSiteId());
        String operatorName = currentCorpOperatorName("单位用户");
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), projectId, operatorName,
                ShrsContextUtils.getOrganId(), "基地申报单位", "删除", "项目名称", old.getProjectName(), null);
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_PROJECT WHERE project_id = ?", projectId);
    }

    @Override
    public void delete(Long projectId) {
        RecruitSiteProject old = findById(projectId);
        if (old == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkAdminDistrict(old.getDistrictCode());
        String operatorName = currentAdminOperatorName();
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), projectId, operatorName,
                ShrsContextUtils.getUserId(), "管理员", "删除", "项目名称", old.getProjectName(), null);
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_PROJECT WHERE project_id = ?", projectId);
    }

    @Override
    public RecruitSiteProject findById(Long projectId) {
        RecruitSiteProjectEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT WHERE project_id = ?",
                RecruitSiteProjectEntity.class, projectId);
        return toModel(entity);
    }

    @Override
    public RecruitSiteProject findCorpById(Long projectId) {
        RecruitSiteProject project = findById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkProjectOwner(project.getSiteId());
        return project;
    }

    @Override
    public PageResult<RecruitSiteProject> queryList(RecruitSiteProjectQueryReq req) {
        if (req == null) {
            req = new RecruitSiteProjectQueryReq();
        }
        applyAdminDistrict(req);
        return doQueryList(req);
    }

    @Override
    public PageResult<RecruitSiteProject> queryCorpList(RecruitSiteProjectQueryReq req) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (req == null) {
            req = new RecruitSiteProjectQueryReq();
        }
        req.setTyshxym(siteInfo.getTyshxym());
        return doQueryList(req);
    }

    @Override
    public RecruitSiteProject review(Long projectId, String reviewOpinion, String status) {
        if (!STATUS_PASSED.equals(status) && !STATUS_REJECTED.equals(status)) {
            throw new BusinessException("审核状态只能为已通过或已驳回");
        }
        RecruitSiteProject project = findById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkAdminDistrict(project.getDistrictCode());
        String oldStatus = project.getStatus();
        String oldReviewer = project.getReviewer();
        String oldReviewOpinion = project.getReviewOpinion();
        String reviewer = currentAdminOperatorName();
        project.setReviewer(reviewer);
        project.setReviewOpinion(reviewOpinion);
        project.setStatus(status);
        project.setReviewTime(new Date());
        project.setUpdatedAt(new Date());
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), projectId, reviewer,
                ShrsContextUtils.getUserId(), "区级管理员", "审核", "状态", oldStatus, project.getStatus());
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), projectId, reviewer,
                ShrsContextUtils.getUserId(), "区级管理员", "审核", "审核人", oldReviewer, reviewer);
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), projectId, reviewer,
                ShrsContextUtils.getUserId(), "区级管理员", "审核", "审核意见", oldReviewOpinion, reviewOpinion);
        update(project);
        return project;
    }

    private PageResult<RecruitSiteProject> doQueryList(RecruitSiteProjectQueryReq req) {
        PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteProjectList");
        queryBuilder.parseFilter("siteId", req.getSiteId());
        queryBuilder.parseFilter("tyshxym", req.getTyshxym());
        queryBuilder.parseFilter("districtCode", req.getDistrictCode());
        queryBuilder.parseFilter("projectName", req.getProjectName());
        queryBuilder.parseFilter("applyDirection", req.getApplyDirection());
        queryBuilder.parseFilter("projectStatus", req.getProjectStatus());
        queryBuilder.parseFilter("status", req.getStatus());
        queryBuilder.parseFilter("keyword", req.getKeyword());
        return queryBuilder.getPage(pageParam, RecruitSiteProject.class);
    }

    private void validateProject(RecruitSiteProject project) {
        if (isBlank(project.getProjectName())) {
            throw new BusinessException("项目名称不能为空");
        }
        if (isBlank(project.getApplyDirection())) {
            throw new BusinessException("项目申报方向不能为空");
        }
        if (isBlank(project.getProjectStatus())) {
            throw new BusinessException("项目状态不能为空");
        }
    }

    private void checkCorpPermission(String tyshxym) {
        if (isBlank(tyshxym)) {
            throw new BusinessException("企业统一社会信用代码不能为空");
        }
        if (!siteWhitelistBPO.existsByTyshxym(tyshxym)) {
            throw new BusinessException("非白名单单位，不能操作高基地项目信息");
        }
    }

    private RecruitSiteInfo findCorpSite(String tyshxym) {
        checkCorpPermission(tyshxym);
        RecruitSiteInfo siteInfo = siteInfoBPO.findByTyshxym(tyshxym);
        if (siteInfo == null) {
            throw new BusinessException("高基地信息不存在: " + tyshxym);
        }
        return siteInfo;
    }

    private RecruitSiteInfo findCorpSite() {
        // 从当前登录企业ID反查企业档案，获取统一社会信用代码后再定位本单位高基地
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
        return findCorpSite(corpDetail.getTyshxym());
    }

    private void checkProjectOwner(Long siteId) {
        RecruitSiteInfo siteInfo = findCorpSite();
        if (!siteId.equals(siteInfo.getSiteId())) {
            throw new BusinessException("无权操作该基地的项目");
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

    private void applyAdminDistrict(RecruitSiteProjectQueryReq req) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict) || isBlank(currentDistrict)) {
            return;
        }
        if (!isBlank(req.getDistrictCode()) && !currentDistrict.equals(req.getDistrictCode())) {
            throw new BusinessException("数据越权");
        }
        req.setDistrictCode(currentDistrict);
    }

    private void mergeProjectFields(RecruitSiteProject old, RecruitSiteProject project) {
        if (isBlank(project.getProjectName())) {
            project.setProjectName(old.getProjectName());
        }
        if (isBlank(project.getApplyDirection())) {
            project.setApplyDirection(old.getApplyDirection());
        }
        if (isBlank(project.getApplyDirectionProjectName())) {
            project.setApplyDirectionProjectName(old.getApplyDirectionProjectName());
        }
        if (isBlank(project.getProjectLocation())) {
            project.setProjectLocation(old.getProjectLocation());
        }
        if (isBlank(project.getImplementUnit())) {
            project.setImplementUnit(old.getImplementUnit());
        }
        if (isBlank(project.getProjectIntro())) {
            project.setProjectIntro(old.getProjectIntro());
        }
        if (isBlank(project.getProjectStatus())) {
            project.setProjectStatus(old.getProjectStatus());
        }
        if (project.getApprovalTime() == null) {
            project.setApprovalTime(old.getApprovalTime());
        }
        if (project.getApprovalAmount() == null) {
            project.setApprovalAmount(old.getApprovalAmount());
        }
        if (project.getApprovalGrantTime() == null) {
            project.setApprovalGrantTime(old.getApprovalGrantTime());
        }
        if (project.getApprovalGrantAmount() == null) {
            project.setApprovalGrantAmount(old.getApprovalGrantAmount());
        }
        if (project.getAcceptanceTime() == null) {
            project.setAcceptanceTime(old.getAcceptanceTime());
        }
        if (project.getAcceptanceGrantTime() == null) {
            project.setAcceptanceGrantTime(old.getAcceptanceGrantTime());
        }
        if (project.getAcceptanceGrantAmount() == null) {
            project.setAcceptanceGrantAmount(old.getAcceptanceGrantAmount());
        }
        if (project.getPerformanceGrantTime1() == null) {
            project.setPerformanceGrantTime1(old.getPerformanceGrantTime1());
        }
        if (project.getPerformanceGrantAmount1() == null) {
            project.setPerformanceGrantAmount1(old.getPerformanceGrantAmount1());
        }
        if (project.getPerformanceGrantTime2() == null) {
            project.setPerformanceGrantTime2(old.getPerformanceGrantTime2());
        }
        if (project.getPerformanceGrantAmount2() == null) {
            project.setPerformanceGrantAmount2(old.getPerformanceGrantAmount2());
        }
        if (project.getPerformanceGrantTime3() == null) {
            project.setPerformanceGrantTime3(old.getPerformanceGrantTime3());
        }
        if (project.getPerformanceGrantAmount3() == null) {
            project.setPerformanceGrantAmount3(old.getPerformanceGrantAmount3());
        }
        if (project.getTotalGrantAmount() == null) {
            project.setTotalGrantAmount(old.getTotalGrantAmount());
        }
    }

    private void insert(RecruitSiteProject project) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_PROJECT " +
                "(project_id, site_id, district_code, project_name, apply_direction, apply_direction_project_name, " +
                "project_location, implement_unit, project_intro, project_status, " +
                "approval_time, approval_amount, approval_grant_time, approval_grant_amount, " +
                "acceptance_time, acceptance_grant_time, acceptance_grant_amount, " +
                "performance_grant_time_1, performance_grant_amount_1, " +
                "performance_grant_time_2, performance_grant_amount_2, " +
                "performance_grant_time_3, performance_grant_amount_3, total_grant_amount, " +
                "status, reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                project.getSiteId(),
                project.getDistrictCode(),
                project.getProjectName(),
                project.getApplyDirection(),
                project.getApplyDirectionProjectName(),
                project.getProjectLocation(),
                project.getImplementUnit(),
                project.getProjectIntro(),
                project.getProjectStatus(),
                project.getApprovalTime(),
                project.getApprovalAmount(),
                project.getApprovalGrantTime(),
                project.getApprovalGrantAmount(),
                project.getAcceptanceTime(),
                project.getAcceptanceGrantTime(),
                project.getAcceptanceGrantAmount(),
                project.getPerformanceGrantTime1(),
                project.getPerformanceGrantAmount1(),
                project.getPerformanceGrantTime2(),
                project.getPerformanceGrantAmount2(),
                project.getPerformanceGrantTime3(),
                project.getPerformanceGrantAmount3(),
                project.getTotalGrantAmount(),
                project.getStatus(),
                project.getReviewer(),
                project.getReviewTime(),
                project.getReviewOpinion(),
                project.getCreatedBy(),
                project.getCreatedAt(),
                project.getUpdatedBy(),
                project.getUpdatedAt());
        project.setProjectId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteProject project) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_PROJECT SET " +
                "site_id = ?, district_code = ?, project_name = ?, apply_direction = ?, apply_direction_project_name = ?, " +
                "project_location = ?, implement_unit = ?, project_intro = ?, project_status = ?, " +
                "approval_time = ?, approval_amount = ?, approval_grant_time = ?, approval_grant_amount = ?, " +
                "acceptance_time = ?, acceptance_grant_time = ?, acceptance_grant_amount = ?, " +
                "performance_grant_time_1 = ?, performance_grant_amount_1 = ?, " +
                "performance_grant_time_2 = ?, performance_grant_amount_2 = ?, " +
                "performance_grant_time_3 = ?, performance_grant_amount_3 = ?, total_grant_amount = ?, " +
                "status = ?, reviewer = ?, review_time = ?, review_opinion = ?, updated_by = ?, updated_at = ? " +
                "WHERE project_id = ?",
                project.getSiteId(),
                project.getDistrictCode(),
                project.getProjectName(),
                project.getApplyDirection(),
                project.getApplyDirectionProjectName(),
                project.getProjectLocation(),
                project.getImplementUnit(),
                project.getProjectIntro(),
                project.getProjectStatus(),
                project.getApprovalTime(),
                project.getApprovalAmount(),
                project.getApprovalGrantTime(),
                project.getApprovalGrantAmount(),
                project.getAcceptanceTime(),
                project.getAcceptanceGrantTime(),
                project.getAcceptanceGrantAmount(),
                project.getPerformanceGrantTime1(),
                project.getPerformanceGrantAmount1(),
                project.getPerformanceGrantTime2(),
                project.getPerformanceGrantAmount2(),
                project.getPerformanceGrantTime3(),
                project.getPerformanceGrantAmount3(),
                project.getTotalGrantAmount(),
                project.getStatus(),
                project.getReviewer(),
                project.getReviewTime(),
                project.getReviewOpinion(),
                project.getUpdatedBy(),
                project.getUpdatedAt(),
                project.getProjectId());
    }

    private List<RecruitSiteProject> toModels(List<RecruitSiteProjectEntity> entities) {
        List<RecruitSiteProject> models = new ArrayList<>();
        for (RecruitSiteProjectEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteProject toModel(RecruitSiteProjectEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteProject model = new RecruitSiteProject();
        model.setProjectId(entity.getProjectId());
        model.setSiteId(entity.getSiteId());
        model.setDistrictCode(entity.getDistrictCode());
        model.setProjectName(entity.getProjectName());
        model.setApplyDirection(entity.getApplyDirection());
        model.setApplyDirectionProjectName(entity.getApplyDirectionProjectName());
        model.setProjectLocation(entity.getProjectLocation());
        model.setImplementUnit(entity.getImplementUnit());
        model.setProjectIntro(entity.getProjectIntro());
        model.setProjectStatus(entity.getProjectStatus());
        model.setApprovalTime(entity.getApprovalTime());
        model.setApprovalAmount(entity.getApprovalAmount());
        model.setApprovalGrantTime(entity.getApprovalGrantTime());
        model.setApprovalGrantAmount(entity.getApprovalGrantAmount());
        model.setAcceptanceTime(entity.getAcceptanceTime());
        model.setAcceptanceGrantTime(entity.getAcceptanceGrantTime());
        model.setAcceptanceGrantAmount(entity.getAcceptanceGrantAmount());
        model.setPerformanceGrantTime1(entity.getPerformanceGrantTime1());
        model.setPerformanceGrantAmount1(entity.getPerformanceGrantAmount1());
        model.setPerformanceGrantTime2(entity.getPerformanceGrantTime2());
        model.setPerformanceGrantAmount2(entity.getPerformanceGrantAmount2());
        model.setPerformanceGrantTime3(entity.getPerformanceGrantTime3());
        model.setPerformanceGrantAmount3(entity.getPerformanceGrantAmount3());
        model.setTotalGrantAmount(entity.getTotalGrantAmount());
        model.setStatus(entity.getStatus());
        model.setReviewer(entity.getReviewer());
        model.setReviewTime(entity.getReviewTime());
        model.setReviewOpinion(entity.getReviewOpinion());
        model.setCreatedBy(entity.getCreatedBy());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedBy(entity.getUpdatedBy());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
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
