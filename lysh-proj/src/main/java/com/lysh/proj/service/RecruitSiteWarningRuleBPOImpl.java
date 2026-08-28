package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteWarningRuleEntity;
import com.lysh.proj.model.RecruitSiteWarningRule;
import com.lysh.proj.model.RecruitSiteWarningRuleQueryReq;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 高基地预警规则配置业务处理实现类。
 * 使用 DBUtils 完成规则增删改查，条件参数以 JSON 字符串存储。
 */
@Service
public class RecruitSiteWarningRuleBPOImpl implements RecruitSiteWarningRuleBPO {

    private static final String COLUMNS = "rule_id, rule_code, rule_name, target_type, warning_level, " +
            "condition_config, content_template, description, enabled, sort_no, " +
            "created_by, created_at, updated_by, updated_at";

    @Override
    public RecruitSiteWarningRule create(RecruitSiteWarningRule rule) {
        validate(rule);
        if (existsByRuleCode(rule.getRuleCode())) {
            throw new BusinessException("规则编码已存在: " + rule.getRuleCode());
        }
        Date now = new Date();
        String operatorName = currentAdminOperatorName();
        rule.setEnabled(rule.getEnabled() == null ? Boolean.TRUE : rule.getEnabled());
        rule.setSortNo(rule.getSortNo() == null ? 0L : rule.getSortNo());
        rule.setCreatedBy(operatorName);
        rule.setCreatedAt(now);
        rule.setUpdatedBy(operatorName);
        rule.setUpdatedAt(now);
        insert(rule);
        return rule;
    }

    @Override
    public RecruitSiteWarningRule update(RecruitSiteWarningRule rule) {
        if (rule == null || rule.getRuleId() == null) {
            throw new BusinessException("规则ID不能为空");
        }
        RecruitSiteWarningRule old = findById(rule.getRuleId());
        if (old == null) {
            throw new BusinessException("预警规则不存在: " + rule.getRuleId());
        }
        if (isBlank(rule.getRuleCode())) {
            rule.setRuleCode(old.getRuleCode());
        } else if (!rule.getRuleCode().equals(old.getRuleCode()) && existsByRuleCode(rule.getRuleCode())) {
            throw new BusinessException("规则编码已存在: " + rule.getRuleCode());
        }
        mergeRule(old, rule);
        validate(rule);
        rule.setUpdatedBy(currentAdminOperatorName());
        rule.setUpdatedAt(new Date());
        update(rule);
        return rule;
    }

    @Override
    public void delete(Long ruleId) {
        if (ruleId == null) {
            throw new BusinessException("规则ID不能为空");
        }
        RecruitSiteWarningRule old = findById(ruleId);
        if (old == null) {
            throw new BusinessException("预警规则不存在: " + ruleId);
        }
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_WARNING_RULE WHERE rule_id = ?", ruleId);
    }

    @Override
    public RecruitSiteWarningRule updateEnabled(Long ruleId, Boolean enabled) {
        if (ruleId == null) {
            throw new BusinessException("规则ID不能为空");
        }
        RecruitSiteWarningRule rule = findById(ruleId);
        if (rule == null) {
            throw new BusinessException("预警规则不存在: " + ruleId);
        }
        if (enabled == null) {
            throw new BusinessException("启用状态不能为空");
        }
        rule.setEnabled(enabled);
        rule.setUpdatedBy(currentAdminOperatorName());
        rule.setUpdatedAt(new Date());
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_WARNING_RULE SET enabled = ?, updated_by = ?, updated_at = ? WHERE rule_id = ?",
                boolToNumber(rule.getEnabled()), rule.getUpdatedBy(), rule.getUpdatedAt(), ruleId);
        return rule;
    }

    @Override
    public PageResult<RecruitSiteWarningRule> list(RecruitSiteWarningRuleQueryReq req) {
        if (req == null) {
            req = new RecruitSiteWarningRuleQueryReq();
        }
        PageParam pageParam = req.getPageParam() == null ? new PageParam() : req.getPageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/gjd/querySiteWarningRuleList");
        queryBuilder.parseFilter("targetType", req.getTargetType());
        queryBuilder.parseFilter("warningLevel", req.getWarningLevel());
        queryBuilder.parseFilter("enabled", req.getEnabled());
        queryBuilder.parseFilter("keyword", req.getKeyword());
        return queryBuilder.getPage(pageParam, RecruitSiteWarningRule.class);
    }

    @Override
    public RecruitSiteWarningRule findById(Long ruleId) {
        if (ruleId == null) {
            return null;
        }
        RecruitSiteWarningRuleEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_WARNING_RULE WHERE rule_id = ?",
                RecruitSiteWarningRuleEntity.class, ruleId);
        return toModel(entity);
    }

    private boolean existsByRuleCode(String ruleCode) {
        return DBUtils.getInt(
                "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_WARNING_RULE WHERE rule_code = ?",
                ruleCode) > 0;
    }

    private void validate(RecruitSiteWarningRule rule) {
        if (isBlank(rule.getRuleCode())) {
            throw new BusinessException("规则编码不能为空");
        }
        if (isBlank(rule.getRuleName())) {
            throw new BusinessException("规则名称不能为空");
        }
        if (rule.getTargetType() == null
                || (rule.getTargetType() != 1 && rule.getTargetType() != 2 && rule.getTargetType() != 3)) {
            throw new BusinessException("预警对象类型只能为1基地/2项目/3资产");
        }
        if (isBlank(rule.getWarningLevel())) {
            throw new BusinessException("预警级别不能为空");
        }
        if (isBlank(rule.getConditionConfig())) {
            throw new BusinessException("规则条件参数不能为空");
        }
        if (isBlank(rule.getContentTemplate())) {
            throw new BusinessException("预警文案模板不能为空");
        }
    }

    private void mergeRule(RecruitSiteWarningRule old, RecruitSiteWarningRule rule) {
        rule.setRuleId(old.getRuleId());
        if (isBlank(rule.getRuleCode())) {
            rule.setRuleCode(old.getRuleCode());
        }
        if (isBlank(rule.getRuleName())) {
            rule.setRuleName(old.getRuleName());
        }
        if (rule.getTargetType() == null) {
            rule.setTargetType(old.getTargetType());
        }
        if (isBlank(rule.getWarningLevel())) {
            rule.setWarningLevel(old.getWarningLevel());
        }
        if (isBlank(rule.getConditionConfig())) {
            rule.setConditionConfig(old.getConditionConfig());
        }
        if (isBlank(rule.getContentTemplate())) {
            rule.setContentTemplate(old.getContentTemplate());
        }
        if (rule.getDescription() == null) {
            rule.setDescription(old.getDescription());
        }
        if (rule.getEnabled() == null) {
            rule.setEnabled(old.getEnabled());
        }
        if (rule.getSortNo() == null) {
            rule.setSortNo(old.getSortNo());
        }
        rule.setCreatedBy(old.getCreatedBy());
        rule.setCreatedAt(old.getCreatedAt());
    }

    private void insert(RecruitSiteWarningRule rule) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_WARNING_RULE " +
                "(rule_id, rule_code, rule_name, target_type, warning_level, condition_config, content_template, " +
                "description, enabled, sort_no, created_by, created_at, updated_by, updated_at) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_WARNING_RULE.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                rule.getRuleCode(),
                rule.getRuleName(),
                rule.getTargetType(),
                rule.getWarningLevel(),
                rule.getConditionConfig(),
                rule.getContentTemplate(),
                rule.getDescription(),
                boolToNumber(rule.getEnabled()),
                rule.getSortNo(),
                rule.getCreatedBy(),
                rule.getCreatedAt(),
                rule.getUpdatedBy(),
                rule.getUpdatedAt());
        rule.setRuleId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_WARNING_RULE.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteWarningRule rule) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_WARNING_RULE SET " +
                "rule_code = ?, rule_name = ?, target_type = ?, warning_level = ?, condition_config = ?, " +
                "content_template = ?, description = ?, enabled = ?, sort_no = ?, updated_by = ?, updated_at = ? " +
                "WHERE rule_id = ?",
                rule.getRuleCode(),
                rule.getRuleName(),
                rule.getTargetType(),
                rule.getWarningLevel(),
                rule.getConditionConfig(),
                rule.getContentTemplate(),
                rule.getDescription(),
                boolToNumber(rule.getEnabled()),
                rule.getSortNo(),
                rule.getUpdatedBy(),
                rule.getUpdatedAt(),
                rule.getRuleId());
    }

    private RecruitSiteWarningRule toModel(RecruitSiteWarningRuleEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteWarningRule model = new RecruitSiteWarningRule();
        model.setRuleId(entity.getRuleId());
        model.setRuleCode(entity.getRuleCode());
        model.setRuleName(entity.getRuleName());
        model.setTargetType(entity.getTargetType());
        model.setWarningLevel(entity.getWarningLevel());
        model.setConditionConfig(entity.getConditionConfig());
        model.setContentTemplate(entity.getContentTemplate());
        model.setDescription(entity.getDescription());
        model.setEnabled(entity.getEnabled());
        model.setSortNo(entity.getSortNo());
        model.setCreatedBy(entity.getCreatedBy());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedBy(entity.getUpdatedBy());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private String currentAdminOperatorName() {
        String userId = ShrsContextUtils.getUserId();
        return isBlank(userId) ? "管理员" : userId;
    }

    private Long boolToNumber(Boolean value) {
        return Boolean.TRUE.equals(value) ? 1L : 0L;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
