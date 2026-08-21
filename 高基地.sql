
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

-- 高基地行为日志表
-- 说明：记录基地/项目/资产对象的字段变更，日志只允许生成和查询，不允许修改删除
DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
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
       AND table_name = 'RECRUIT_SITE_BEHAVIOR_LOG';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_BEHAVIOR_LOG (log_id NUMBER(12) NOT NULL, biz_type NUMBER(2) NOT NULL, biz_id NUMBER(12) NOT NULL, operator_name VARCHAR2(100) NOT NULL, operator_id VARCHAR2(64), operator_role VARCHAR2(32), operation_type VARCHAR2(32) NOT NULL, field_name VARCHAR2(100) NOT NULL, old_value VARCHAR2(2000), new_value VARCHAR2(2000), log_content VARCHAR2(4000) NOT NULL, created_at DATE DEFAULT SYSDATE NOT NULL, PRIMARY KEY (log_id))';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_BEHAVIOR_LOG IS '高基地行为日志表，记录业务对象字段变更';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.log_id IS '日志ID，SEQ_0073_RECRUIT_SITE_BEHAVIOR_LOG';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.biz_type IS '业务对象类型编码，1基地/2项目/3资产';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.biz_id IS '业务对象主键';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.operator_name IS '操作人姓名';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.operator_id IS '操作人编号';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.operator_role IS '操作角色，市级管理员/区级管理员/基地申报单位';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.operation_type IS '操作类型，修改/审核';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.field_name IS '变更字段名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.old_value IS '变更前内容';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.new_value IS '变更后内容';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.log_content IS '中文行为日志描述';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_BEHAVIOR_LOG.created_at IS '日志生成时间';

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_BEHAVIOR_LOG_BIZ';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_behavior_log_biz ON wsbs.RECRUIT_SITE_BEHAVIOR_LOG (biz_type, biz_id, created_at)';
    END IF;
END;
/

-- 基地项目信息表
-- 说明：对应答疑文档 3.失业人员全维度帮扶-项目信息管理，
-- 一个基地可关联多个项目，字段参考《3.高基地资助项目基本信息表单.xlsx》
DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_PROJECT';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_PROJECT MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
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
       AND table_name = 'RECRUIT_SITE_PROJECT';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_PROJECT (project_id NUMBER(12) NOT NULL, site_id NUMBER(12) NOT NULL, district_code VARCHAR2(32) NOT NULL, project_name VARCHAR2(200) NOT NULL, apply_direction VARCHAR2(100) NOT NULL, apply_direction_project_name VARCHAR2(200) DEFAULT NULL, project_location VARCHAR2(500) DEFAULT NULL, implement_unit VARCHAR2(200) DEFAULT NULL, project_intro VARCHAR2(1000) DEFAULT NULL, project_status VARCHAR2(32) NOT NULL, approval_time DATE DEFAULT NULL, approval_amount NUMBER(14,2) DEFAULT NULL, approval_grant_time DATE DEFAULT NULL, approval_grant_amount NUMBER(14,2) DEFAULT NULL, acceptance_time DATE DEFAULT NULL, acceptance_grant_time DATE DEFAULT NULL, acceptance_grant_amount NUMBER(14,2) DEFAULT NULL, performance_grant_time_1 DATE DEFAULT NULL, performance_grant_amount_1 NUMBER(14,2) DEFAULT NULL, performance_grant_time_2 DATE DEFAULT NULL, performance_grant_amount_2 NUMBER(14,2) DEFAULT NULL, performance_grant_time_3 DATE DEFAULT NULL, performance_grant_amount_3 NUMBER(14,2) DEFAULT NULL, total_grant_amount NUMBER(14,2) DEFAULT NULL, status VARCHAR2(32) DEFAULT ''待审核'' NOT NULL, reviewer VARCHAR2(100) DEFAULT NULL, review_time DATE DEFAULT NULL, review_opinion VARCHAR2(1000) DEFAULT NULL, created_by VARCHAR2(100) NOT NULL, created_at DATE DEFAULT SYSDATE NOT NULL, updated_by VARCHAR2(100) DEFAULT NULL, updated_at DATE DEFAULT NULL, PRIMARY KEY (project_id))';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_PROJECT IS '高基地项目信息表，一个基地可关联多个项目';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.project_id IS '项目ID，SEQ_0073_RECRUIT_SITE_PROJECT';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.site_id IS '关联基地ID，对应RECRUIT_SITE_INFO.site_id';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.district_code IS '分管区县编码，继承所属基地属地区，用于权限控制';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.project_name IS '项目名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.apply_direction IS '项目申报方向，字典RECRUIT_SITE_PROJECT_DIRECTION';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.apply_direction_project_name IS '申报方向对应项目名称，选择申报方向后填写';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.project_location IS '项目建设地点';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.implement_unit IS '项目实施单位';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.project_intro IS '项目简介，500字以内';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.project_status IS '项目状态，字典RECRUIT_SITE_PROJECT_STATUS';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.approval_time IS '立项批复时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.approval_amount IS '立项批复资助资金(万元)';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.approval_grant_time IS '立项拨付资助金资金时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.approval_grant_amount IS '立项拨付资助金资金(万元)';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.acceptance_time IS '验收批复时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.acceptance_grant_time IS '验收拨付资助金资金时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.acceptance_grant_amount IS '验收拨付资助金资金(万元)';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.performance_grant_time_1 IS '绩效评估(第一年)拨付资助金资金时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.performance_grant_amount_1 IS '绩效评估(第一年)拨付资助金资金(万元)';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.performance_grant_time_2 IS '绩效评估(第二年)拨付资助金资金时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.performance_grant_amount_2 IS '绩效评估(第二年)拨付资助金资金(万元)';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.performance_grant_time_3 IS '绩效评估(第三年)拨付资助金资金时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.performance_grant_amount_3 IS '绩效评估(第三年)拨付资助金资金(万元)';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.total_grant_amount IS '合计拨付资助资金(万元)，立项拨付+验收拨付+三年绩效拨付之和';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.status IS '审核状态，待审核/已通过/已驳回';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.reviewer IS '审核人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.review_time IS '审核时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.review_opinion IS '审核意见';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.created_by IS '创建人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.created_at IS '创建时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.updated_by IS '修改人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT.updated_at IS '修改时间';

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_PROJECT_SITE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_project_site ON wsbs.RECRUIT_SITE_PROJECT (site_id)';
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
       AND index_name = 'IDX_RECRUIT_SITE_PROJECT_DISTRICT';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_project_district ON wsbs.RECRUIT_SITE_PROJECT (district_code)';
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
       AND index_name = 'IDX_RECRUIT_SITE_PROJECT_PROJECT_STATUS';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_project_project_status ON wsbs.RECRUIT_SITE_PROJECT (project_status)';
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
       AND index_name = 'IDX_RECRUIT_SITE_PROJECT_STATUS';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_project_status ON wsbs.RECRUIT_SITE_PROJECT (status)';
    END IF;
END;
/

-- 基地项目文件表
-- 说明：对应答疑文档 3.失业人员全维度帮扶-项目信息管理，
-- 一个项目可挂多个过程文件，文件通过项目状态绑定到对应进度阶段
DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_sequences
     WHERE sequence_owner = 'WSBS'
       AND sequence_name = 'SEQ_0073_RECRUIT_SITE_PROJECT_FILE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE SEQUENCE wsbs.SEQ_0073_RECRUIT_SITE_PROJECT_FILE MINVALUE 1 MAXVALUE 999999999999 START WITH 1 INCREMENT BY 1 CACHE 20';
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
       AND table_name = 'RECRUIT_SITE_PROJECT_FILE';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_PROJECT_FILE (file_id NUMBER(12) NOT NULL, project_id NUMBER(12) NOT NULL, project_status VARCHAR2(32) NOT NULL, file_name VARCHAR2(200) NOT NULL, file_desc VARCHAR2(1000), file_storage_key VARCHAR2(500) NOT NULL, uploader_name VARCHAR2(100), uploader_id VARCHAR2(64), created_at DATE DEFAULT SYSDATE NOT NULL, updated_at DATE, PRIMARY KEY (file_id))';
    END IF;
END;
/

COMMENT ON TABLE wsbs.RECRUIT_SITE_PROJECT_FILE IS '高基地项目文件表，一个项目可挂多个过程文件';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.file_id IS '文件ID，SEQ_0073_RECRUIT_SITE_PROJECT_FILE';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.project_id IS '关联项目ID，对应RECRUIT_SITE_PROJECT.project_id';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.project_status IS '项目状态，字典RECRUIT_SITE_PROJECT_STATUS，文件挂接到对应项目进度阶段';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.file_name IS '文件名称';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.file_desc IS '文件说明';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.file_storage_key IS '文件存储key';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.uploader_name IS '上传人';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.uploader_id IS '上传人编号';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.created_at IS '创建时间';
COMMENT ON COLUMN wsbs.RECRUIT_SITE_PROJECT_FILE.updated_at IS '修改时间';

DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(1)
      INTO v_cnt
      FROM all_indexes
     WHERE owner = 'WSBS'
       AND index_name = 'IDX_RECRUIT_SITE_PROJECT_FILE_PROJECT';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_project_file_project ON wsbs.RECRUIT_SITE_PROJECT_FILE (project_id)';
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
       AND index_name = 'IDX_RECRUIT_SITE_PROJECT_FILE_PROJECT_STATUS';
    IF v_cnt = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_recruit_site_project_file_project_status ON wsbs.RECRUIT_SITE_PROJECT_FILE (project_status)';
    END IF;
END;
/



--------------高基地类别字典
INSERT INTO SBDEV.AFFAIR_DIC_TYPE VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '公共招聘高基地类别', 1, NULL, '0073');

INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '1', '企业（在沪央企）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '2', '企业（市属国企）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '3', '企业（区属企业）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '4', '企业（其他）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '5', '院校（普通高校）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '6', '院校（职业院校）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '7', '院校（其他）', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '8', '行业协会', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_INFO_TYPE', '9', '产业园区', NULL, '1', '1', '1');

--------------高基地项目申报方向字典
INSERT INTO SBDEV.AFFAIR_DIC_TYPE VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_DIRECTION', '公共招聘高基地项目申报方向', 1, NULL, '0073');

INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_DIRECTION', '1', '本市急需紧缺高技能人才职业（工种）目录', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_DIRECTION', '2', '新技能培训项目目录项目', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_DIRECTION', '3', '国家和市委市政府确定的高技能人才培养重点项目', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_DIRECTION', '4', '其他', NULL, '1', '1', '1');

--------------高基地项目状态字典
INSERT INTO SBDEV.AFFAIR_DIC_TYPE VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '公共招聘高基地项目状态', 1, NULL, '0073');

INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '1', '建设中', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '2', '已验收', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '3', '已完成第一年绩效评估', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '4', '已完成第二年绩效评估', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '5', '已完成第三年绩效评估', NULL, '1', '1', '1');
INSERT INTO SBDEV.AFFAIR_DIC_DATA VALUES(SBDEV.SEQ_AFFAIR_DIC_ID.NEXTVAL, 'RECRUIT_SITE_PROJECT_STATUS', '6', '已结项', NULL, '1', '1', '1');
