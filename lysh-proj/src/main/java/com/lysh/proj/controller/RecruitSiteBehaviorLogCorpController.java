package com.lysh.proj.controller;

import com.lysh.proj.common.BehaviorBizType;
import com.lysh.proj.service.RecruitSiteBehaviorLogBPO;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * 行为日志企业端控制层。
 * 面向白名单内单位，提供本单位相关行为日志列表查询。
 */
@RestController
@RequestMapping("/corp/behavior-log")
public class RecruitSiteBehaviorLogCorpController {

    private final RecruitSiteBehaviorLogBPO behaviorLogBPO;

    public RecruitSiteBehaviorLogCorpController(RecruitSiteBehaviorLogBPO behaviorLogBPO) {
        this.behaviorLogBPO = behaviorLogBPO;
    }

    /**
     * 按业务对象类型和主键查询行为日志列表。
     *
     * @param bizType 业务对象类型编码：1基地、2项目、3资产
     * @param bizId 业务对象主键
     * @return 行为日志列表
     */
    @GetMapping("/list")
    public AjaxResult list(@RequestParam Integer bizType, @RequestParam Long bizId) {
        if (BehaviorBizType.fromCode(bizType) == null) {
            throw new BusinessException("业务类型编码仅支持1基地、2项目、3资产");
        }
        return AjaxResult.SUCCESS(behaviorLogBPO.listByBiz(bizType, bizId));
    }
}
