package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteRectificationQueryReq;
import com.lysh.proj.service.RecruitSiteRectificationBPO;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地预警整改结果管理端控制层。
 * 面向市区管理员，提供整改记录分页查询和详情接口。
 */
@RestController
@RequestMapping("/admin/site-rectification")
public class RecruitSiteRectificationAdminController {

    private final RecruitSiteRectificationBPO rectificationBPO;

    public RecruitSiteRectificationAdminController(RecruitSiteRectificationBPO rectificationBPO) {
        this.rectificationBPO = rectificationBPO;
    }

    /**
     * 分页查询整改记录。
     *
     * @param req 查询条件
     * @return 整改记录分页结果
     */
    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteRectificationQueryReq req) {
        return AjaxResult.PAGE(rectificationBPO.queryAdminList(req));
    }

    /**
     * 根据整改ID查询整改记录详情。
     *
     * @param rectificationId 整改ID
     * @return 整改记录详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long rectificationId) {
        return AjaxResult.SUCCESS(rectificationBPO.findAdminById(rectificationId));
    }
}
