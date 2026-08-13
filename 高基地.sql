
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
        EXECUTE IMMEDIATE 'CREATE TABLE wsbs.RECRUIT_SITE_NOTICE (notice_id NUMBER(12) NOT NULL, notice_title VARCHAR2(200) NOT NULL, notice_content CLOB NOT NULL, publish_date DATE DEFAULT NULL, update_date DATE DEFAULT NULL, operator_name VARCHAR2(100) DEFAULT NULL, operator_id VARCHAR2(64) NOT NULL, status VARCHAR2(32) DEFAULT ''草稿'' NOT NULL, PRIMARY KEY (notice_id))';
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
COMMENT ON COLUMN wsbs.RECRUIT_SITE_NOTICE.status IS '公告状态，取值包括草稿、已发布、已下线';
