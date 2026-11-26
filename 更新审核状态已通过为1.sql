-- 将基地和项目审核状态中的“已通过”统一更新为字典值“1”

UPDATE wsbs.RECRUIT_SITE_INFO
SET status = '1'
WHERE status = '已通过';

UPDATE wsbs.RECRUIT_SITE_PROJECT
SET status = '1'
WHERE status = '已通过';

COMMIT;
