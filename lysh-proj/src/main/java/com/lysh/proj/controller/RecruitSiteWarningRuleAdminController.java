package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteWarningRule;
import com.lysh.proj.model.RecruitSiteWarningRuleQueryReq;
import com.lysh.proj.service.RecruitSiteWarningRuleBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地预警规则配置管理端控制层。
 * 面向市区管理员，提供预警规则的维护接口，条件参数以 JSON 存储。
 */
@RestController
@RequestMapping("/admin/site-warning-rule")
public class RecruitSiteWarningRuleAdminController {

    private final RecruitSiteWarningRuleBPO warningRuleBPO;

    public RecruitSiteWarningRuleAdminController(RecruitSiteWarningRuleBPO warningRuleBPO) {
        this.warningRuleBPO = warningRuleBPO;
    }

    /**
     * 新增预警规则。
     *
     * @param rule 规则请求体
     * @return 创建后的规则信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteWarningRule rule) {
        if (rule == null) {
            throw new BusinessException("预警规则不能为空");
        }
        return AjaxResult.SUCCESS(warningRuleBPO.create(rule));
    }

    /**
     * 修改预警规则。
     *
     * @param rule 待更新的规则信息
     * @return 更新后的规则信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteWarningRule rule) {
        if (rule == null) {
            throw new BusinessException("预警规则不能为空");
        }
        return AjaxResult.SUCCESS(warningRuleBPO.update(rule));
    }

    /**
     * 删除预警规则。
     *
     * @param ruleId 规则主键ID
     * @return 无内容响应
     */
    @PostMapping("/delete")
    public AjaxResult delete(@RequestParam Long ruleId) {
        warningRuleBPO.delete(ruleId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 启用或停用预警规则。
     *
     * @param ruleId 规则主键ID
     * @param enabled 是否启用
     * @return 更新后的规则信息
     */
    @PostMapping("/toggle")
    public AjaxResult toggle(@RequestParam Long ruleId, @RequestParam Boolean enabled) {
        return AjaxResult.SUCCESS(warningRuleBPO.updateEnabled(ruleId, enabled));
    }

    /**
     * 分页查询预警规则。
     * 支持按对象类型、级别、启停状态和关键字检索。
     *
     * @param req 查询条件
     * @return 规则分页结果
     */
    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteWarningRuleQueryReq req) {
        return AjaxResult.PAGE(warningRuleBPO.list(req));
    }

    /**
     * 根据规则ID查询预警规则详情。
     *
     * @param ruleId 规则主键ID
     * @return 规则信息
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long ruleId) {
        return AjaxResult.SUCCESS(warningRuleBPO.findById(ruleId));
    }
}
