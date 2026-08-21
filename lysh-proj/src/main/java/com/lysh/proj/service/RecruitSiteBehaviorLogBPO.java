package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteBehaviorLog;

import java.util.List;

/**
 * 行为日志业务处理接口。
 * 日志只允许生成和查询，不允许修改或删除。
 */
public interface RecruitSiteBehaviorLogBPO {

    /**
     * 生成一条行为日志。
     *
     * @param log 行为日志
     */
    void record(RecruitSiteBehaviorLog log);

    /**
     * 根据业务对象类型和主键查询日志列表，按生成时间倒序。
     *
     * @param bizType 业务对象类型编码：1基地、2项目、3资产
     * @param bizId 业务对象主键
     * @return 行为日志列表
     */
    List<RecruitSiteBehaviorLog> listByBiz(Integer bizType, Long bizId);
}
