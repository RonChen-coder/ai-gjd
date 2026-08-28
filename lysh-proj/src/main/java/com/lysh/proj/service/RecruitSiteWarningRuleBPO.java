package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteWarningRule;
import com.lysh.proj.model.RecruitSiteWarningRuleQueryReq;
import com.wondersgroup.wdls.data.commons.PageResult;

/**
 * 高基地预警规则配置业务处理接口。
 * 规则由后台页面维护，支持新增、修改、删除、启停和列表查询。
 */
public interface RecruitSiteWarningRuleBPO {

    /**
     * 新增预警规则。
     *
     * @param rule 规则对象
     * @return 创建后的规则对象
     */
    RecruitSiteWarningRule create(RecruitSiteWarningRule rule);

    /**
     * 修改预警规则。
     *
     * @param rule 待更新的规则对象
     * @return 更新后的规则对象
     */
    RecruitSiteWarningRule update(RecruitSiteWarningRule rule);

    /**
     * 删除预警规则。
     *
     * @param ruleId 规则主键ID
     */
    void delete(Long ruleId);

    /**
     * 启停预警规则。
     *
     * @param ruleId 规则主键ID
     * @param enabled 是否启用
     * @return 更新后的规则对象
     */
    RecruitSiteWarningRule updateEnabled(Long ruleId, Boolean enabled);

    /**
     * 分页查询预警规则。
     *
     * @param req 查询条件
     * @return 规则分页结果
     */
    PageResult<RecruitSiteWarningRule> list(RecruitSiteWarningRuleQueryReq req);

    /**
     * 根据规则ID查询规则详情。
     *
     * @param ruleId 规则主键ID
     * @return 规则对象
     */
    RecruitSiteWarningRule findById(Long ruleId);
}
