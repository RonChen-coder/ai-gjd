package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteInfo;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 基地基础信息业务处理实现类。
 * 使用内部框架 DBUtils 实现 2.1 中的新增、修改、查询、审核等业务逻辑。
 */
@Service
public class RecruitSiteInfoBPOImpl implements RecruitSiteInfoBPO {

    /**
     * 创建基地信息。
     *
     * @param recruitSiteInfo 基地信息对象
     * @return 创建后的基地信息对象
     */
    @Override
    public RecruitSiteInfo create(RecruitSiteInfo recruitSiteInfo) {
        if (recruitSiteInfo.getCreatedAt() == null) {
            recruitSiteInfo.setCreatedAt(LocalDateTime.now());
        }
        if (recruitSiteInfo.getUpdatedAt() == null) {
            recruitSiteInfo.setUpdatedAt(recruitSiteInfo.getCreatedAt());
        }
        if (recruitSiteInfo.getStatus() == null || recruitSiteInfo.getStatus().isBlank()) {
            recruitSiteInfo.setStatus("初始化");
        }
        if (recruitSiteInfo.getArchiveStatus() == null || recruitSiteInfo.getArchiveStatus().isBlank()) {
            recruitSiteInfo.setArchiveStatus("未归档");
        }
        DBUtils.save(recruitSiteInfo);
        return recruitSiteInfo;
    }

    /**
     * 更新基地信息。
     *
     * @param recruitSiteInfo 待更新的基地信息对象
     * @return 更新后的基地信息对象
     */
    @Override
    public RecruitSiteInfo update(RecruitSiteInfo recruitSiteInfo) {
        recruitSiteInfo.setUpdatedAt(LocalDateTime.now());
        DBUtils.save(recruitSiteInfo);
        return recruitSiteInfo;
    }

    /**
     * 删除基地信息。
     *
     * @param siteId 基地主键ID
     */
    @Override
    public void delete(Long siteId) {
        DBUtils.execSql("DELETE FROM RECRUIT_SITE_INFO WHERE site_id = ?", siteId);
    }

    /**
     * 根据基地ID查询基地信息。
     *
     * @param siteId 基地主键ID
     * @return 基地信息对象
     */
    @Override
    public RecruitSiteInfo findById(Long siteId) {
        return DBUtils.get("SELECT * FROM RECRUIT_SITE_INFO WHERE site_id = ?", RecruitSiteInfo.class, siteId);
    }

    /**
     * 根据区县查询基地信息列表。
     *
     * @param districtName 区县名称
     * @return 基地信息列表
     */
    @Override
    public List<RecruitSiteInfo> listByDistrict(String districtName) {
        return DBUtils.query("SELECT * FROM RECRUIT_SITE_INFO WHERE district_name = ? ORDER BY site_id DESC",
                RecruitSiteInfo.class, districtName);
    }

    /**
     * 查询全部基地信息。
     *
     * @return 基地信息列表
     */
    @Override
    public List<RecruitSiteInfo> listAll() {
        return DBUtils.query("SELECT * FROM RECRUIT_SITE_INFO ORDER BY site_id DESC", RecruitSiteInfo.class);
    }

    /**
     * 审核基地信息。
     *
     * @param siteId 基地主键ID
     * @param reviewer 审核人
     * @param reviewOpinion 审核意见
     * @param status 审核状态
     * @return 审核后的基地信息对象
     */
    @Override
    public RecruitSiteInfo review(Long siteId, String reviewer, String reviewOpinion, String status) {
        RecruitSiteInfo entity = findById(siteId);
        if (entity == null) {
            throw new BusinessException("基地信息不存在: " + siteId);
        }
        entity.setReviewer(reviewer);
        entity.setReviewOpinion(reviewOpinion);
        entity.setStatus(status);
        entity.setReviewTime(LocalDateTime.now());
        entity.setUpdatedAt(LocalDateTime.now());
        DBUtils.save(entity);
        return entity;
    }
}
