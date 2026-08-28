package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteRectification;
import com.lysh.proj.model.RecruitSiteRectificationQueryReq;
import com.lysh.proj.model.RecruitSiteRectificationUploadReq;
import com.lysh.proj.model.RecruitSiteWarning;
import com.wondersgroup.wdls.data.commons.PageResult;

/**
 * 高基地预警整改结果业务处理接口。
 * 管理端处理预警时生成整改记录，企业端上传整改报告，双方均可分页查看。
 */
public interface RecruitSiteRectificationBPO {

    /**
     * 根据预警生成整改记录。
     *
     * @param warning 预警模型
     * @param createdBy 创建人
     * @return 创建后的整改记录
     */
    RecruitSiteRectification createByWarning(RecruitSiteWarning warning, String createdBy);

    /**
     * 管理端分页查询整改记录。
     *
     * @param req 查询条件
     * @return 整改记录分页结果
     */
    PageResult<RecruitSiteRectification> queryAdminList(RecruitSiteRectificationQueryReq req);

    /**
     * 企业端分页查询本单位整改记录。
     *
     * @param req 查询条件
     * @return 整改记录分页结果
     */
    PageResult<RecruitSiteRectification> queryCorpList(RecruitSiteRectificationQueryReq req);

    /**
     * 管理端查询整改记录详情。
     *
     * @param rectificationId 整改ID
     * @return 整改记录
     */
    RecruitSiteRectification findAdminById(Long rectificationId);

    /**
     * 企业端查询本单位整改记录详情。
     *
     * @param rectificationId 整改ID
     * @return 整改记录
     */
    RecruitSiteRectification findCorpById(Long rectificationId);

    /**
     * 企业上传整改报告。
     *
     * @param req 上传请求
     * @return 上传后的整改记录
     */
    RecruitSiteRectification uploadByCorp(RecruitSiteRectificationUploadReq req);
}
