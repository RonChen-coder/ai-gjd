package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.service.RecruitSiteInfoServiceInterface;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 管理端基地信息控制层。
 * 面向市级管理员、区级管理员等内部管理角色，负责基地基础信息的管理、审核与查询。
 */
@RestController
@RequestMapping("/admi/site-info")
public class RecruitSiteAdminController {

    private final RecruitSiteInfoServiceInterface siteInfoService;

    public RecruitSiteAdminController(RecruitSiteInfoServiceInterface siteInfoService) {
        this.siteInfoService = siteInfoService;
    }

    /**
     * 创建基地信息。
     * 适用于市级管理员初始化基地基础信息，或区级管理员新增维护信息。
     *
     * @param siteInfo 基地信息请求体
     * @return 创建成功后的基地信息
     */
    @PostMapping
    public ResponseEntity<RecruitSiteInfo> create(@RequestBody RecruitSiteInfo siteInfo) {
        return ResponseEntity.ok(siteInfoService.create(siteInfo));
    }

    /**
     * 更新基地信息。
     * 适用于管理端修改基地基础信息内容。
     *
     * @param siteInfo 待更新的基地信息
     * @return 更新后的基地信息
     */
    @PutMapping
    public ResponseEntity<RecruitSiteInfo> update(@RequestBody RecruitSiteInfo siteInfo) {
        return ResponseEntity.ok(siteInfoService.update(siteInfo));
    }

    /**
     * 删除基地信息。
     * 适用于管理端删除不再需要的基地记录。
     *
     * @param siteId 基地主键ID
     * @return 无内容响应
     */
    @DeleteMapping("/{siteId}")
    public ResponseEntity<Void> delete(@PathVariable Long siteId) {
        siteInfoService.delete(siteId);
        return ResponseEntity.noContent().build();
    }

    /**
     * 根据基地ID查询基地详情。
     * 可用于管理端查看单条基地信息。
     *
     * @param siteId 基地主键ID
     * @return 基地详细信息
     */
    @GetMapping("/{siteId}")
    public ResponseEntity<RecruitSiteInfo> findById(@PathVariable Long siteId) {
        return ResponseEntity.ok(siteInfoService.findById(siteId));
    }

    /**
     * 按区县查询基地列表。
     * 仅用于当前管理员所管理区县范围内的数据查询。
     *
     * @param districtName 区县名称
     * @return 当前区县下的基地信息列表
     */
    @GetMapping("/district/{districtName}")
    public ResponseEntity<List<RecruitSiteInfo>> listByDistrict(@PathVariable String districtName) {
        return ResponseEntity.ok(siteInfoService.listByDistrict(districtName));
    }

    /**
     * 查询全部基地信息。
     * 市级管理员可查看全部区县数据，区级管理员可根据权限过滤后查看本区县数据。
     *
     * @return 基地信息列表
     */
    @GetMapping
    public ResponseEntity<List<RecruitSiteInfo>> listAll() {
        return ResponseEntity.ok(siteInfoService.listAll());
    }

    /**
     * 审核基地信息。
     * 管理端对基地信息进行审核，更新审核人、审核意见和审核状态。
     *
     * @param siteId 基地主键ID
     * @param reviewer 审核人
     * @param reviewOpinion 审核意见
     * @param status 审核状态
     * @return 更新后的基地信息
     */
    @PostMapping("/{siteId}/review")
    public ResponseEntity<RecruitSiteInfo> review(@PathVariable Long siteId,
                                           @RequestParam String reviewer,
                                           @RequestParam String reviewOpinion,
                                           @RequestParam String status) {
        return ResponseEntity.ok(siteInfoService.review(siteId, reviewer, reviewOpinion, status));
    }
}
