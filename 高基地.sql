
-- 高基地白名单表
-- 说明：对应答疑文档 0.高基地白名单，使用序列生成主键，注释独立维护
DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_WHITELIST';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_WHITELIST MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_tables
     WHERE owner = 'WSBS'
       AND table_name = 'RECRUIT_SITE_WHITELIST';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_WHITELIST (whitelist_id NUMBER(12) NOT NULL, tyshxym VARCHAR(18) NOT NULL, company_name VARCHAR(200) NOT NULL, active NUMBER(1) NOT NULL DEFAULT 1, PRIMARY KEY (whitelist_id), UNIQUE (tyshxym))';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_WHITELIST IS '高基地企业白名单表';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_WHITELIST.whitelist_id IS '白名单主键ID，SEQ_0073_RECRUIT_SITE_WHITELIST';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_WHITELIST.tyshxym IS '企业统一社会信用码';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_WHITELIST.company_name IS '企业名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_WHITELIST.active IS '是否激活，1激活，0停用';

-- 高基地专区首页公告表
-- 说明：对应答疑文档 1.失业人员全维度帮扶-高基地专区首页，
-- 由市级管理员发布公告，白名单内企业可查看
DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_NOTICE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_NOTICE MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_tables
     WHERE owner = 'WSBS'
       AND table_name = 'RECRUIT_SITE_NOTICE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_NOTICE (notice_id NUMBER(12) NOT NULL, notice_title VARCHAR2(200) NOT NULL, notice_content CLOB NOT NULL, publish_date DATE DEFAULT NULL, update_date DATE DEFAULT NULL, operator_name VARCHAR2(100) DEFAULT NULL, operator_id VARCHAR2(64) NOT NULL, district_code VARCHAR2(100) DEFAULT NULL, status VARCHAR2(32) DEFAULT ''草稿'' NOT NULL, PRIMARY KEY (notice_id))';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_tab_columns
     WHERE owner = 'WSBS'
       AND table_name = 'RECRUIT_SITE_NOTICE'
       AND column_name = 'DISTRICT_CODE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE wsbs.RECRUIT_SITE_NOTICE ADD district_code VARCHAR2(100) DEFAULT NULL';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_NOTICE_STATUS';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_notice_status ON wsbs.RECRUIT_SITE_NOTICE (status)';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_NOTICE_PUBLISH_DATE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_notice_publish_date ON wsbs.RECRUIT_SITE_NOTICE (publish_date)';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_NOTICE IS '高基地专区首页公告表，用于存储高基地首页公告信息';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.notice_id IS '公告ID，系统生成，唯一主键';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.notice_title IS '公告标题';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.notice_content IS '公告内容';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.publish_date IS '发布日期';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.update_date IS '修改日期';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.operator_name IS '操作人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.operator_id IS '操作人编号';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.district_code IS '地区编码';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.status IS '公告状态，取值包括草稿、已发布、已下线';

-- 基地基础信息库
-- 说明：对应答疑文档 2.失业人员全维度帮扶-基地基础信息库
-- 高基地表单字段直接作为高基地信息表字段：
-- 基地名称、挂牌年份、基地类别、所属行业类别、属地区、上级主管部门、基地地址、基地简介
-- 单位（白名单内）按表单完善高基地信息，变更后进入待审核；市区管理员可直接修改

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_INFO';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_INFO MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_tables
     WHERE owner = 'WSBS'
       AND table_name = 'RECRUIT_SITE_INFO';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_INFO (site_id NUMBER(12) NOT NULL, tyshxym VARCHAR2(18) NOT NULL, company_name VARCHAR2(200) NOT NULL, site_name VARCHAR2(200) NOT NULL, listing_year VARCHAR2(20) NOT NULL, site_category VARCHAR2(100) NOT NULL, industry_category VARCHAR2(100) NOT NULL, district_code VARCHAR2(32) NOT NULL, superior_department VARCHAR2(200) NOT NULL, site_address VARCHAR2(500) NOT NULL, site_intro VARCHAR2(1000) NOT NULL, status VARCHAR2(32) DEFAULT ''待完善'' NOT NULL, reviewer VARCHAR2(100), review_time DATE, review_opinion VARCHAR2(1000), archive_status VARCHAR2(32) DEFAULT ''未归档'' NOT NULL, created_by VARCHAR2(100) NOT NULL, created_at DATE DEFAULT SYSDATE NOT NULL, updated_by VARCHAR2(100), updated_at DATE, PRIMARY KEY (site_id), CONSTRAINT UK_RECRUIT_SITE_INFO_TYSXYM UNIQUE (tyshxym))';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_INFO IS '高基地信息表，白名单单位按表单完善并提交审核';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.site_id IS '基地ID，系统生成，唯一主键';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.tyshxym IS '企业统一社会信用代码，关联白名单';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.company_name IS '单位名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.site_name IS '基地名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.listing_year IS '挂牌年份';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.site_category IS '基地类别，字典取值';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.industry_category IS '所属行业类别，字典取值';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.district_code IS '属地区编码';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.superior_department IS '上级主管部门';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.site_address IS '基地地址';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.site_intro IS '基地简介，500字以内';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.status IS '状态，取值包括待完善、待审核、已通过、已驳回';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.reviewer IS '审核人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.review_time IS '审核时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.review_opinion IS '审核意见';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.archive_status IS '归档状态，未归档/已归档';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.created_by IS '创建人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.created_at IS '创建时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.updated_by IS '修改人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_INFO.updated_at IS '修改时间';

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_tables
     WHERE owner = 'WSBS'
       AND table_name = 'RECRUIT_SITE_APPLY_MATERIAL';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_APPLY_MATERIAL (material_id NUMBER(12) NOT NULL, site_id NUMBER(12) NOT NULL, material_name VARCHAR2(200) NOT NULL, material_desc VARCHAR2(1000), file_name VARCHAR2(200) NOT NULL, file_storage_key VARCHAR2(500) NOT NULL, status VARCHAR2(32) DEFAULT ''有效'' NOT NULL, uploader_name VARCHAR2(100), uploader_id VARCHAR2(64), created_at DATE DEFAULT SYSDATE NOT NULL, updated_at DATE, PRIMARY KEY (material_id))';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_APPLY_MATERIAL IS '高基地申请材料表，一个基地可挂多个申请材料附件';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.material_id IS '材料ID，SEQ_0073_RECRUIT_SITE_APPLY_MATERIAL';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.site_id IS '关联基地ID';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.material_name IS '材料名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.material_desc IS '材料说明';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.file_name IS '文件名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.file_storage_key IS '文件存储key';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.status IS '材料状态，有效/作废/已归档';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.uploader_name IS '上传人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.uploader_id IS '上传人编号';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.created_at IS '创建时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_APPLY_MATERIAL.updated_at IS '修改时间';

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_INFO_TYSXYM';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_info_tyshxym ON wsbs.RECRUIT_SITE_INFO (tyshxym)';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_INFO_DISTRICT_CODE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_info_district_code ON wsbs.RECRUIT_SITE_INFO (district_code)';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_INFO_STATUS';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_info_status ON wsbs.RECRUIT_SITE_INFO (status)';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_APPLY_MATERIAL_SITE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_apply_material_site ON wsbs.RECRUIT_SITE_APPLY_MATERIAL (site_id)';
    END IF;
END;
/

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_APPLY_MATERIAL_STATUS';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_apply_material_status ON wsbs.RECRUIT_SITE_APPLY_MATERIAL (status)';
    END IF;
END;
/
