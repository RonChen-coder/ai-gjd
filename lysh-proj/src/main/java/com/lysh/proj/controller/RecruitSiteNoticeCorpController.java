package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteNotice;
import com.lysh.proj.service.RecruitSiteNoticeBPO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping
    public ResponseEntity<List<RecruitSiteNotice>> listPublished() {
        return ResponseEntity.ok(noticeService.listPublished());
    }

    @GetMapping("/{noticeId}")
    public ResponseEntity<RecruitSiteNotice> findPublishedById(@PathVariable Long noticeId) {
        return ResponseEntity.ok(noticeService.findPublishedById(noticeId));
    }
}
