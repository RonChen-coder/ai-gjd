package com.lysh.proj.service;

import com.lysh.proj.dao.RecruitSiteInfoDao;
import com.lysh.proj.model.RecruitSiteInfo;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 基地基础信息业务服务层。
 * 负责实现 2.1 中的新增、修改、查询、审核等业务逻辑。
 */
@Service
public class RecruitSiteInfoService implements RecruitSiteInfoServiceInterface {

    private final RecruitSiteInfoDao recruitSiteInfoDao;

    public RecruitSiteInfoService(RecruitSiteInfoDao recruitSiteInfoDao) {
        this.recruitSiteInfoDao = recruitSiteInfoDao;
    }

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
        recruitSiteInfoDao.insert(recruitSiteInfo);
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
        recruitSiteInfoDao.update(recruitSiteInfo);
        return recruitSiteInfo;
    }

    /**
     * 删除基地信息。
     *
     * @param siteId 基地主键ID
     */
    @Override
    public void delete(Long siteId) {
        recruitSiteInfoDao.delete(siteId);
    }

    /**
     * 根据基地ID查询基地信息。
     *
     * @param siteId 基地主键ID
     * @return 基地信息对象
     */
    @Override
    public RecruitSiteInfo findById(Long siteId) {
        return recruitSiteInfoDao.findById(siteId);
    }

    /**
     * 根据区县查询基地信息列表。
     *
     * @param districtName 区县名称
     * @return 基地信息列表
     */
    @Override
    public List<RecruitSiteInfo> listByDistrict(String districtName) {
        return recruitSiteInfoDao.listByDistrict(districtName);
    }

    /**
     * 查询全部基地信息。
     *
     * @return 基地信息列表
     */
    @Override
    public List<RecruitSiteInfo> listAll() {
        return recruitSiteInfoDao.listAll();
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
        RecruitSiteInfo entity = recruitSiteInfoDao.findById(siteId);
        entity.setReviewer(reviewer);
        entity.setReviewOpinion(reviewOpinion);
        entity.setStatus(status);
        entity.setReviewTime(LocalDateTime.now());
        entity.setUpdatedAt(LocalDateTime.now());
        recruitSiteInfoDao.update(entity);
        return entity;
    }
}
