package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteProject;
import com.lysh.proj.model.RecruitSiteProjectQueryReq;
import com.wondersgroup.wdls.data.commons.PageResult;

/**
 * 高基地项目信息业务处理接口。
 * 定义单位上传、市区管理员维护、区级审核和分页检索能力。
 */
public interface RecruitSiteProjectBPO {

    /**
     * 单位新增项目信息，提交后进入待审核，自动绑定当前登录单位的高基地。
     *
     * @param project 项目信息对象
     * @return 创建后的项目信息对象
     */
    RecruitSiteProject createByCorp(RecruitSiteProject project);

    /**
     * 市区管理员新增项目信息，免审核直接生效。
     *
     * @param project 项目信息对象
     * @return 创建后的项目信息对象
     */
    RecruitSiteProject createByAdmin(RecruitSiteProject project);

    /**
     * 单位修改当前登录单位项目信息，修改后进入待审核。
     *
     * @param project 待更新的项目信息对象
     * @return 更新后的项目信息对象
     */
    RecruitSiteProject updateByCorp(RecruitSiteProject project);

    /**
     * 市区管理员修改项目信息，免审核直接生效。
     *
     * @param project 待更新的项目信息对象
     * @return 更新后的项目信息对象
     */
    RecruitSiteProject updateByAdmin(RecruitSiteProject project);

    /**
     * 单位删除当前登录单位项目信息。
     *
     * @param projectId 项目主键ID
     */
    void deleteByCorp(Long projectId);

    /**
     * 市区管理员删除项目信息。
     *
     * @param projectId 项目主键ID
     */
    void delete(Long projectId);

    /**
     * 根据项目ID查询项目信息。
     *
     * @param projectId 项目主键ID
     * @return 项目信息对象
     */
    RecruitSiteProject findById(Long projectId);

    /**
     * 企业端根据项目ID查询本单位项目信息。
     *
     * @param projectId 项目主键ID
     * @return 项目信息对象
     */
    RecruitSiteProject findCorpById(Long projectId);

    /**
     * 管理端分页查询项目信息，自动按当前管理员属地区限权。
     *
     * @param req 查询条件
     * @return 项目信息分页结果
     */
    PageResult<RecruitSiteProject> queryList(RecruitSiteProjectQueryReq req);

    /**
     * 企业端分页查询当前登录单位项目信息。
     *
     * @param req 查询条件
     * @return 项目信息分页结果
     */
    PageResult<RecruitSiteProject> queryCorpList(RecruitSiteProjectQueryReq req);

    /**
     * 区级管理员审核项目信息。
     *
     * @param projectId 项目主键ID
     * @param reviewOpinion 审核意见
     * @param status 审核结果，已通过或已驳回
     * @return 审核后的项目信息对象
     */
    RecruitSiteProject review(Long projectId, String reviewOpinion, String status);
}
