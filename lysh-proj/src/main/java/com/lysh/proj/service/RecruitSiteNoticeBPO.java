package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteNotice;

import java.util.List;

/**
 * 高基地专区首页公告业务处理接口。
 * 定义管理员发布公告和企业查看已发布公告的业务能力。
 */
public interface RecruitSiteNoticeBPO {

    /**
     * 创建公告。
     *
     * @param notice 公告模型
     * @return 创建后的公告模型
     */
    RecruitSiteNotice create(RecruitSiteNotice notice);

    /**
     * 更新公告。
     *
     * @param notice 公告模型
     * @return 更新后的公告模型
     */
    RecruitSiteNotice update(RecruitSiteNotice notice);

    /**
     * 删除公告。
     *
     * @param noticeId 公告主键ID
     */
    void delete(Long noticeId);

    /**
     * 查询全部公告。
     *
     * @return 公告模型列表
     */
    List<RecruitSiteNotice> listAll();

    /**
     * 根据主键ID查询公告。
     *
     * @param noticeId 公告主键ID
     * @return 公告模型
     */
    RecruitSiteNotice findById(Long noticeId);

    /**
     * 发布公告。
     *
     * @param noticeId 公告主键ID
     * @param operatorName 操作人
     * @param operatorId 操作人编号
     * @return 发布后的公告模型
     */
    RecruitSiteNotice publish(Long noticeId, String operatorName, String operatorId);

    /**
     * 下线公告。
     *
     * @param noticeId 公告主键ID
     * @param operatorName 操作人
     * @param operatorId 操作人编号
     * @return 下线后的公告模型
     */
    RecruitSiteNotice offline(Long noticeId, String operatorName, String operatorId);

    /**
     * 查询企业端可见的已发布公告列表。
     *
     * @return 已发布公告模型列表
     */
    List<RecruitSiteNotice> listPublished();

    /**
     * 查询企业端可见的已发布公告详情。
     *
     * @param noticeId 公告主键ID
     * @return 已发布公告模型
     */
    RecruitSiteNotice findPublishedById(Long noticeId);
}
