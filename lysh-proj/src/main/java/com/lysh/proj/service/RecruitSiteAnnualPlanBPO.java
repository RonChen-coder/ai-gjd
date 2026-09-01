package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteAnnualPlan;
import com.lysh.proj.model.RecruitSiteAnnualPlanQueryReq;
import com.lysh.proj.model.RecruitGJDFileModel;
import com.wondersgroup.wdls.data.commons.PageResult;

/**
 * 高基地年报计划业务处理接口。
 * 企业端填报年报计划并提交审核，区管理员审核为通过或待整改。
 */
public interface RecruitSiteAnnualPlanBPO {

    /**
     * 企业端新增或修改年报计划，提交后进入待审核。
     *
     * @param plan 年报计划对象
     * @return 保存后的年报计划
     */
    RecruitSiteAnnualPlan saveByCorp(RecruitSiteAnnualPlan plan);

    /**
     * 企业端分页查询本单位年报计划。
     *
     * @param req 查询条件
     * @return 年报计划分页结果
     */
    PageResult<RecruitSiteAnnualPlan> queryCorpList(RecruitSiteAnnualPlanQueryReq req);

    /**
     * 企业端查询本单位年报计划详情。
     *
     * @param planId 年报计划ID
     * @return 年报计划
     */
    RecruitSiteAnnualPlan findCorpById(Long planId);

    /**
     * 管理端分页查询年报计划。
     *
     * @param req 查询条件
     * @return 年报计划分页结果
     */
    PageResult<RecruitSiteAnnualPlan> queryAdminList(RecruitSiteAnnualPlanQueryReq req);

    /**
     * 管理端查询年报计划详情。
     *
     * @param planId 年报计划ID
     * @return 年报计划
     */
    RecruitSiteAnnualPlan findAdminById(Long planId);

    /**
     * 区管理员审核年报计划。
     *
     * @param planId 年报计划ID
     * @param status 审核结果，审核通过/待整改
     * @param reviewOpinion 审核说明
     * @return 审核后的年报计划
     */
    RecruitSiteAnnualPlan review(Long planId, String status, String reviewOpinion);

    /**
     * 企业端生成年报计划导出文件。
     *
     * @param req 查询条件
     * @return 导出文件模型
     */
    RecruitGJDFileModel generatorCorpExportFile(RecruitSiteAnnualPlanQueryReq req);

    /**
     * 管理端生成年报计划导出文件。
     *
     * @param req 查询条件
     * @return 导出文件模型
     */
    RecruitGJDFileModel generatorAdminExportFile(RecruitSiteAnnualPlanQueryReq req);
}
