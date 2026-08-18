package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteNotice;
import com.lysh.proj.service.RecruitSiteNoticeBPO;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地专区首页公告企业端控制层。
 * 面向白名单内企业，仅展示已发布公告。
 */
@RestController
@RequestMapping("/corp/site-notice")
public class RecruitSiteNoticeCorpController {

    private final RecruitSiteNoticeBPO noticeService;

    public RecruitSiteNoticeCorpController(RecruitSiteNoticeBPO noticeService) {
        this.noticeService = noticeService;
    }

    /**
     * 查询已发布公告列表。
     * 面向白名单内企业，仅展示状态为已发布的公告。
     *
     * @return 已发布公告列表
     */
    @GetMapping("/list")
    public AjaxResult listPublished() {
        return AjaxResult.SUCCESS(noticeService.listPublished());
    }

    /**
     * 查询已发布公告详情。
     * 面向白名单内企业，仅返回状态为已发布的公告。
     *
     * @param noticeId 公告主键ID
     * @return 已发布公告详情
     */
    @GetMapping("/detail")
    public AjaxResult findPublishedById(@RequestParam Long noticeId) {
        return AjaxResult.SUCCESS(noticeService.findPublishedById(noticeId));
    }
}
