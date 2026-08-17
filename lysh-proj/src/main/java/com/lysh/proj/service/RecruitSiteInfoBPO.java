package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteInfo;

import java.util.List;

/**
 * 高基地信息业务处理接口。
 * 定义白名单单位完善信息、市区管理员维护以及区级审核等业务能力。
 */
public interface RecruitSiteInfoBPO {

    /**
     * 单位新增高基地信息，提交后进入待审核。
     *
     * @param siteInfo 高基地信息对象
     * @return 创建后的高基地信息对象
     */
    RecruitSiteInfo createByCorp(RecruitSiteInfo siteInfo);

    /**
     * 市区管理员新增高基地信息，免审核直接生效。
     *
     * @param siteInfo 高基地信息对象
     * @return 创建后的高基地信息对象
     */
    RecruitSiteInfo createByAdmin(RecruitSiteInfo siteInfo);

    /**
     * 单位修改本单位高基地信息，修改后状态变为待审核。
     *
     * @param siteInfo 待更新的高基地信息对象
     * @return 更新后的高基地信息对象
     */
    RecruitSiteInfo updateByCorp(RecruitSiteInfo siteInfo);

    /**
     * 市区管理员修改高基地信息，免审核直接生效。
     *
     * @param siteInfo 待更新的高基地信息对象
     * @return 更新后的高基地信息对象
     */
    RecruitSiteInfo updateByAdmin(RecruitSiteInfo siteInfo);

    /**
     * 删除高基地信息。
     *
     * @param siteId 基地主键ID
     */
    void delete(Long siteId);

    /**
     * 根据基地ID查询高基地信息。
     *
     * @param siteId 基地主键ID
     * @return 高基地信息对象
     */
    RecruitSiteInfo findById(Long siteId);

    /**
     * 根据企业统一社会信用代码查询高基地信息。
     *
     * @param tyshxym 企业统一社会信用代码
     * @return 高基地信息对象
     */
    RecruitSiteInfo findByTyshxym(String tyshxym);

    /**
     * 查询全部高基地信息，市级管理员使用。
     *
     * @return 高基地信息列表
     */
    List<RecruitSiteInfo> listAll();

    /**
     * 根据属地区编码查询高基地信息，区级管理员使用。
     *
     * @param districtCode 属地区编码
     * @return 高基地信息列表
     */
    List<RecruitSiteInfo> listByDistrictCode(String districtCode);

    /**
     * 根据状态查询高基地信息。
     *
     * @param status 状态，如待审核、已通过、已驳回
     * @return 高基地信息列表
     */
    List<RecruitSiteInfo> listByStatus(String status);

    /**
     * 区级管理员审核高基地信息。
     *
     * @param siteId 基地主键ID
     * @param reviewer 审核人
     * @param reviewOpinion 审核意见
     * @param status 审核结果，已通过或已驳回
     * @return 审核后的高基地信息对象
     */
    RecruitSiteInfo review(Long siteId, String reviewer, String reviewOpinion, String status);
}
