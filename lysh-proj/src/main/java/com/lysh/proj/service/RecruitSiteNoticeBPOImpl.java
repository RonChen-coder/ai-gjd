package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteNoticeEntity;
import com.lysh.proj.model.RecruitSiteNotice;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 高基地专区首页公告业务处理实现类。
 * 使用内部框架 DBUtils 实现公告的新增、修改、删除、发布、下线与查询。
 */
@Service
public class RecruitSiteNoticeBPOImpl implements RecruitSiteNoticeBPO {

    private static final String STATUS_DRAFT = "草稿";
    private static final String STATUS_PUBLISHED = "已发布";
    private static final String STATUS_OFFLINE = "已下线";
    private static final String COLUMNS = "notice_id, notice_title, notice_content, publish_date, update_date, operator_name, operator_id, district_code, status";

    @Override
    public RecruitSiteNotice create(RecruitSiteNotice notice) {
        if (notice.getStatus() == null || notice.getStatus().isBlank()) {
            notice.setStatus(STATUS_DRAFT);
        }
        Date now = new Date();
        if (notice.getUpdateDate() == null) {
            notice.setUpdateDate(now);
        }
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_NOTICE " +
                "(notice_id, notice_title, notice_content, publish_date, update_date, operator_name, operator_id, district_code, status) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_NOTICE.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)",
                notice.getNoticeTitle(),
                notice.getNoticeContent(),
                notice.getPublishDate(),
                now,
                notice.getOperatorName(),
                notice.getOperatorId(),
                notice.getDistrictCode(),
                notice.getStatus());
        notice.setNoticeId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_NOTICE.CURRVAL FROM DUAL")));
        return notice;
    }

    @Override
    public RecruitSiteNotice update(RecruitSiteNotice notice) {
        if (notice.getStatus() == null || notice.getStatus().isBlank()) {
            RecruitSiteNotice old = findById(notice.getNoticeId());
            notice.setStatus(old != null ? old.getStatus() : STATUS_DRAFT);
        }
        notice.setUpdateDate(new Date());
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_NOTICE SET " +
                "notice_title = ?, notice_content = ?, update_date = ?, operator_name = ?, operator_id = ?, district_code = ?, status = ? " +
                "WHERE notice_id = ?",
                notice.getNoticeTitle(),
                notice.getNoticeContent(),
                notice.getUpdateDate(),
                notice.getOperatorName(),
                notice.getOperatorId(),
                notice.getDistrictCode(),
                notice.getStatus(),
                notice.getNoticeId());
        return notice;
    }

    @Override
    public void delete(Long noticeId) {
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_NOTICE WHERE notice_id = ?", noticeId);
    }

    @Override
    public List<RecruitSiteNotice> listAll() {
        List<RecruitSiteNoticeEntity> entities = DBUtils.query(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_NOTICE ORDER BY publish_date DESC, notice_id DESC",
                RecruitSiteNoticeEntity.class);
        return toModels(entities);
    }

    @Override
    public RecruitSiteNotice findById(Long noticeId) {
        RecruitSiteNoticeEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_NOTICE WHERE notice_id = ?",
                RecruitSiteNoticeEntity.class, noticeId);
        return toModel(entity);
    }

    @Override
    public RecruitSiteNotice publish(Long noticeId, String operatorName, String operatorId) {
        Date now = new Date();
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_NOTICE SET " +
                "status = ?, publish_date = ?, update_date = ?, operator_name = ?, operator_id = ? " +
                "WHERE notice_id = ?",
                STATUS_PUBLISHED, now, now, operatorName, operatorId, noticeId);
        return findById(noticeId);
    }

    @Override
    public RecruitSiteNotice offline(Long noticeId, String operatorName, String operatorId) {
        Date now = new Date();
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_NOTICE SET " +
                "status = ?, update_date = ?, operator_name = ?, operator_id = ? " +
                "WHERE notice_id = ?",
                STATUS_OFFLINE, now, operatorName, operatorId, noticeId);
        return findById(noticeId);
    }

    @Override
    public List<RecruitSiteNotice> listPublished() {
        List<RecruitSiteNoticeEntity> entities = DBUtils.query(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_NOTICE WHERE status = ? ORDER BY publish_date DESC, notice_id DESC",
                RecruitSiteNoticeEntity.class, STATUS_PUBLISHED);
        return toModels(entities);
    }

    @Override
    public RecruitSiteNotice findPublishedById(Long noticeId) {
        RecruitSiteNoticeEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_NOTICE WHERE notice_id = ? AND status = ?",
                RecruitSiteNoticeEntity.class, noticeId, STATUS_PUBLISHED);
        return toModel(entity);
    }

    private List<RecruitSiteNotice> toModels(List<RecruitSiteNoticeEntity> entities) {
        List<RecruitSiteNotice> models = new ArrayList<>();
        for (RecruitSiteNoticeEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteNotice toModel(RecruitSiteNoticeEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteNotice model = new RecruitSiteNotice();
        model.setNoticeId(entity.getNoticeId());
        model.setNoticeTitle(entity.getNoticeTitle());
        model.setNoticeContent(entity.getNoticeContent());
        model.setPublishDate(entity.getPublishDate());
        model.setUpdateDate(entity.getUpdateDate());
        model.setOperatorName(entity.getOperatorName());
        model.setOperatorId(entity.getOperatorId());
        model.setDistrictCode(entity.getDistrictCode());
        model.setStatus(entity.getStatus());
        return model;
    }
}
