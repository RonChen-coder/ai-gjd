package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteWarningHandleReq;
import com.lysh.proj.model.RecruitSiteWarningQueryReq;
import com.lysh.proj.service.RecruitSiteWarningBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地预警管理端控制层。
 * 面向市区管理员，提供预警分页查询、详情和处理接口。
 */
@RestController
@RequestMapping("/admin/site-warning")
public class RecruitSiteWarningAdminController {

    private final RecruitSiteWarningBPO warningBPO;

    public RecruitSiteWarningAdminController(RecruitSiteWarningBPO warningBPO) {
        this.warningBPO = warningBPO;
    }

    /**
     * 分页查询预警列表。
     * 支持按基地、项目、资产、对象类型、级别、状态、区县和关键字检索。
     *
     * @param req 查询条件
     * @return 预警分页结果
     */
    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteWarningQueryReq req) {
        return AjaxResult.PAGE(warningBPO.queryList(req));
    }

    /**
     * 根据预警ID查询预警详情。
     *
     * @param warningId 预警主键ID
     * @return 预警详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long warningId) {
        return AjaxResult.SUCCESS(warningBPO.findById(warningId));
    }

    /**
     * 处理预警，结果为已处理或已忽略。
     *
     * @param req 处理请求体
     * @return 处理后的预警信息
     */
    @PostMapping("/handle")
    public AjaxResult handle(@RequestBody RecruitSiteWarningHandleReq req) {
        if (req == null || req.getWarningId() == null) {
            throw new BusinessException("预警ID不能为空");
        }
        return AjaxResult.SUCCESS(warningBPO.handle(req.getWarningId(), req.getStatus(), req.getRemark()));
    }
}
