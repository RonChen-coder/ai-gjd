package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteAnnualPerformance;
import com.lysh.proj.model.RecruitSiteAnnualPerformanceQueryReq;
import com.wondersgroup.wdls.data.commons.PageResult;

import java.math.BigDecimal;

/**
 * 高基地年度绩效业务处理接口。
 * 企业端填报绩效表单，区管理员进行评分和评分说明。
 */
public interface RecruitSiteAnnualPerformanceBPO {

    /**
     * 企业端新增或修改年度绩效。
     *
     * @param performance 年度绩效对象
     * @return 保存后的年度绩效
     */
    RecruitSiteAnnualPerformance saveByCorp(RecruitSiteAnnualPerformance performance);

    /**
     * 企业端分页查询本单位年度绩效。
     *
     * @param req 查询条件
     * @return 年度绩效分页结果
     */
    PageResult<RecruitSiteAnnualPerformance> queryCorpList(RecruitSiteAnnualPerformanceQueryReq req);

    /**
     * 企业端查询本单位年度绩效详情。
     *
     * @param performanceId 年度绩效ID
     * @return 年度绩效
     */
    RecruitSiteAnnualPerformance findCorpById(Long performanceId);

    /**
     * 管理端分页查询年度绩效。
     *
     * @param req 查询条件
     * @return 年度绩效分页结果
     */
    PageResult<RecruitSiteAnnualPerformance> queryAdminList(RecruitSiteAnnualPerformanceQueryReq req);

    /**
     * 管理端查询年度绩效详情。
     *
     * @param performanceId 年度绩效ID
     * @return 年度绩效
     */
    RecruitSiteAnnualPerformance findAdminById(Long performanceId);

    /**
     * 区管理员评分。
     *
     * @param performanceId 年度绩效ID
     * @param score 评分
     * @param scoreOpinion 评分说明
     * @return 评分后的年度绩效
     */
    RecruitSiteAnnualPerformance score(Long performanceId, BigDecimal score, String scoreOpinion);
}
