package com.lysh.proj.controller;

import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.service.RecruitSiteInfoBPO;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 高基地信息企业端控制层。
 * 面向白名单内单位，提供本单位高基地信息的完善和变更提交接口。
 */
@RestController
@RequestMapping("/corp/site-info")
public class RecruitSiteInfoCorpController {

    private final RecruitSiteInfoBPO siteInfoBPO;

    public RecruitSiteInfoCorpController(RecruitSiteInfoBPO siteInfoBPO) {
        this.siteInfoBPO = siteInfoBPO;
    }

    /**
     * 单位新增高基地信息，提交后进入待审核。
     *
     * @param siteInfo 高基地信息请求体，tyshxym 必填
     * @return 创建后的高基地信息
     */
    @PostMapping("/create")
    public AjaxResult create(@RequestBody RecruitSiteInfo siteInfo) {
        return AjaxResult.SUCCESS(siteInfoBPO.createByCorp(siteInfo));
    }

    /**
     * 单位修改本单位高基地信息，修改后状态变为待审核。
     *
     * @param siteInfo 待更新的高基地信息，siteId 和 tyshxym 必填
     * @return 更新后的高基地信息
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody RecruitSiteInfo siteInfo) {
        return AjaxResult.SUCCESS(siteInfoBPO.updateByCorp(siteInfo));
    }

    /**
     * 查询当前单位的高基地信息。
     *
     * @param tyshxym 企业统一社会信用代码
     * @return 当前单位的高基地信息
     */
    @GetMapping("/mine")
    public AjaxResult findMine(@RequestParam String tyshxym) {
        return AjaxResult.SUCCESS(siteInfoBPO.findByTyshxym(tyshxym));
    }
}
