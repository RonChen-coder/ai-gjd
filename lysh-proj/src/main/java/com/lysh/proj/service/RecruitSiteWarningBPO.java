package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteWarning;
import com.lysh.proj.model.RecruitSiteWarningQueryReq;
import com.wondersgroup.wdls.data.commons.PageResult;

/**
 * 高基地预警结果业务处理接口。
 * 面向市区管理员提供预警列表、详情和处理接口。
 */
public interface RecruitSiteWarningBPO {

    /**
     * 分页查询预警列表。
     *
     * @param req 查询条件
     * @return 预警分页结果
     */
    PageResult<RecruitSiteWarning> queryList(RecruitSiteWarningQueryReq req);

    /**
     * 根据预警ID查询预警详情。
     *
     * @param warningId 预警主键ID
     * @return 预警对象
     */
    RecruitSiteWarning findById(Long warningId);

    /**
     * 处理预警。
     *
     * @param warningId 预警主键ID
     * @param status 处理结果，已处理/已忽略
     * @param remark 处理说明
     * @param needRectification 是否需要企业整改
     * @return 处理后的预警对象
     */
    RecruitSiteWarning handle(Long warningId, String status, String remark, Boolean needRectification);
}
