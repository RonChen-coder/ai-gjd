package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteWhitelist;
import com.lysh.proj.service.RecruitSiteWhitelistBPO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 高基地白名单控制层。
 * 提供白名单列表、单条查询和存在性校验接口。
 */
@RestController
@RequestMapping("/admin/site-whitelist")
public class RecruitSiteWhitelistController {

    private final RecruitSiteWhitelistBPO siteWhitelistService;

    public RecruitSiteWhitelistController(RecruitSiteWhitelistBPO siteWhitelistService) {
        this.siteWhitelistService = siteWhitelistService;
    }

    /**
     * 查询全部白名单记录。
     *
     * @return 白名单记录列表
     */
    @GetMapping
    public ResponseEntity<List<RecruitSiteWhitelist>> listAll() {
        return ResponseEntity.ok(siteWhitelistService.listAll());
    }

    /**
     * 根据主键ID查询白名单记录。
     *
     * @param siteWhitelistId 白名单主键ID
     * @return 白名单记录
     */
    @GetMapping("/{siteWhitelistId}")
    public ResponseEntity<RecruitSiteWhitelist> findById(@PathVariable Long siteWhitelistId) {
        return ResponseEntity.ok(siteWhitelistService.findById(siteWhitelistId));
    }

    /**
     * 根据企业统一社会信用码查询白名单记录。
     *
     * @param tyshxym 企业统一社会信用码
     * @return 白名单记录
     */
    @GetMapping("/tyshxym/{tyshxym}")
    public ResponseEntity<RecruitSiteWhitelist> findByTyshxym(@PathVariable String tyshxym) {
        return ResponseEntity.ok(siteWhitelistService.findByTyshxym(tyshxym));
    }

    /**
     * 根据企业统一社会信用码校验白名单记录是否存在。
     *
     * @param tyshxym 企业统一社会信用码
     * @return 存在返回 true，否则返回 false
     */
    @GetMapping("/exists")
    public ResponseEntity<Boolean> exists(@RequestParam String tyshxym) {
        return ResponseEntity.ok(siteWhitelistService.existsByTyshxym(tyshxym));
    }
}
