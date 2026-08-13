-- 高基地基础信息表
-- 说明：基于 2.1 基地字段信息设计，表名统一使用 RECRUIT_ 前缀，适用于 OceanBase/MySQL 兼容数据库执行

CREATE TABLE IF NOT EXISTS RECRUIT_SITE_INFO (
    site_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '基地ID，系统生成，唯一主键',
    site_name VARCHAR(200) NOT NULL COMMENT '基地名称',
    award_batch VARCHAR(100) NOT NULL COMMENT '授牌批次，如第几批',
    longitude DECIMAL(10, 6) NOT NULL COMMENT '地理坐标-经度，基地所在位置经度',
    latitude DECIMAL(10, 6) NOT NULL COMMENT '地理坐标-纬度，基地所在位置纬度',
    industry VARCHAR(100) NOT NULL COMMENT '所属行业，行业分类',
    department VARCHAR(100) NOT NULL COMMENT '主管部门，业务主管部门',
    district_name VARCHAR(100) NOT NULL COMMENT '分管区县，基地归属区县，作为权限控制依据',
    site_category VARCHAR(100) DEFAULT NULL COMMENT '基地分类，用于分类管理',
    maintenance_unit VARCHAR(200) DEFAULT NULL COMMENT '维护单位，负责维护的区级单位',
    reporting_unit VARCHAR(200) NOT NULL COMMENT '填报单位，基地信息填报单位',
    status VARCHAR(32) NOT NULL COMMENT '状态，取值包括初始化、待完善、待审核、已通过、已驳回',
    archive_status VARCHAR(32) DEFAULT '未归档' COMMENT '归档状态，取值包括未归档、已归档',
    reviewer VARCHAR(100) DEFAULT NULL COMMENT '审核人，区级审核人',
    review_time DATETIME DEFAULT NULL COMMENT '审核时间，区级审核时间',
    review_opinion TEXT DEFAULT NULL COMMENT '审核意见，审核反馈意见',
    created_by VARCHAR(100) NOT NULL COMMENT '创建人，首次创建信息的操作人',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，首次创建信息的时间',
    updated_by VARCHAR(100) DEFAULT NULL COMMENT '修改人，最近修改信息的操作人',
    updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，最近修改信息的时间',
    PRIMARY KEY (site_id),
    KEY idx_recruit_site_info_district (district_name),
    KEY idx_recruit_site_info_status (status),
    KEY idx_recruit_site_info_archive_status (archive_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='高基地基础信息表，用于存储高技能人才培养基地基础信息';

-- 高基地白名单表
-- 说明：基于实体类 com.lysh.proj.entity.RecruitSiteWhitelistEntity 生成，
-- 对应答疑文档 0.高基地白名单，存储企业统一社会信用码、企业名称和是否激活
CREATE TABLE IF NOT EXISTS RECRUIT_SITE_WHITELIST (
    whitelist_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '白名单主键ID，系统生成',
    tyshxym VARCHAR(18) NOT NULL COMMENT '企业统一社会信用码',
    company_name VARCHAR(200) NOT NULL COMMENT '企业名称',
    active TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否激活，1激活，0停用',
    PRIMARY KEY (whitelist_id),
    UNIQUE KEY uk_recruit_site_whitelist_tyshxym (tyshxym)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='高基地企业白名单表';
