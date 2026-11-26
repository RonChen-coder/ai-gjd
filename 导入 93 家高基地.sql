-- 导入 93 家高基地
-- 数据来源：【DS】高基地信息导入模板_93家.xls
-- 基地类别使用 RECRUIT_SITE_INFO_TYPE 字典值：
-- 1 企业（在沪央企）、2 企业（市属国企）、4 企业（其他）、
-- 5 院校（普通高校）、6 院校（职业院校）、8 行业协会、9 产业园区
-- Oracle 中空字符串等价于 NULL，因此 NOT NULL 空字段使用单空格占位；created_by 使用 system。
-- 本脚本为一次性导入，重复执行会触发 tyshxym 唯一约束。

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000MA1FL0LX06', '中国商用飞机有限责任公司', '中国商用飞机有限责任公司',
    '2011', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '9131000070326335X7', '沪东中华造船（集团）有限公司', '沪东中华造船（集团）有限公司',
    '2011', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310115671143758E', '中国电信股份有限公司上海分公司', '中国电信股份有限公司上海分公司',
    '2011', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913101156314236324', '上海外高桥造船有限公司', '上海外高桥造船有限公司',
    '2012', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310101132224671B', '国网上海市电力公司', '国网上海市电力公司',
    '2013', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310115586753076F', '中国航发上海商用航空发动机制造有限责任公司', '中国航发上海商用航空发动机制造有限责任公司',
    '2015', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000607206953D', '上海振华重工（集团）股份有限公司', '上海振华重工（集团）股份有限公司',
    '2016', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310104132660027E', '中交第三航务工程局有限公司', '中交第三航务工程局有限公司',
    '2017', '1', ' ',
    '310115', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001322075806', '上海国际港务（集团）股份有限公司', '上海国际港务（集团）股份有限公司',
    '2011', '2', ' ',
    '310115', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100007547623351', '上海临港经济发展（集团）有限公司', '上海临港经济发展（集团）有限公司',
    '2012', '2', ' ',
    '310115', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501778005G', '上海市集成电路行业协会', '上海市集成电路高技能人才培养基地（上海市集成电路行业协会）',
    '2014', '8', ' ',
    '310115', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501782151B', '上海市物联网行业协会', '上海市物联网技术高技能人才培养基地（上海市物联网行业协会）',
    '2014', '8', ' ',
    '310115', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501778523Q', '上海市生物医药行业协会', '上海市生物医药行业协会',
    '2019', '8', ' ',
    '310115', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001322000201', '上海浦东软件园', '上海浦东软件园股份有限公司',
    '2012', '9', ' ',
    '310115', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501770708P', '上海市餐饮烹饪行业协会', '上海市餐饮烹饪行业协会',
    '2016', '8', ' ',
    '310115', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017797881', '上海现代服务业联合会', '上海现代服务业联合会',
    '2020', '8', ' ',
    '310115', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000MA1FL7GD4X', '上海建桥学院', '上海建桥学院',
    '2020', '5', ' ',
    '310115', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310115685544464E', '上海浦东新区公共交通有限公司', '上海浦东新区公共交通有限公司',
    '2016', '4', ' ',
    '310115', '浦东新区国资委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913101157294675615', '上海张江生物医药基地开发有限公司', '上海张江生物医药基地开发有限公司',
    '2012', '9', ' ',
    '310115', '浦东新区国资委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017785741', '上海市信息安全行业协会', '上海市信息安全高技能人才培养基地（上海市信息安全行业协会）',
    '2014', '8', ' ',
    '310115', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '523100004251652819', '上海杉达学院', '上海杉达学院',
    '2025', '5', ' ',
    '310115', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '9131010113222855X7', '中交上海航道局有限公司', '中交上海航道局有限公司',
    '2020', '1', ' ',
    '310101', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001322128733', '上海电气控股集团有限公司', '上海电气控股集团有限公司',
    '2011', '2', ' ',
    '310101', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501768181A', '上海医药行业协会', '上海市医药产业高技能人才培养基地（上海医药行业协会）',
    '2015', '8', ' ',
    '310101', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501779083R', '上海宝玉石行业协会', '上海宝玉石行业协会',
    '2016', '8', ' ',
    '310101', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017698112', '上海中药行业协会', '上海中药行业协会',
    '2019', '8', ' ',
    '310101', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501769440B', '上海洗染业行业协会', '上海洗染业行业协会',
    '2015', '8', ' ',
    '310101', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501776413K', '上海医药商业行业协会', '上海医药商业行业协会',
    '2020', '8', ' ',
    '310101', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017786897', '上海市养老服务行业协会', '上海市养老服务行业协会',
    '2019', '8', ' ',
    '310101', '市民政局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501767912C', '上海市旅游行业协会', '上海市旅游行业协会',
    '2019', '8', ' ',
    '310101', '市文化旅游局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501773693H', '上海市物流协会', '上海市物流产业高技能人才培养基地（上海市物流协会）',
    '2015', '8', ' ',
    '310101', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501767613E', '上海市工业经济联合会', '上海市光电子技术高技能人才基地（上海市工业经济联合会）',
    '2014', '8', ' ',
    '310101', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017805198', '上海市健康产业发展促进协会', '上海市健康产业发展促进协会',
    '2018', '8', ' ',
    '310101', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501771508K', '上海市食品协会', '上海市食品协会',
    '2016', '8', ' ',
    '310104', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000MA1FL4B24G', '中国东方航空集团公司', '中国东方航空集团公司',
    '2012', '1', ' ',
    '310105', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000132284295X', '上海机场（集团）有限公司', '上海机场（集团）有限公司',
    '2015', '2', ' ',
    '310105', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001322319278', '东方国际（集团）有限公司', '东方国际（集团）有限公司',
    '2021', '2', ' ',
    '310105', '市国资委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501767605K', '上海市市容环境卫生行业协会', '上海市市容环境卫生行业协会',
    '2018', '8', ' ',
    '310105', '市绿化市容局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017740393', '上海市插花花艺协会', '上海市插花花艺协会',
    '2018', '8', ' ',
    '310105', '市绿化市容局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '5231000075187063XN', '上海市技师进修服务中心', '上海市技师进修服务中心',
    '2012', '8', ' ',
    '310105', '市人社局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '9131000076839377X5', '春秋航空股份有限公司', '春秋航空股份有限公司',
    '2018', '4', ' ',
    '310105', '长宁区人社局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100007732781007', '携程旅游网络技术（上海）有限公司', '携程旅游网络技术（上海）有限公司',
    '2019', '4', ' ',
    '310105', '长宁区人社局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310114561912739R', '上海百秋尚美科技服务集团股份有限公司', '上海百秋尚美科技服务集团股份有限公司',
    '2025', '4', ' ',
    '310105', '长宁区商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000132262168G', '上海华谊（集团）公司', '上海华谊（集团）公司',
    '2011', '2', ' ',
    '310106', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100006855284564', '上海久事公共交通集团有限公司', '上海久事公共交通集团有限公司',
    '2016', '2', ' ',
    '310106', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310106332591652K', '上海强生交通（集团）有限公司', '上海强生交通（集团）有限公司',
    '2015', '2', ' ',
    '310106', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501768034Q', '上海市软件行业协会', '上海市软件产业高技能人才培养基地（上海市软件行业协会）',
    '2014', '8', ' ',
    '310106', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501780092E', '上海市室内环境净化行业协会', '上海市室内环境净化高技能人才培养基地（上海市室内环境净化行业协会）',
    '2015', '8', ' ',
    '310106', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017820477', '上海市电力工程行业协会', '上海市电力工程行业协会',
    '2015', '8', ' ',
    '310106', '国家能源局华东监管局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001346996465', '上海市北高新（集团）有限公司', '上海市北高新（集团）有限公司',
    '2018', '9', ' ',
    '310106', '静安区人社局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913101074250115305', '上海化工研究院有限公司', '上海化工研究院有限公司',
    '2016', '2', ' ',
    '310107', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000425010765H', '上海电器科学研究所（集团）有限公司', '上海市机器人产业高技能人才培养基地（上海电器科学研究所（集团）有限公司）',
    '2015', '2', ' ',
    '310107', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '1231000042500447X6', '上海信息技术学校', '上海信息技术学校',
    '2014', '6', ' ',
    '310107', '华谊集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501775795U', '上海市物业管理行业协会', '上海市物业管理行业协会',
    '2013', '8', ' ',
    '310107', '市房屋管理局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501780957W', '上海市保安服务行业协会', '上海市保安服务行业协会',
    '2016', '8', ' ',
    '310107', '市公安局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000132260250X', '上海汽车集团股份有限公司', '上海汽车集团股份有限公司',
    '2011', '2', ' ',
    '310109', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000631189305E', '上海建工集团股份有限公司', '上海建工集团股份有限公司',
    '2012', '2', ' ',
    '310109', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '123100004250971352', '上海市高级技工学校', '上海市高级技工学校',
    '2012', '6', ' ',
    '310109', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000MJ49039942', '上海市工业互联网协会', '上海市工业互联网协会',
    '2020', '8', ' ',
    '310109', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '513100005017676481', '上海市燃气行业协会', '上海市燃气行业协会',
    '2014', '8', ' ',
    '310109', '市住房城乡建设管理委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '12310109MB2F07912D', '上海南湖职业技术学院', '上海南湖职业技术学院',
    '2025', '6', ' ',
    '310109', '虹口区教育局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310115X073202692', '中国联合网络通信有限公司上海市分公司', '中国联合网络通信有限公司上海市分公司',
    '2013', '1', ' ',
    '310115', '上海市通信管理局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001322004345', '上海烟草集团有限责任公司', '上海烟草集团有限责任公司',
    '2012', '1', ' ',
    '310110', '市烟草专卖局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '9131000013454082XB', '上海医药（集团）有限公司', '上海医药（集团）有限公司',
    '2011', '2', ' ',
    '310110', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000132211037N', '上海城投（集团）有限公司', '上海城投（集团）有限公司',
    '2012', '2', ' ',
    '310110', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000749599465B', '百联集团有限公司', '百联集团有限公司',
    '2011', '2', ' ',
    '310110', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '12310000425001703R', '上海出版印刷高等专科学校', '上海出版印刷高等专科学校',
    '2014', '6', ' ',
    '310110', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '5131000050176800X3', '上海市供水行业协会', '上海市供水行业协会',
    '2020', '8', ' ',
    '310110', '市水务局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310110703282972L', '上海杨浦科技创业中心有限公司', '上海杨浦科技创业中心有限公司',
    '2011', '9', ' ',
    '310110', '市科委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '12100000132259989H', '上海航天技术研究院', '上海航天技术研究院',
    '2011', '1', ' ',
    '310112', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100005587756227', '上海电力股份有限公司', '上海电力股份有限公司',
    '2012', '1', ' ',
    '310112', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310104398689820Y', '上海隧道工程有限公司', '上海隧道工程有限公司',
    '2013', '2', ' ',
    '310112', '市属国企集团公司',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100006317558649', '上海申通地铁集团有限公司', '上海申通地铁集团有限公司',
    '2011', '2', ' ',
    '310112', '市交通委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '52310000425166719E', '上海东海职业技术学院', '上海东海职业技术学院',
    '2025', '6', ' ',
    '310112', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '123101124250482370', '上海闵行职业技术学院', '上海闵行职业技术学院',
    '2025', '6', ' ',
    '310112', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000132200821H', '中国宝武钢铁集团有限公司', '中国宝武钢铁集团有限公司',
    '2011', '1', ' ',
    '310113', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '9131010933260509XE', '中国邮政集团有限公司上海市分公司', '中国邮政集团有限公司上海市分公司',
    '2011', '1', ' ',
    '310113', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310113133401086C', '中冶宝钢技术服务有限公司', '中冶宝钢技术服务有限公司',
    '2012', '1', ' ',
    '310113', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '123100004250970714', '上海新闻出版职业技术学校', '上海新闻出版职业技术学校',
    '2013', '6', ' ',
    '310113', '市委宣传部',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501777969Y', '上海市新材料产业高技能人才培养基地（上海市新材料协会）', '上海市新材料产业高技能人才培养基地（上海市新材料协会）',
    '2015', '8', ' ',
    '310114', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000322252841H', '上海市增材制造协会', '上海市3D打印高技能人才培养基地（上海市增材制造协会）',
    '2015', '8', ' ',
    '310114', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000MJ490097XP', '上海市智能制造产业协会', '上海市智能制造产业协会',
    '2018', '8', ' ',
    '310114', '市经济信息化委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '51310000501778304E', '上海市汽车零部件行业协会', '上海市汽车零部件行业协会',
    '2017', '8', ' ',
    '310114', '市商务委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '1231011472948859XC', '上海科学技术职业学院', '上海科学技术职业学院',
    '2025', '6', ' ',
    '310114', '嘉定区教育局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '123100004250102041', '上海市农业广播电视学校（上海市农民科技教育培训中心）', '上海市农业广播电视学校（上海市农民科技教育培训中心）',
    '2014', '6', ' ',
    '310117', '市农业农村委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '123101174250597539', '上海科创职业技术学院', '上海科创职业技术学院',
    '2025', '6', ' ',
    '310117', '松江区教育局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310000132212291W', '中国石化上海石油化工股份有限公司', '中国石化上海石油化工股份有限公司',
    '2011', '1', ' ',
    '310116', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '91310116134703182D', '中国核工业第五建设有限公司', '中国核工业第五建设有限公司',
    '2020', '1', ' ',
    '310116', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '12310116425062741Q', '上海食品科技学校', '上海食品科技学校',
    '2015', '6', ' ',
    '310116', '金山区教育局',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '913100001322043124', '江南造船（集团）有限责任公司', '江南造船（集团）有限责任公司',
    '2011', '1', ' ',
    '310151', '在沪央企',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '5131000050177459XK', '上海市建设协会', '上海市建设协会',
    '2017', '8', ' ',
    '310151', '市住房城乡建设管理委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '12310000425003581Y', '上海电子信息职业技术学院', '上海电子信息职业技术学院',
    '2025', '6', ' ',
    '310120', '市教委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

INSERT INTO wsbs.RECRUIT_SITE_INFO (
    site_id, tyshxym, company_name, site_name, listing_year, site_category,
    industry_category, district_code, superior_department, site_address, site_intro,
    status, reviewer, review_time, review_opinion, archive_status,
    created_by, created_at, updated_by, updated_at
) VALUES (
    wsbs.SEQ_0073_RECRUIT_SITE_INFO.NEXTVAL,
    '123100004250046643', '上海建设管理职业技术学院', '上海建设管理职业技术学院',
    '2025', '6', ' ',
    '310118', '市住建委',
    ' ', ' ', '已通过', NULL, NULL, NULL, '未归档',
    'system', SYSDATE, NULL, NULL
);

COMMIT;
