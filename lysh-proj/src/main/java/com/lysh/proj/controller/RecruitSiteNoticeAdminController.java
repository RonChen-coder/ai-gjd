package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteNotice;
import com.lysh.proj.service.RecruitSiteNoticeBPO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 高基地专区首页公告管理端控制层。
 * 面向市级管理员，负责公告的发布、维护和下线。
 */
@RestController
@RequestMapping("/admin/site-notice")
public class RecruitSiteNoticeAdminController {

    private final RecruitSiteNoticeBPO noticeService;

    public RecruitSiteNoticeAdminController(RecruitSiteNoticeBPO noticeService) {
        this.noticeService = noticeService;
    }

    @PostMapping
    public ResponseEntity<RecruitSiteNotice> create(@RequestBody RecruitSiteNotice notice) {
        return ResponseEntity.ok(noticeService.create(notice));
    }

    @PutMapping
    public ResponseEntity<RecruitSiteNotice> update(@RequestBody RecruitSiteNotice notice) {
        return ResponseEntity.ok(noticeService.update(notice));
    }

    @DeleteMapping("/{noticeId}")
    public ResponseEntity<Void> delete(@PathVariable Long noticeId) {
        noticeService.delete(noticeId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<RecruitSiteNotice>> listAll() {
        return ResponseEntity.ok(noticeService.listAll());
    }

    @GetMapping("/{noticeId}")
    public ResponseEntity<RecruitSiteNotice> findById(@PathVariable Long noticeId) {
        return ResponseEntity.ok(noticeService.findById(noticeId));
    }

    @PostMapping("/{noticeId}/publish")
    public ResponseEntity<RecruitSiteNotice> publish(@PathVariable Long noticeId,
                                                     @RequestParam String operatorName,
                                                     @RequestParam String operatorId) {
        return ResponseEntity.ok(noticeService.publish(noticeId, operatorName, operatorId));
    }

    @PostMapping("/{noticeId}/offline")
    public ResponseEntity<RecruitSiteNotice> offline(@PathVariable Long noticeId,
                                                     @RequestParam String operatorName,
                                                     @RequestParam String operatorId) {
        return ResponseEntity.ok(noticeService.offline(noticeId, operatorName, operatorId));
    }
}
