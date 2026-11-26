-- 导入高基地项目
-- 数据来源：【DS-v6】高基地项目模板_320项目.xls
-- 源文件共 319 条项目；跳过 RECRUIT_SITE_INFO 中无对应基地的 11 条后，共导入 308 条。
-- 跳过信用代码：913100001323165418（Excel 第 195-205 行）。
-- site_id、district_code 通过企业统一社会信用代码从 wsbs.RECRUIT_SITE_INFO 查询。
-- project_status：已结项 -> 6；审核状态：已通过；创建人：system。
-- Oracle 中空字符串等价于 NULL，因此非空字段 apply_direction 使用单空格。

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '绿色环保应用实训项目-挥发性有机物(VOCs)处理', ' ', NULL,
    '云岭东路345号', '上海化工研究院有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 518,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 259,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    251.2208,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    510.2208,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913101074250115305';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '化学品仓储安全作业实训项目', ' ', NULL,
    '云岭东路345号1号楼1层', '上海化工研究院有限公司', NULL,
    '6', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 288.5,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), 144.25,
    TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'),
    144.16,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    288.41,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913101074250115305';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '物流师（RFID）实训设施设备添置', ' ', NULL,
    '交大闵行校区软件大楼/希姆通青浦工厂（胜利路888号）', '上海交通大学/上海晨兴希姆通电子科技有限
公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 749.283,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 374.6415,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    339.1915,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    713.833,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501782151B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智能传感器网络装调（专项职业能力）', ' ', NULL,
    '嘉定区平城路1455号B座12楼', '上海物联网中心（中科院上海微系统所）', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 712,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 356,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    317.1567,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    673.1567,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501782151B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智能家居系统安装与维护', ' ', NULL,
    '新元南路600号14幢301', '上海临港经济发展集团资产管理有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 882.8604,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 441.43,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    432.09,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    873.52,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501782151B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智能网联车控制系统检测与测试', ' ', NULL,
    '漕河泾浦江科技广场20号楼 2层', '上海霍兰汽车科技有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1854.96,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 927.48,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    905.109,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1832.589,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501782151B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '半导体芯片制造工（光电子）实训设施设备添置', ' ', NULL,
    '来', '上海三鑫科技发展有限公司/上海工业经济管理进修学院', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 2235,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 1117.5,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1117.5,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501767613E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '制造工艺和测试平台', ' ', NULL,
    '高斯路497号', '上海华虹（集团）有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501778005G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '设计实训平台', ' ', NULL,
    '宜山路333号汇鑫国际大厦1号楼1706室', '上海硅知识产权交易中心', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501778005G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '鉴定中心', ' ', NULL,
    '张江碧波路500号', '行业协会', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501778005G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '光刻、离子注入与工艺可靠性测试实训基地建设', ' ', NULL,
    '高斯路497号', '上海集成电路研发中心有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 5869.57,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2934.785,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    2748.830024,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    5683.615024,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501778005G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '芯片电路布局、接口测试与应用验证实训及云平台建设', ' ', NULL,
    '宜山路333号', '上海市硅知识产权交易中心有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 223.2,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 111.6,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    111.6,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    223.2,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501778005G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '焊接机器人系统调试实训中心', ' ', NULL,
    '思义路1518号', '上海新时达电气股份有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 282.94,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 141.47,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    100.36,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    241.83,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000425010765H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '四建集团实训基地设施设备建设', ' ', NULL,
    '灵石路697-3号3号楼610室（原申报海防路429弄100号）', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '现场专业工程师（测量）继续教育', ' ', NULL,
    '灵石路697-3号3号楼610室（原申报龙吴路188号）', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '一建集团实训基地设施设备建设', ' ', NULL,
    '逸仙路520号（原申报上南路4960号/中山北一路800号）', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建筑材料、力学实训基地', ' ', NULL,
    '漠河路800号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '塔机操控技能培训虚拟仿真系统', ' ', NULL,
    '宝祁路818号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '管道工高级', ' ', NULL,
    '同煌路26号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高级工程安装钳工调试设备', ' ', NULL,
    '同煌路26号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建筑工程类电焊工技师继续教育', ' ', NULL,
    '同煌路26号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '起重机驾驶员实训设施设备购置', ' ', NULL,
    '嘉定区南翔镇顺达路615号', '上海安装工程职业技术培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 136.49,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 68.245,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2017-01-01', 'YYYY-MM-DD'),
    67.055,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    135.3,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '预制混凝土构建装配施工（PC）实训设施设备添置', ' ', NULL,
    '河间路2号，民星路162号', '上海建工二建集团培训中心', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 800,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 400,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    283.74,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    683.74,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '超高层模架应用技能培训', ' ', NULL,
    '盘古路715弄', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 745.6,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 372.8,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    206.275,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    579.075,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建筑信息模型（超高层BIM）应用技能培训', ' ', NULL,
    '逸仙路520号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 516,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 258,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    252,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    510,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '机电工程系统调试工技能培训', ' ', NULL,
    '高跃路28号', '上海市安装工程集团有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 520,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 260,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    112.5973,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    372.5973,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建筑施工现场从业人员安全技能培训与鉴定设施设备项目', ' ', NULL,
    '武夷路150号', '上海建工集团股份有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 400,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 200,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    198.89,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    398.89,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建筑物的智能运营维护及虚拟维修技能培训', ' ', NULL,
    '延长中路540号5幢2楼', '上海建四实业有限公司', NULL,
    '6', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 332.5,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), 166.25,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    149.7111,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    315.9611,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '苗木机械操作职业技能培训考核配套设施项目', ' ', NULL,
    '青浦区赵巷镇中步村上海园林集团青浦苗木基地', '上海园林（集团）有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 948.7,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 474.35,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    367.620446,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    841.970446,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000631189305E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高技能人才培养基地资助项目', ' ', NULL,
    '郭守敬路498号
亮秀路11号', '上海市浦东软件园职业技能培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), 165.46,
    TO_DATE('2013-01-01', 'YYYY-MM-DD'), 82.73,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), TO_DATE('2014-01-01', 'YYYY-MM-DD'),
    82.7022,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    165.4322,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322000201';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '2017年上海浦东软件园高技能人才培养基地资助项目', ' ', NULL,
    '浦东新区郭守敬路498号1号楼', '上海市浦东软件园股份有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 188.3096,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 94.155,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    65.858575,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    160.013575,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322000201';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '移动应用开发技术平台', ' ', NULL,
    '鹤望路601号3号306室', '上海智翔信息科技发展有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501768034Q';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '软件开发质量控制实训设施设备添置', ' ', NULL,
    '江场西路299弄4号楼1205室', '行业协会', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501768034Q';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '嵌入式软件测试', ' ', NULL,
    '徐汇区宜山路700号2号楼8楼、13楼', '上海海隆软件有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 273.94,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 136.97,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    135.9678,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    272.9378,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501768034Q';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '移动App测试（专项职业能力）', ' ', NULL,
    '云南北路59号15楼', '上海博为峰软件技术股份有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 105.28,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 52.64,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    45.058408,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    97.698408,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501768034Q';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '大型港口装卸机械操作模拟器更新及改造项目', ' ', NULL,
    '友林路55号', '上海港教育培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), 615,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), 492,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2014-01-01', 'YYYY-MM-DD'),
    114.3,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    606.3,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322075806';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电控系统实训平台：申请资助2572.2万', ' ', NULL,
    '闵行区龙吴路4100号/宝山区逸仙路4177号/ 宝山区川念路888号/浦东新区港建路999号/浦东新区杨高北一路88号/ 浦东新区芦潮港镇同汇路1号/ 浦东新区港华路1299号/ 浦东新区港建路1号/ 浦东新区友林路55号', '上海港教育培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322075806';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '液压系统实训平台：申请资助181.6万', ' ', NULL,
    NULL, '上海港教育培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322075806';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '流机实训操作平台：申请资助245.8万', ' ', NULL,
    NULL, '上海港教育培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322075806';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '港口装载机械维修技能实训项目', ' ', NULL,
    '浦东大道2598号', '上海国际港务（集团）股份有限公司', NULL,
    '6', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 190.42,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 95.21,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    84.61,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    179.82,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322075806';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '导弹总体装配工类实训设施设备', ' ', NULL,
    '贵德路1号', '上海航天局', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '惯性器件装配工类实训设施设备', ' ', NULL,
    '宜山路710号（经2019年中期评估实地踏勘后发现基地方地址变更为闵行区中春路1555号，未经变更）', '上海航天局', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '卫星总体装配工类实训设施设备', ' ', NULL,
    '华宁路251号', '上海航天局', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '硅太阳电池方阵组合工类实训设施设备', ' ', NULL,
    '东川路2965号', '上海航天局', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '火箭总体装配工类实训设施设备', ' ', NULL,
    '华宁路100号', '上海航天局', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '实训设施设备资助项目', ' ', NULL,
    '金都路3805号', '上海航天教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '无线电装调实训项目', ' ', NULL,
    '华宁路100号', '上海航天设备制造总厂', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '车铣复合加工中心实训项目', ' ', NULL,
    '华宁路100号', '上海航天设备制造总厂', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞行器精密机构装配与调试实训', ' ', NULL,
    '华宁路100号', '上海航天设备制造总厂', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '通用机械加工实训', ' ', NULL,
    '召楼路3392号', '上海新力机器厂', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '空间飞行器锂电子电源生产装配测试实训项目', ' ', NULL,
    '东川路2965号', '上海空间电源研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天金属材料无损探伤实训项目', ' ', NULL,
    '贵德路1号', '上海航天精密机械研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数控仿真加工模拟实训项目', ' ', NULL,
    '贵德路1号', '上海航天精密机械研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '有色金属和特殊材料铸造实训项目', ' ', NULL,
    '贵德路1号', '上海航天精密机械研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高可靠航天电子产品装联实训项目', ' ', NULL,
    '中春路1777号', '上海航天电子通讯设备研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '卫星空间环模真空试验实训项目', ' ', NULL,
    '华宁路251号', '上海卫星装备研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '多媒体教学系统及教室改造项目', ' ', NULL,
    '金都路3805号', '上海航天教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞行控制系统伺服机构装调实训项目', ' ', NULL,
    '宜山路710号（经2019年中期评估实地踏勘后发现基地方地址变更为闵行区中春路1555号，未经变更）', '上海航天控制技术研究所', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海市便携式防空导弹武器系统操作', ' ', NULL,
    '中春路1555号', '上海航天控制技术研究所', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '精确打击导弹寻的系统调试与测试', ' ', NULL,
    '黎平路203号（经2019年中期评估实地踏勘后发现基地方地址变更为闵行区中春路1555号，未经变更）', '上海无线电设备研究所', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天精密微特电机装配与调试技术技能实训', ' ', NULL,
    '召楼路3286号', '上海航天有限电厂', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天电子产品系统级封装与微组装实训设施设备', ' ', NULL,
    '中春路1777号', '上海航天电子通讯设备研究所', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '特种焊接（搅拌摩擦焊）技能实训项目', ' ', NULL,
    '华宁路100号', '上海航天设备制造总厂', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天产品强度环境试验实训项目', ' ', NULL,
    '贵德路1号', '上海航天精密机械研究所', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天产品铆接装配实训项目', ' ', NULL,
    '贵德路1号', '上海航天精密机械研究所', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天产品精密测量实训项目', ' ', NULL,
    '贵德路1号', '上海航天精密机械研究所', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天产品大型部件精密加工', ' ', NULL,
    '召楼路3392号', '上海新力机器厂', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航天液压系统机电液气联调工', ' ', NULL,
    '召楼路3392号', '上海新力机器厂', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '整星及单机电磁辐射及抗干扰性能测试', ' ', NULL,
    '华宁路251号', '上海卫星装备研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '导弹发动机燃烧室壳体真空热处理及检验实训', ' ', NULL,
    '中春路1777号', '上海新力动力设备研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '精密激光加工技能实训', ' ', NULL,
    '贵德路1号', '上海航天精密研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '空间飞行器运输系统装调技能实训', ' ', NULL,
    '华宁路100号', '上海航天设备制造总厂', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '红外晶体复杂型面光学超精密加工技能实训', ' ', NULL,
    '中春路1555号', '上海新跃仪表厂', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '导弹武器制导雷达系统调试与测试技能实训', ' ', NULL,
    '中春路1777号', '上海航天电子通讯设备研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '空间用储能电池装配技能实训', ' ', NULL,
    '东川路2965号', '上海空间电源研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '复杂战场环境导弹目标探测与电子对抗试验工实训', ' ', NULL,
    '杨浦区闸殷路365号（经2019年中期评估实地踏勘后发现基地方地址变更为闵行区中春路1555号，未经变更）', '上海无线电设备研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '柔性制造精密集成装配实训', ' ', NULL,
    '贵德路76号', '上海航天精密研究所', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 840,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 420,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    420,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    840,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新能源电池控制设备制造技能实训', ' ', NULL,
    '东川路2965号', '上海空间电源研究所', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1087.1,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 543.55,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    543.55,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1087.1,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '有色金属材料热表处理技能实训', ' ', NULL,
    '华宁路100号', '上海航天设备制造总厂', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1050,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 525,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    525,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1050,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数控机床装调维修工实训', ' ', NULL,
    '召楼路3392号', '新力机器厂', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1594,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 797,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    780.9614,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1577.9614,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '绝热材料制造、应用及集成技能实训', ' ', NULL,
    '华宁路251号', '上海卫星装备研究所', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 903.42,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 451.71,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    451.71,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    903.42,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电缆智能制造实训', ' ', NULL,
    '中春路1555号', '上海新跃仪表厂', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 677.6,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 338.8,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    338.8,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    677.6,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12100000132259989H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '大型钢结构智能制造工业4.0高技能教学培训项目', ' ', NULL,
    '凤滨路666号', '上海振华重工（集团）股份有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 2400,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 1200,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    1096.47,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2296.47,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000607206953D';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '隧道工（盾构推进）技能培训项目', ' ', NULL,
    '北吴路788号', '上海隧道工程股份有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 984.03,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 492.015,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    492.015,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    984.03,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310104398689820Y';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '客运汽车驾驶员实训设施', ' ', NULL,
    '名府路90号', '上海强生控股股份有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 502.14,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 251.07,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    250.07,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    501.14,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310106332591652K';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '《道路客运驾驶员》【公交】五级', ' ', NULL,
    '共祥路18号', '上海巴士公交集团驾驶员培训有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 689.496,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 344.75,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    343.546,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    688.296,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006855284564';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新能源公交车维修工高级培训', ' ', NULL,
    '共祥路18号', '上海巴士公交集团驾驶员培训有限公司', NULL,
    '6', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 155.5,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 77.75,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    74.25,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    152,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006855284564';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '室内环境空气治理', ' ', NULL,
    '浦江镇三鲁公路2121号', '上海悦心健康集团股份有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 200,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 100,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    68.06,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    168.06,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501780092E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '《洁净室检测》专项职业能力', ' ', NULL,
    '朱泾镇工业园区中达路889号', '上海飞域实验室设备有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 120.23,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 60.115,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    59.62,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    119.735,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501780092E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '《横机织造》实训设施设备', ' ', NULL,
    '长寿路652号', '上海时尚之都教育培训有限公司', NULL,
    '6', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 41.4,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), 20.7,
    TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'),
    16.041769,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    36.741769,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322319278';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高技能人才培养基地资助项目', ' ', NULL,
    '国定路335号', '上海杨浦科技创业中心有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), 300,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), 150,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2014-01-01', 'YYYY-MM-DD'),
    150,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    300,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310110703282972L';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高端影视后期制作技术专业实训室设备添置', ' ', NULL,
    '国定路335号', '上海杨浦科技创业中心有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310110703282972L';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '移动开发技术专业实训室设备添置', ' ', NULL,
    '国定路335号', '上海杨浦科技创业中心有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310110703282972L';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建筑物清洁保养工中级实训设备购置', ' ', NULL,
    '茅台路298号6楼', '上海市物业管理行业协会', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501775795U';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '物业技防监控专项能力实训设备购置', ' ', NULL,
    '威宁路432号2楼', '上海市物业管理行业协会', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501775795U';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '水电工中级实训设备购置', ' ', NULL,
    '茅台路298号7楼', '上海市物业管理行业协会', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501775795U';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智能楼宇管理员（三级）', ' ', NULL,
    '长阳路1687号东1182幢D楼D103', '上海智能消防学校', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 59.4866,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 29.745,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    25.10179,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    54.84679,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501775795U';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '印刷媒体技术项目实训设备添置', ' ', NULL,
    '水丰路100号/浦东周浦新校区实训大楼', '上海出版印刷高等专科学校', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 893,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 446.5,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    289.78,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    736.28,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12310000425001703R';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '印刷媒体技术实训项目', ' ', NULL,
    '水丰路100号实训中心大楼一楼、二楼', '上海出版印刷高等专科学校', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 845,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 422.5,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    418.12,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    840.62,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12310000425001703R';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '印刷媒体技术实训设施设备经费资助', ' ', NULL,
    '水丰路100号', '上海出版印刷高等专科学校', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 668,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 334,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    317.87,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    651.87,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12310000425001703R';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '印刷、影视、数字传媒实训设施设备经费资助', ' ', NULL,
    '水丰路100号', '上海出版印刷高等专科学校', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 991,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 495.5,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    483.409109,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    978.909109,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12310000425001703R';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数码印刷、印前、印后实训设施设备经费资助', ' ', NULL,
    '水丰路100号', '上海出版印刷高等专科学校', NULL,
    '6', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 914.2,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 457.1,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    -150.1,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    307,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '12310000425001703R';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '农业机械实训中心建设', ' ', NULL,
    '张米公路1500号', '上海宏烨农机专业合作社', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 195.025,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 97.5125,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    97.3475,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    194.86,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '123100004250102041';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '汽车技术实训基地', ' ', NULL,
    '同嘉路79号
两港大道2999号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '制造技术实训基地', ' ', NULL,
    '同嘉路79号
两港大道2999号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '生产营销实训基地', ' ', NULL,
    '同嘉路79号
两港大道2999号（经2019年中期评估实地踏勘后发现基地方地址变更为大柏树基地，未经变更）', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上汽集团高技能人才培养基地（乘用车）', ' ', NULL,
    '同嘉路79号、安研路201号、两港大道2999号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上汽集团高技能人才培养基地（培训中心）', ' ', NULL,
    '同嘉路79号、安研路201号、两港大道2999号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '临港实训基地建设', ' ', NULL,
    '两港大道2999号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '同嘉路实训基地建设', ' ', NULL,
    '同嘉路79号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '第四期上汽集团高技能人才培养基地建设项目', ' ', NULL,
    '逸仙路50号', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 6580.16382,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 3290.08191,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    1565.218301,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    4855.300211,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '虚拟现实仿真中心项目', ' ', NULL,
    '柳州路399号', '延锋汽车饰件系统有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 800,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 400,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    329.605641,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    729.605641,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新能源智能网联汽车实训室', ' ', NULL,
    '同嘉路79号4号楼102室', '上海汽车集团股份有限公司培训中心', NULL,
    '6', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 676.1,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), 338.05,
    TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'),
    318.8,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    656.85,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132260250X';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '管道工实训教室', ' ', NULL,
    '虹口区车站南路261号', '上海煤气第一管线工程
有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017676481';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '燃气调压器实训', ' ', NULL,
    '虹口区车站南路261号', '上海煤气第一管线工程
有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017676481';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '燃气具安装维修工', ' ', NULL,
    '虹口区车站南路261号', '上海煤气第一管线工程
有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017676481';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '管道工实训设备', ' ', NULL,
    '虹口区车站南路261号', '上海煤气第一管线工程
有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017676481';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海石化员工学习室', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '动态流程模拟仿真培训系统建设', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '动态模拟仿真培训系统建设', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '化工分析实训基地建设', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '炼化仪表实训基地改造', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '炼化设备实训基地改造', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '变电运行实训基地改造', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    'HSE实训基地建设', ' ', NULL,
    '龙胜路909号', '中国石化上海石油化工股份有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132212291W';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市光网FTTH装维及信息网络布线实训室', ' ', NULL,
    '天宝路879号（原申报大连路1515号）', '中国电信股份有限公司上海分公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310115671143758E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '中国电信上海公司实训基地（二期）', ' ', NULL,
    NULL, '中国电信股份有限公司上海分公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310115671143758E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海移动通信实训室', ' ', NULL,
    '沪宜公路1101号（原申报天宝路891号）', '中国电信股份有限公司上海分公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), 123.4,
    TO_DATE('2013-01-01', 'YYYY-MM-DD'), 61.7,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2016-01-01', 'YYYY-MM-DD'),
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    61.7,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310115671143758E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '生物医药实训平台项目', ' ', NULL,
    '沈家弄路700号', '上海市医药学校', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131000013454082XB';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '药物分析模拟实训平台建设项目', ' ', NULL,
    '飞虹路525号', '上海医药职工大学', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131000013454082XB';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '抗体药物张江实训平台实训设备购置', ' ', NULL,
    '哈雷路898号', '上海市医药学校', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 2887.52,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 1443.76,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    1305.826,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2749.586,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131000013454082XB';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '医药微生物检验实训平台', ' ', NULL,
    '浦东新区沈家弄路700号', '上海市医药学校', NULL,
    '6', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 255.8,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), 127.9,
    TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'),
    121.098,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    248.998,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131000013454082XB';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '机房建设', ' ', NULL,
    '徐汇区钦州南路81号', '上海新闻出版职业技术学校', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 44.2063,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 22.10315,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2017-01-01', 'YYYY-MM-DD'),
    22.10315,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    44.2063,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '123100004250970714';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '出版印刷发行VR实训室', ' ', NULL,
    '徐汇区钦州南路81号', '上海新闻出版职业技术学校', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 200,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 100,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    99.54,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    199.54,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '123100004250970714';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '利用MD82飞机平台开展培训项目', ' ', NULL,
    '上飞路919号
场中路3115号', '上海飞机制造有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), 2690,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), 1345,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2014-01-01', 'YYYY-MM-DD'),
    1345,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2690,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机机体结构部件装配实训设备添置', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机机械系统安装调试实训设备添置', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机电子电气系统安装调试实训设备添置', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机装配型架及工装制造实训设备添置', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机喷漆及表面修复实训设备添置', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机复合材料成型及修复实训设备添置', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '实训设施设备添置', ' ', NULL,
    '江川东路100号', '中国商飞上海飞机客户服务客服有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 778,
    NULL, 389,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    363.84306,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    752.84306,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机试飞保障机务实训中心', ' ', NULL,
    '金闻路108号', '中国商飞民用飞机试飞中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民机试飞测试技能实训中心', ' ', NULL,
    '金闻路108号', '中国商飞民用飞机试飞中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民机运行支持高技能人才实训中心子项目-民用飞机结构修理实训设备设施', ' ', NULL,
    '江川东路100号', '中国商飞上海飞机客户服务客服有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民机运行支持高技能人才实训中心子项目-技术插图绘制员', ' ', NULL,
    '江川东路100号', '中国商飞上海飞机客户服务客服有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民机运行支持高技能人才实训中心子项目-航空高技能人才安全实训基地', ' ', NULL,
    '江川东路101号', '中国商飞上海飞机客户服务客服有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机机体结构及系统装配调试技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机零部件先进制造工艺技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机工艺装备制造技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机复合材料制造工艺技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机喷漆及表面修复工艺技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机数字化制造及装配工艺培训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机测试设备检测及维护技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机工艺设备维修改装技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民用飞机现代化生产物流仓储技能实训', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民机实训项目（包括民机结构及系统装配调试技能实训、民机零部件制造技能实训、民机喷涂及表面修复、民机材料及产品检测）', ' ', NULL,
    '上飞路919号
场中路3115号', '中国商飞上海飞机制造有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 928.17,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 464.09,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    110.54,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    574.63,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL0LX06';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '加工中心操作调整工（三级）', ' ', NULL,
    '鸿音路77号', '上海中航商用航空发动机制造有限责任公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 724.5,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 362.25,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    362.25,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    724.5,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310115586753076F';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '增材制造操作工', ' ', NULL,
    '鸿音路77号', '上海中航商用航空发动机制造有限责任公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 581.24,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 290.62,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    290.62,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    581.24,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310115586753076F';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航空发动机装配修理钳工、装配检验工及平衡工', ' ', NULL,
    '鸿音路77号', '上海中航商用航空发动机制造有限责任公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 567,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 283.5,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    204.15,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    487.65,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310115586753076F';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '飞机驾驶人机功效分析与交互训练平台', ' ', NULL,
    '北青公路8228号', '上海东方飞行培训有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 497.03,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 248.515,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2017-01-01', 'YYYY-MM-DD'),
    210.365,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    458.88,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL4B24G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '民航乘务类实训设施设备', ' ', NULL,
    '北青公路8228号', '中国东方航空股份有限公司培训中心', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL4B24G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航安员实训设施设备', ' ', NULL,
    '北青公路8228号', '中国东方航空股份有限公司培训中心', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL4B24G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航空安全员室内体技能训练场设施设备项目', ' ', NULL,
    '北青公路8228号', '中国东方航空股份有限公司培训中心', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 487.3,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 243.65,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2017-01-01', 'YYYY-MM-DD'),
    240.016,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    483.666,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL4B24G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '呼叫服务员实训考评设施设备经费资助项目', ' ', NULL,
    '上海浦东国际机场机场大道66号', '中国东方航空股份有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 981.1,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 490.55,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    445.891425,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    936.441425,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000MA1FL4B24G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新型装卸搬运人才培养实训项目（冷链方向）', ' ', NULL,
    '闵行区莲花南路3000号', '上海郑明国际物流有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 837.09,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 418.54,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    418.55,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    837.09,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501773693H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智慧化高位叉车设备操作高技能人才培训实训项目', ' ', NULL,
    '浦卫公路3199号', '招商局物流集团上海奉贤有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 414.4,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 207.2,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    200.8,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    408,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501773693H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '粉末冶金压烧专项职业能力', ' ', NULL,
    '宝山工业园区罗东路1299号', '上海汽车粉末冶金有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1888.96,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 944.48,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    777.26,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1721.74,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501777969Y';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '纳米浆料配制专项职业能力', ' ', NULL,
    '舜工路38号', '上海华明高技术（集团）有限公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 378,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 189,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    0,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    189,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501777969Y';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '汽车超净化复合材料实训项目建设', ' ', NULL,
    '嘉松北路1388号', '上海金智达复合材料有限公司', NULL,
    '6', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 2668,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), 1334,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'),
    1317.327,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2651.327,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '51310000501777969Y';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '优化江南船舶制造实训中心的设备配置', ' ', NULL,
    '江南大道988号', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建设150㎡机械装调技术实训室', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建设150㎡起重驾驶仿真实训室', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数字化仿真实训中心（楼）建设（经天马成2018年中期评估核实，该项目取消）', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数字化仿真实训中心数据中心机房建设（经天马成2018年中期评估核实，该项目取消）', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数字化仿真实训中心综合布线（经天马成2018年中期评估核实，该项目取消）', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '教学资源管理平台搭建', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '教学资源管理平台搭建（经天马成2018年中期评估核实，该项目更名为大型虚拟现实仿真实训公共平台）', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '船舶电气安装与调试全真与仿真实训室建设（经天马成2018年中期评估核实，该项目取消）', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '现代大型低速船舶柴油机虚拟仿真实训室', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '船舶管系加工与安装虚拟仿真实训室建设', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '安全技术培训考核室建设', ' ', NULL,
    '江南大道988号', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '安全生产教育培训基地建设', ' ', NULL,
    '江南大道988号', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '维修电工实训室建设', ' ', NULL,
    '保定路22号', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '起重驾驶模拟实训室建设', ' ', NULL,
    '潘园公路447号甲', '江南造船（集团）职业技术学校', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高空作业车高技能人才培训虚拟现实考核中心建设', ' ', NULL,
    '保定路22号', '江南造船（集团）有限责任公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '液压与气动实训室建设', ' ', NULL,
    '江南大道988号', '江南造船（集团）有限责任公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '船舶主辅机教学软件开发', ' ', NULL,
    '潘圆公路447号甲', '江南造船（集团）有限责任公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '精度管理实训室能级提升', ' ', NULL,
    '江南大道988号', '江南造船（集团）有限责任公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '工业机器人焊接应用实训室建设', ' ', NULL,
    '保定路22号', '江南造船（集团）有限责任公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '高技能人才培养实训设施设备项目：
（1）数字化仿真实训中心优化升级
（2）高技能人才培养基地设备添置
（3）船舶制造开放实训中心优化升级', ' ', NULL,
    '潘圆公路447号甲', '江南造船（集团）有限责任公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 2565.4,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1282.7,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    734.5245,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2017.2245,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数控加工实训工场', ' ', NULL,
    '江南大道988号', '江南造船集团职业技术培训学校', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2341.08,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1170.54,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'),
    1157.185,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2327.725,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '3D打印实训室', ' ', NULL,
    '江南大道988号', '江南造船集团职业技术培训学校', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 414.5,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 207.25,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    167.95,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    375.2,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322043124';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '船舶电工实训室', ' ', NULL,
    '东高路15号', '沪东中华造船集团高级技校实训基地', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), 300,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), 150,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'),
    150,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    300,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131000070326335X7';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '现代制造技术实训项目一期', ' ', NULL,
    '浦东新区飞渡路55号8幢', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '金加工实训项目一期（经2019年中期评估后，项目名称为上海电机学院实训基地项目）', ' ', NULL,
    '浦东新区橄榄路1350号', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '维修电工实训项目一期（经2019年中期评估后，项目名称为上海临港科技学校实训基地项目）', ' ', NULL,
    '浦东新区方竹路1600号', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '焊接实训项目（经2019年中期评估后，项目名称为上海浦东新区云凌职业技术培训学校电焊工实训项目）', ' ', NULL,
    '浦东新区飞渡路55号9号厂房', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数字设计实训项目一期（经2019年中期评估后，项目名称为上海浦东新区云凌职业技术培训学校水电工实训项目）', ' ', NULL,
    '浦东新区飞渡路55号8幢', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '航空发动机实训项目', ' ', NULL,
    '层林路1500号6号厂房', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '现代高端装备制造实训', ' ', NULL,
    '飞渡路55号8幢', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '临港再制造（汽车零部件）实训项目', ' ', NULL,
    '飞渡路55号9幢', '上海临港人才有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '临港园区智能物流实训项目', ' ', NULL,
    '捷畅路301号', '上海临港经济发展（集团）有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 6633.466,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 5765,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    2993.9044,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    8758.9044,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智能化应用工业机器人(焊接）', ' ', NULL,
    '新杨公路1565号7幢', '上海临港经济发展（集团）有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 2570,
    NULL, NULL,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    1278.7,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1278.7,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '3D打印技术及应用实训项目', ' ', NULL,
    '莘砖公路518号13幢201室', '上海临港经济发展（集团）有限公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 2326.534,
    NULL, NULL,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    1161.733,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1161.733,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '临港智能制造实训基地项目', ' ', NULL,
    '飞渡路66号1幢＋4幢', '上海临港经济发展（集团）有限公司', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 5938.9472,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 2969.475,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    2965.323,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    5934.798,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海临港先进光学薄膜制造实训项目', ' ', NULL,
    '飞渡路55号幢号8厂房', '上海临港经济发展（集团）有限公司', NULL,
    '6', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 4096.07,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 2048.04,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    2044.405,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    4092.445,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新能源光伏器件制造及应用实训项目', ' ', NULL,
    '召楼路3286号厂区2号楼1层', '上海市漕河泾新兴技术开发区发展总公司', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 3205,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1602.5,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    1088.132448,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2690.632448,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100007547623351';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '海上风电全周期链施工技能实训项目', ' ', NULL,
    '沪南路2618号', '中交第三航务工程局有限公司培训中心', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1309.49,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 654.745,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'),
    646.43,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1301.175,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310104132660027E';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '船舶电气测试模拟教学系统投资项目', ' ', NULL,
    '洲海路3001号', '上海外高桥造船有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913101156314236324';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '焊接培训工场扩建和焊接设备投资项目', ' ', NULL,
    '洲海路3001号', '上海外高桥造船有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913101156314236324';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    'HSE体验馆建设方案投资项目', ' ', NULL,
    '洲海路3001号', '上海外高桥造船有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913101156314236324';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '多媒体教室系统投资项目', ' ', NULL,
    '洲海路3001号', '上海外高桥造船有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913101156314236324';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '供水水质检验工实训基地', ' ', NULL,
    '许昌路230号
杨树浦路841号', '上海城市水资源开发利用国家工程中心有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '原水机泵运行高技能人才实训基地', ' ', NULL,
    '北艾路1540号', '上海城投原水有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市污水厂污泥处理工实训基地', ' ', NULL,
    '长阳路2866号
煤水路100号', '上海城投污水处理有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '环卫船舶驾驶员船舶轮机员实训基地', ' ', NULL,
    '谈家渡路69号
徐梅路7弄55号', '上海环境实业有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '净水工实训基地', ' ', NULL,
    '杨树浦路670号', '上海城市水资源开发利用国家工程中心有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '固体废物处理工实训基地', ' ', NULL,
    '南滨公路2088弄288号', '上海市固体废物处置中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '供排水机泵操作人员实训基地', ' ', NULL,
    '耀华支路140号', '上海市城市排水有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '固体废物处理工实训基地（二期）', ' ', NULL,
    '南滨公路2088弄288号', '上海市固体废物处置中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '环卫船舶驾驶员和船舶轮机员实训基地（二期）', ' ', NULL,
    '谈家渡路69号
徐梅路7弄55号', '上海环境实业有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市污水厂污泥处理工实训基地（二期）', ' ', NULL,
    '长阳路2866号
煤水路100号', '上海城投污水处理有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '净水工实训基地（二期）', ' ', NULL,
    '杨树浦路670号', '上海城市水资源开发利用国家工程中心有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '供排水泵操作人员实训基地（二期）', ' ', NULL,
    '耀华支路140号', '上海市城市排水有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '供水水质检验工实训基地（二期）', ' ', NULL,
    '许昌路230号
杨树浦路841号', '上海城市水资源开发利用国家工程中心有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '防汛排水泵站综合实操训练项目', ' ', NULL,
    '杨树浦路851号
沪太支路396号
高平路1099号', '上海市城市排水有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '污水处理工实训项目', ' ', NULL,
    '长阳路2866号', '上海城投污水处理有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '供水调度员实训基地', ' ', NULL,
    '前云路85弄99号', '上海市自来水市南有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132211037N';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '安全防范技术鉴定实训设施设备', ' ', NULL,
    '岳阳路76号小红楼', '公安部第三研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017785741';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电子数据鉴定实训设施设备', ' ', NULL,
    '岳阳路76号4号楼4层，5号楼1层', '公安部第三研究所', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017785741';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '移动应用安全检测鉴定实训室项目', ' ', NULL,
    '岳阳路76号小红楼', '公安部第三研究所', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1350,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 675,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    672.51,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1347.51,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017785741';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '工业控制系统信息安全防护', ' ', NULL,
    '陆家浜路1308号', '上海市信息安全测评认证中心', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 2000,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1000,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'),
    988.7683,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1988.7683,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017785741';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海邮政高技能人才培养基地综合建设项目', ' ', NULL,
    '逸仙路3777号', '上海市邮政公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), 238.8,
    TO_DATE('2013-01-01', 'YYYY-MM-DD'), 119.4,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'),
    117.7,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    237.1,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131010933260509XE';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '远程教育实训室', ' ', NULL,
    '逸仙路3777号', '中国邮政集团公司上海市分公司', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 205.1228,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 102.5614,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    94.6672,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    197.2286,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131010933260509XE';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电力仿真设备建设', ' ', NULL,
    '文井路1号', '上海电力股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电力检修实训设备建设', ' ', NULL,
    '文井路1号', '上海上电电力工程有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '大型发电站热工自动化控制实训平台', ' ', NULL,
    '文井路1号', '上海明华电力技术工程有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新能源风电运维实训设备', ' ', NULL,
    '文井路1号', '上海电力股份有限公司', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '燃料采制化实训基地建设', ' ', NULL,
    '丽江路2号', '上海电力股份有限公司技能培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电力检修实训设备建设', ' ', NULL,
    '文井路1号', '上海上电电力工程有限公司', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海电力综合检修实训基地建设', ' ', NULL,
    '丽江路2号', '上海电力股份有限公司技能培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 416,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 208,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    145.19915,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    353.19915,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100005587756227';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '化工实训设施提升完善项目', ' ', NULL,
    '真南路1008号', '上海化工高级技术工人培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132262168G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '化工实训设施追加项目', ' ', NULL,
    '真南路1008号', '上海化工高级技术工人培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132262168G';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '车床、气液电控制实验装置项目', ' ', NULL,
    '浦东大道2748号
华宁路121号
江川路555号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '实训、鉴定设备和实训教学设施项目', ' ', NULL,
    '浦东大道2748号
江川路555号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '数控数字化加工岛实训中心', ' ', NULL,
    '浦东大道2748号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '工业机器人实训中心', ' ', NULL,
    '浦东大道2748号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '精益生产模拟实训中心', ' ', NULL,
    '浦东大道2748号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建设远程教育培训网络系统', ' ', NULL,
    '浦东大道2748号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '建设企业特有工种实训基地', ' ', NULL,
    '浦东大道2748号
华宁路250号
华宁路190号
江川路555号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '燃气轮机部件加工数控实训设备购置', ' ', NULL,
    '江川路333号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '核级焊接实训设备购置', ' ', NULL,
    '层林路77号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '大型铸锻件热加工实训设备购置', ' ', NULL,
    '江川路1800号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '上海电气安全体感基地', ' ', NULL,
    '江川路333号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 463.24,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), 0,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), TO_DATE('2016-01-01', 'YYYY-MM-DD'),
    454.0299,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    454.0299,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '自动化系统装调运维工培训设施设备', ' ', NULL,
    '蒙自路360号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2017-01-01', 'YYYY-MM-DD'), 1489.2,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), 744.6,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    742.9,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1487.5,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智慧工厂实训系统', ' ', NULL,
    '浦东大道2748号', '上海电气（集团）总公司教育中心', NULL,
    '6', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 1141,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), 570.5,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    562.9,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1133.4,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电机智能制造实训项目', ' ', NULL,
    '闵行区江川路555号', '上海电气集团上海电机厂 有限公司', NULL,
    '6', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 1345.2,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), 672.6,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'),
    615.434,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1288.034,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '实训室设备添置', ' ', NULL,
    '宁桥路888号', '上海日立电器有限公司', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 299,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 149.5,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2016-01-01', 'YYYY-MM-DD'),
    145.33,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    294.83,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100001322128733';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '通信电源实训平台', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '传输系统实训平台', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电视监控示教板平台（经天马成2018年中期评估核实，该项目为自筹项目）', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '952#实训电动列车的购置及功能改造（经天马成2018年中期评估核实，该项目为自筹项目）', ' ', NULL,
    '祖冲之路100号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '实训用集成化电动列车车辆改造', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '车门试验台构建', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电动列车（庞巴迪车型）', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '列车排故培训仿真系统的研究（经天马成2018年中期评估核实，该项目为自筹项目）', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '实训基地CBTC信号系统基础建设（经天马成2018年中期评估核实，该项目为自筹项目）', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '952#实训列车的改造', ' ', NULL,
    '祖冲之路100号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电动列车牵引/制动系统半实物仿真培训平台建设', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    'ATS工作站培训操作平台建设', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    'CBTC信号系统维护操作演练培训平台的研发', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市轨道交通供电仿真实训系统开发', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '线路检测、维护培训设备购置', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '桥隧检监测、维护培训设备购置', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电动列车模拟驾驶器升级改造（经天马成2018年中期评估核实，该项目包含庞巴迪车型电动列车模拟器升级改造和西门子车型电动列车模拟器升级改造）', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '张江实训车站改造（经天马成2018年中期评估核实，该项目为自筹项目）', ' ', NULL,
    '祖冲之路100号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '磁浮大楼改造（经天马成2018年中期评估核实，该项目为自筹项目）', ' ', NULL,
    '龙阳路2520号', '上海轨道交通培训中心', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '运营岗位联合培训系统', ' ', NULL,
    '龙阳路2520号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 600,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 300,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2015-01-01', 'YYYY-MM-DD'),
    299.809,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    599.809,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '轨道交通无人驾驶综合岗位联动应急处置培训平台采购项目', ' ', NULL,
    '龙阳路2520号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 831.5,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 415.75,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    415.25,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    831,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市轨道交通自动售检票实训系统平台采购项目', ' ', NULL,
    '龙阳路2520号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 924.9,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 462.45,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2018-01-01', 'YYYY-MM-DD'),
    459.932,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    922.382,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '运营关键岗位应急处置培训及评价系统', ' ', NULL,
    '龙阳路2520号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 350.13,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 175.065,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    169.704,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    344.769,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市轨道交通供电系统多工中联动平台', ' ', NULL,
    '龙阳路2520号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 395.43,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 197.715,
    TO_DATE('2019-01-01', 'YYYY-MM-DD'), TO_DATE('2019-01-01', 'YYYY-MM-DD'),
    194.04,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    391.755,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城轨电动列车电气系统实训平台', ' ', NULL,
    '沪闵路1780号（剑川路实训基地）', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 503.2,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), 251.6,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'),
    251.528,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    503.128,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城市轨道交通车站运营人员技能实训平台', ' ', NULL,
    '顾戴路751号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 2519.07,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), 1259.54,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'),
    1245.0023,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    2504.5423,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '城轨多模冗余信号系统培训平台', ' ', NULL,
    '龙阳路2520号', '上海申通地铁集团有限公司轨道交通培训中心', NULL,
    '6', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 466.2,
    TO_DATE('2021-01-01', 'YYYY-MM-DD'), 233.1,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'),
    231.6,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    464.7,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '913100006317558649';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '变电站值班员', ' ', NULL,
    '平陆路601号310、311、307、308室', '上海市电力工程行业协会', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 261.56,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 130.78,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2017-01-01', 'YYYY-MM-DD'),
    130.106792,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    260.886792,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017820477';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电气试验员、继电保护员实训室', ' ', NULL,
    '平陆路601号', '上海市南变配电站服务有限公司', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 221.5,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 110.75,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    105.12,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    215.87,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '513100005017820477';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '智能制造技术应用与实操训练系统项目：
（1）智能制造技术综合训练模块；
（2）工业机器人技术应用与维护训练模块；
（3）机电液控制技术提高训练模块', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2016-01-01', 'YYYY-MM-DD'), 1261.8,
    TO_DATE('2016-01-01', 'YYYY-MM-DD'), 630.9,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-01', 'YYYY-MM-DD'),
    456.858619,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    1087.758619,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '模块化机电综合实训及工厂自动化控制培训系统', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '罗克韦尔工业自动化网络控制系统实训设备', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '仪表自动化实训改造与无线控制技术的应用', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '冶金生产仿真操作实训系统开发与应用', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2013-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '液压控制技术训练设备', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '电机运维技术训练设备', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '无损检测技术训练设备', ' ', NULL,
    '四元路19号', '宝钢集团人才开发院', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000132200821H';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '国网上海培训中心自动化实训室新建与改造', ' ', NULL,
    '闸殷路60弄50号综合楼的三楼', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '国网上海培训中心继电保护实训室新建与改造', ' ', NULL,
    '闸殷路60弄50号综合楼的二、三、四楼的部分场地', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新建国网上海培训中心电力电缆接头实训室', ' ', NULL,
    '华腾路969号实训场', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新建国网上海培训中心线缆仿真实训室', ' ', NULL,
    '华腾路969号华新基地', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '新建国网上海培训中心线缆运行实训室改造', ' ', NULL,
    '华腾路969号1号会议室', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '国网上海培训中心闸殷路营销10kV典型配电实训室扩建', ' ', NULL,
    '闸殷路60弄15号A楼一楼', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '国网上海培训中心闸殷路营销装表接电综合实训室扩建', ' ', NULL,
    '闸殷路60弄15号D楼', '国网上海市电力公司培训中心', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), NULL,
    NULL, NULL,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), NULL,
    NULL,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    NULL,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310101132224671B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '收银实训室', ' ', NULL,
    '民星路525号', '上海百联商贸进修学院', NULL,
    '6', TO_DATE('2012-01-01', 'YYYY-MM-DD'), 13.1,
    TO_DATE('2012-01-01', 'YYYY-MM-DD'), 6.55,
    TO_DATE('2015-01-01', 'YYYY-MM-DD'), TO_DATE('2014-01-01', 'YYYY-MM-DD'),
    6.55,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    13.1,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000749599465B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '商品陈列实训室设备添置', ' ', NULL,
    '民星路525号', '上海百联商贸进修学院', NULL,
    '6', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 45,
    TO_DATE('2014-01-01', 'YYYY-MM-DD'), 22.5,
    TO_DATE('2017-01-01', 'YYYY-MM-DD'), TO_DATE('2017-01-01', 'YYYY-MM-DD'),
    22.5,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    45,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000749599465B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '商场安全营业实训室', ' ', NULL,
    '民星路525号', '上海百联商贸进修学院', NULL,
    '6', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 148.3,
    TO_DATE('2018-01-01', 'YYYY-MM-DD'), 74.15,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    72.704,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    146.854,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310000749599465B';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '装配式混凝土构件安装实训设施设备资助项目', ' ', NULL,
    '横沙乡丰乐路48号', '中交上海航道局有限公司', NULL,
    '6', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 185.64,
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 92.82,
    TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'),
    87.16175,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    179.98175,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '9131010113222855X7';

INSERT INTO wsbs.RECRUIT_SITE_PROJECT (
    project_id, site_id, district_code, project_name, apply_direction,
    apply_direction_project_name, project_location, implement_unit, project_intro,
    project_status, approval_time, approval_amount, approval_grant_time,
    approval_grant_amount, acceptance_time, acceptance_grant_time,
    acceptance_grant_amount, performance_grant_time_1, performance_grant_amount_1,
    performance_grant_time_2, performance_grant_amount_2,
    performance_grant_time_3, performance_grant_amount_3, total_grant_amount,
    status, reviewer, review_time, review_opinion,
    created_by, created_at, updated_by, updated_at
)
SELECT
    wsbs.SEQ_0073_RECRUIT_SITE_PROJECT.NEXTVAL, s.site_id, s.district_code,
    '中冶宝钢新一代数字化钳工实训基地建设项目', ' ', NULL,
    '宝杨路2061号', '中冶宝钢技术服务有限公司', NULL,
    '6', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 592.08,
    TO_DATE('2022-01-01', 'YYYY-MM-DD'), 296.04,
    TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'),
    203.383866,
    NULL, NULL,
    NULL, NULL,
    NULL, NULL,
    499.423866,
    '已通过', NULL, NULL, NULL,
    'system', SYSDATE, NULL, NULL
FROM wsbs.RECRUIT_SITE_INFO s
WHERE s.tyshxym = '91310113133401086C';

COMMIT;
