package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteNotice;
import com.lysh.proj.service.RecruitSiteNoticeBPO;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

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

    /**
     * 创建公告。
     * 适用于市级管理员录入新的高基地公告草稿。
     *
     * @param notice 公告信息请求体
     * @return 创建后的公告信息
     */
    @PostMapping
    public AjaxResult create(@RequestBody RecruitSiteNotice notice) {
        return AjaxResult.SUCCESS(noticeService.create(notice));
    }

    /**
     * 更新公告。
     * 适用于市级管理员修改公告标题、正文等信息。
     *
     * @param notice 待更新的公告信息
     * @return 更新后的公告信息
     */
    @PutMapping
    public AjaxResult update(@RequestBody RecruitSiteNotice notice) {
        return AjaxResult.SUCCESS(noticeService.update(notice));
    }

    /**
     * 删除公告。
     * 适用于市级管理员删除不再需要的公告记录。
     *
     * @param noticeId 公告主键ID
     * @return 无内容响应
     */
    @DeleteMapping("/{noticeId}")
    public AjaxResult delete(@PathVariable Long noticeId) {
        noticeService.delete(noticeId);
        return AjaxResult.SUCCESS();
    }

    /**
     * 查询全部公告。
     * 适用于市级管理员查看草稿、已发布和已下线等全部状态的公告。
     *
     * @return 公告信息列表
     */
    @GetMapping
    public AjaxResult listAll() {
        return AjaxResult.SUCCESS(noticeService.listAll());
    }

    /**
     * 根据公告ID查询公告详情。
     *
     * @param noticeId 公告主键ID
     * @return 公告详细信息
     */
    @GetMapping("/{noticeId}")
    public AjaxResult findById(@PathVariable Long noticeId) {
        return AjaxResult.SUCCESS(noticeService.findById(noticeId));
    }

    /**
     * 发布公告。
     * 发布后企业端可见该公告。
     *
     * @param noticeId 公告主键ID
     * @param operatorName 操作人姓名
     * @param operatorId 操作人编号
     * @return 发布后的公告信息
     */
    @PostMapping("/{noticeId}/publish")
    public AjaxResult publish(@PathVariable Long noticeId,
                              @RequestParam String operatorName,
                              @RequestParam String operatorId) {
        return AjaxResult.SUCCESS(noticeService.publish(noticeId, operatorName, operatorId));
    }

    /**
     * 下线公告。
     * 下线后企业端不可见该公告。
     *
     * @param noticeId 公告主键ID
     * @param operatorName 操作人姓名
     * @param operatorId 操作人编号
     * @return 下线后的公告信息
     */
    @PostMapping("/{noticeId}/offline")
    public AjaxResult offline(@PathVariable Long noticeId,
                              @RequestParam String operatorName,
                              @RequestParam String operatorId) {
        return AjaxResult.SUCCESS(noticeService.offline(noticeId, operatorName, operatorId));
    }
}
