package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.service.RecruitSiteInfoBPO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 申报单位基地信息控制层。
 * 面向基地/申报单位等业务填报角色，负责提交和查看本单位相关基地信息。
 */
@RestController
@RequestMapping("/corp/site-info")
public class RecruitSiteApplicantController {

    private final RecruitSiteInfoBPO siteInfoService;

    public RecruitSiteApplicantController(RecruitSiteInfoBPO siteInfoService) {
        this.siteInfoService = siteInfoService;
    }

    /**
     * 申报单位提交基地信息。
     * 适用于基地/申报单位填写并提交本单位基地基础信息。
     *
     * @param siteInfo 基地信息请求体
     * @return 创建成功后的基地信息
     */
    @PostMapping
    public ResponseEntity<RecruitSiteInfo> create(@RequestBody RecruitSiteInfo siteInfo) {
        return ResponseEntity.ok(siteInfoService.create(siteInfo));
    }

    /**
     * 申报单位查看本单位基地信息详情。
     *
     * @param siteId 基地主键ID
     * @return 基地详情
     */
    @GetMapping("/{siteId}")
    public ResponseEntity<RecruitSiteInfo> findById(@PathVariable Long siteId) {
        return ResponseEntity.ok(siteInfoService.findById(siteId));
    }

    /**
     * 申报单位查看本单位基地信息列表。
     *
     * @return 当前申报单位下的基地信息列表
     */
    @GetMapping
    public ResponseEntity<List<RecruitSiteInfo>> listAll() {
        return ResponseEntity.ok(siteInfoService.listAll());
    }
}
