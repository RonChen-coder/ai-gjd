package com.lysh.proj.dao;

import com.lysh.proj.model.RecruitSiteInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 基地基础信息数据访问层。
 * 使用 JdbcTemplate 进行数据库访问，便于与 OceanBase/MySQL 兼容。
 */
@Repository
public class RecruitSiteInfoDao {

    private final JdbcTemplate jdbcTemplate;

    public RecruitSiteInfoDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    /**
     * 新增基地信息。
     *
     * @param recruitSiteInfo 基地信息对象
     * @return 影响行数
     */
    public int insert(RecruitSiteInfo recruitSiteInfo) {
        String sql = "INSERT INTO RECRUIT_SITE_INFO " +
                "(site_name, award_batch, longitude, latitude, industry, department, district_name, site_category, maintenance_unit, reporting_unit, status, archive_status, reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                recruitSiteInfo.getSiteName(),
                recruitSiteInfo.getAwardBatch(),
                recruitSiteInfo.getLongitude(),
                recruitSiteInfo.getLatitude(),
                recruitSiteInfo.getIndustry(),
                recruitSiteInfo.getDepartment(),
                recruitSiteInfo.getDistrictName(),
                recruitSiteInfo.getSiteCategory(),
                recruitSiteInfo.getMaintenanceUnit(),
                recruitSiteInfo.getReportingUnit(),
                recruitSiteInfo.getStatus(),
                recruitSiteInfo.getArchiveStatus(),
                recruitSiteInfo.getReviewer(),
                recruitSiteInfo.getReviewTime(),
                recruitSiteInfo.getReviewOpinion(),
                recruitSiteInfo.getCreatedBy(),
                recruitSiteInfo.getCreatedAt(),
                recruitSiteInfo.getUpdatedBy(),
                recruitSiteInfo.getUpdatedAt());
    }

    /**
     * 更新基地信息。
     *
     * @param recruitSiteInfo 基地信息对象
     * @return 影响行数
     */
    public int update(RecruitSiteInfo recruitSiteInfo) {
        String sql = "UPDATE RECRUIT_SITE_INFO SET " +
                "site_name = ?, award_batch = ?, longitude = ?, latitude = ?, industry = ?, department = ?, district_name = ?, site_category = ?, maintenance_unit = ?, reporting_unit = ?, status = ?, archive_status = ?, reviewer = ?, review_time = ?, review_opinion = ?, updated_by = ?, updated_at = ? " +
                "WHERE site_id = ?";
        return jdbcTemplate.update(sql,
                recruitSiteInfo.getSiteName(),
                recruitSiteInfo.getAwardBatch(),
                recruitSiteInfo.getLongitude(),
                recruitSiteInfo.getLatitude(),
                recruitSiteInfo.getIndustry(),
                recruitSiteInfo.getDepartment(),
                recruitSiteInfo.getDistrictName(),
                recruitSiteInfo.getSiteCategory(),
                recruitSiteInfo.getMaintenanceUnit(),
                recruitSiteInfo.getReportingUnit(),
                recruitSiteInfo.getStatus(),
                recruitSiteInfo.getArchiveStatus(),
                recruitSiteInfo.getReviewer(),
                recruitSiteInfo.getReviewTime(),
                recruitSiteInfo.getReviewOpinion(),
                recruitSiteInfo.getUpdatedBy(),
                recruitSiteInfo.getUpdatedAt(),
                recruitSiteInfo.getSiteId());
    }

    /**
     * 删除基地信息。
     *
     * @param siteId 基地主键ID
     * @return 影响行数
     */
    public int delete(Long siteId) {
        String sql = "DELETE FROM RECRUIT_SITE_INFO WHERE site_id = ?";
        return jdbcTemplate.update(sql, siteId);
    }

    /**
     * 根据基地ID查询基地信息。
     *
     * @param siteId 基地主键ID
     * @return 基地信息对象
     */
    public RecruitSiteInfo findById(Long siteId) {
        String sql = "SELECT * FROM RECRUIT_SITE_INFO WHERE site_id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(RecruitSiteInfo.class), siteId);
    }

    /**
     * 根据区县查询基地信息列表。
     *
     * @param districtName 区县名称
     * @return 基地信息列表
     */
    public List<RecruitSiteInfo> listByDistrict(String districtName) {
        String sql = "SELECT * FROM RECRUIT_SITE_INFO WHERE district_name = ? ORDER BY site_id DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(RecruitSiteInfo.class), districtName);
    }

    /**
     * 查询全部基地信息。
     *
     * @return 基地信息列表
     */
    public List<RecruitSiteInfo> listAll() {
        String sql = "SELECT * FROM RECRUIT_SITE_INFO ORDER BY site_id DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(RecruitSiteInfo.class));
    }
}
