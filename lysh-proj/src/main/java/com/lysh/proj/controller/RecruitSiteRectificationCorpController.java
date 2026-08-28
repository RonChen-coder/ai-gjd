package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteRectificationQueryReq;
import com.lysh.proj.model.RecruitSiteRectificationUploadReq;
import com.lysh.proj.service.RecruitSiteRectificationBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地预警整改结果企业端控制层。
 * 企业端只能查看本单位整改记录，并上传整改报告文件key。
 */
@RestController
@RequestMapping("/corp/site-rectification")
public class RecruitSiteRectificationCorpController {

    private final RecruitSiteRectificationBPO rectificationBPO;

    public RecruitSiteRectificationCorpController(RecruitSiteRectificationBPO rectificationBPO) {
        this.rectificationBPO = rectificationBPO;
    }

    /**
     * 分页查询本单位整改记录。
     *
     * @param req 查询条件
     * @return 整改记录分页结果
     */
    @PostMapping("/list")
    public AjaxResult list(@RequestBody(required = false) RecruitSiteRectificationQueryReq req) {
        return AjaxResult.PAGE(rectificationBPO.queryCorpList(req));
    }

    /**
     * 查询本单位整改记录详情。
     *
     * @param rectificationId 整改ID
     * @return 整改记录详情
     */
    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam Long rectificationId) {
        return AjaxResult.SUCCESS(rectificationBPO.findCorpById(rectificationId));
    }

    /**
     * 上传整改报告。
     *
     * @param req 上传请求体
     * @return 上传后的整改记录
     */
    @PostMapping("/upload")
    public AjaxResult upload(@RequestBody RecruitSiteRectificationUploadReq req) {
        if (req == null || req.getRectificationId() == null) {
            throw new BusinessException("整改ID不能为空");
        }
        return AjaxResult.SUCCESS(rectificationBPO.uploadByCorp(req));
    }
}
