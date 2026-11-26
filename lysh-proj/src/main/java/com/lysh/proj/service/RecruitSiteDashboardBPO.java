package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteDashboardBase;
import com.lysh.proj.model.RecruitSiteDashboardData;
import com.lysh.proj.model.RecruitSiteDashboardProjectDetail;
import com.lysh.proj.model.RecruitSiteDashboardQueryReq;

import java.util.List;

/**
 * 高基地运行状况看板业务处理接口。
 * 为管理端大屏提供聚合统计、基地列表下钻和项目详情下钻数据。
 */
public interface RecruitSiteDashboardBPO {

    /**
     * 获取看板聚合数据。
     *
     * @param req 查询条件
     * @return 看板数据
     */
    RecruitSiteDashboardData getDashboardData(RecruitSiteDashboardQueryReq req);

    /**
     * 按筛选条件查询基地列表。
     *
     * @param req 查询条件
     * @return 基地列表
     */
    List<RecruitSiteDashboardBase> queryBaseList(RecruitSiteDashboardQueryReq req);

    /**
     * 查询项目详情及资产、文档信息。
     *
     * @param projectId 项目ID
     * @return 项目详情
     */
    RecruitSiteDashboardProjectDetail getProjectDetail(Long projectId);
}
