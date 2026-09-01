package com.lysh.proj.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lysh.proj.entity.RecruitSiteAssetEntity;
import com.lysh.proj.entity.RecruitSiteAnnualPlanEntity;
import com.lysh.proj.entity.RecruitSiteInfoEntity;
import com.lysh.proj.entity.RecruitSiteProjectEntity;
import com.lysh.proj.entity.RecruitSiteWarningRuleEntity;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 高基地预警定时业务处理实现类。
 * <p>
 * 定时任务主业务过程：读取启用规则，按 rule_code 路由到对应校验器，命中后生成或更新预警结果。
 * 同一条规则同一个预警对象存在“待处理”预警时，只更新触发快照和累计次数，不重复插入。
 */
@Service
public class RecruitSiteWarningJobBPOImpl implements RecruitSiteWarningJobBPO {

    private static final int TARGET_BASE = 1;
    private static final int TARGET_PROJECT = 2;
    private static final int TARGET_ASSET = 3;
    private static final int TARGET_ANNUAL_PLAN = 4;

    /**
     * 基地审核状态-待审核
     */
    private static final String SITE_STATUS_PENDING = "0";

    /**
     * 基地审核状态-通过
     */
    private static final String SITE_STATUS_PASSED = "1";

    /**
     * 基地审核状态-拒绝
     */
    private static final String SITE_STATUS_REJECTED = "2";

    /**
     * 项目审核状态-待审核
     */
    private static final String PROJECT_STATUS_PENDING = "0";

    /**
     * 项目审核状态-通过
     */
    private static final String PROJECT_STATUS_PASSED = "1";

    /**
     * 项目审核状态-拒绝
     */
    private static final String PROJECT_STATUS_REJECT = "2";

    /**
     * 项目阶段状态-建设中
     */
    private static final String PROJECT_STAGE_BUILDING = "1";

    /**
     * 项目阶段状态-已验收
     */
    private static final String PROJECT_STAGE_ACCEPTED = "2";

    /**
     * 项目阶段状态-已完成第一年绩效评估
     */
    private static final String PROJECT_STAGE_PERFORMANCE_1 = "3";

    /**
     * 项目阶段状态-已完成第二年绩效评估
     */
    private static final String PROJECT_STAGE_PERFORMANCE_2 = "4";

    /**
     * 项目阶段状态-已完成第三年绩效评估
     */
    private static final String PROJECT_STAGE_PERFORMANCE_3 = "5";

    /**
     * 项目阶段状态-已结项
     */
    private static final String PROJECT_STAGE_CLOSED = "6";

    /**
     * 预警处理状态-待处理
     */
    private static final String WARNING_STATUS_PENDING = "待处理";
    private static final String PLAN_STATUS_PENDING = "待审核";

    private static final String ASSET_STATUS_NORMAL = "1";
    private static final String ASSET_STATUS_NOT_RUNNING = "2";
    private static final String ASSET_STATUS_SCRAPPED = "3";

    private static final String SITE_COLUMNS = "site_id, tyshxym, company_name, site_name, listing_year, " +
            "site_category, industry_category, district_code, superior_department, site_address, site_intro, " +
            "status, reviewer, review_time, review_opinion, archive_status, created_by, created_at, " +
            "updated_by, updated_at";

    private static final String PROJECT_COLUMNS = "project_id, site_id, district_code, project_name, " +
            "apply_direction, apply_direction_project_name, project_location, implement_unit, project_intro, " +
            "project_status, approval_time, approval_amount, approval_grant_time, approval_grant_amount, " +
            "acceptance_time, acceptance_grant_time, acceptance_grant_amount, " +
            "performance_grant_time_1, performance_grant_amount_1, " +
            "performance_grant_time_2, performance_grant_amount_2, " +
            "performance_grant_time_3, performance_grant_amount_3, total_grant_amount, status, " +
            "reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at";

    private static final String ASSET_COLUMNS = "asset_id, project_id, site_id, tyshxym, district_code, " +
            "asset_name, quantity, unit, brand_model, storage_location, asset_status, usage_frequency, " +
            "asset_photo, created_by, created_at, updated_by, updated_at";

    private static final String PLAN_COLUMNS = "plan_id, site_id, tyshxym, district_code, annual_year, " +
            "skill_service_count, open_service_count, service_ratio, situation_desc, plan_file_key, plan_file_name, " +
            "status, reviewer, review_time, review_opinion, created_by, created_at, updated_by, updated_at";

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final ObjectMapper objectMapper;

    public RecruitSiteWarningJobBPOImpl(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    /**
     * 高基地预警定时校验主业务过程。
     * <p>
     * 编排说明：
     * 1. 查询全部启用规则；
     * 2. 逐条规则执行校验，单条异常不阻断整体；
     * 3. 命中后先查重再写入或更新预警结果；
     * 4. 输出本次执行的汇总日志。
     */
    @Override
    public void executeWarningCheck() {
        logger.info("高基地预警定时校验开始");
        List<RecruitSiteWarningRuleEntity> rules = queryEnabledRules();
        int triggered = 0;
        for (RecruitSiteWarningRuleEntity rule : rules) {
            try {
                int count = evaluateRule(rule);
                triggered += count;
                logger.info("规则[{}]校验完成，生成或更新预警数=[{}]", rule.getRuleCode(), count);
            } catch (Exception e) {
                logger.error("规则[{}]校验异常，跳过该规则", rule.getRuleCode(), e);
            }
        }
        logger.info("高基地预警定时校验结束，启用规则数=[{}]，生成或更新预警数=[{}]", rules.size(), triggered);
    }

    /**
     * 按规则编码路由到对应校验器，返回该规则生成或更新的预警数量。
     */
    private int evaluateRule(RecruitSiteWarningRuleEntity rule) {
        JsonNode config = parseConfig(rule.getConditionConfig());
        switch (rule.getRuleCode()) {
            case "BASE_01":
                return evaluateBase01(rule, config);
            case "BASE_02":
                return evaluateBase02(rule, config);
            case "BASE_03":
                return evaluateBase03(rule, config);
            case "BASE_04":
                return evaluateBase04(rule, config);
            case "BASE_05":
                return evaluateBase05(rule, config);
            case "PROJ_01":
                return evaluateProject01(rule, config);
            case "PROJ_02":
                return evaluateProject02(rule, config);
            case "PROJ_03":
                return evaluateProject03(rule, config);
            case "PROJ_04":
                return evaluateProject04(rule, config);
            case "PROJ_05":
                return evaluateProject05(rule, config);
            case "PROJ_06":
                return evaluateProject06(rule, config);
            case "PROJ_07":
                return evaluateProject07(rule, config);
            case "PROJ_08":
                return evaluateProject08(rule, config);
            case "PROJ_09":
                return evaluateProject09(rule, config);
            case "PROJ_10":
                return evaluateProject10(rule, config);
            case "ASSET_01":
                return evaluateAsset01(rule, config);
            case "ASSET_02":
                return evaluateAsset02(rule, config);
            case "ASSET_03":
                return evaluateAsset03(rule, config);
            case "ASSET_04":
                return evaluateAsset04(rule, config);
            case "ASSET_05":
                return evaluateAsset05(rule, config);
            case "ASSET_06":
                return evaluateAsset06(rule, config);
            case "ASSET_07":
                return evaluateAsset07(rule, config);
            case "ASSET_08":
                return evaluateAsset08(rule, config);
            case "PLAN_01":
                return evaluatePlan01(rule, config);
            case "PLAN_02":
                return evaluatePlan02(rule, config);
            default:
                logger.warn("预警规则[{}]暂未实现校验逻辑", rule.getRuleCode());
                return 0;
        }
    }

    /**
     * 基地信息长期未完善/未审核预警生成。
     * <p>
     * 数据来源：RECRUIT_SITE_INFO 中审核状态为“待审核”的基地；
     * 生成条件：基地创建时间距今超过配置天数 days（默认 30 天）；
     * 实际值：基地创建至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateBase01(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(30L);
        List<RecruitSiteInfoEntity> sites = DBUtils.query(
                "SELECT " + SITE_COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO " +
                        "WHERE status = '" + SITE_STATUS_PENDING + "'",
                RecruitSiteInfoEntity.class);
        int count = 0;
        for (RecruitSiteInfoEntity site : sites) {
            long actualDays = daysSince(site.getCreatedAt());
            if (actualDays > days) {
                WarningTarget target = baseTarget(site);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 基地信息长期未维护预警生成。
     * <p>
     * 数据来源：全部基地；
     * 生成条件：最近维护时间（updated_at 优先，无则取 created_at）距今超过配置天数 days（默认 365 天）；
     * 实际值：最近维护至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateBase02(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(365L);
        List<RecruitSiteInfoEntity> sites = DBUtils.query(
                "SELECT " + SITE_COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO",
                RecruitSiteInfoEntity.class);
        int count = 0;
        for (RecruitSiteInfoEntity site : sites) {
            long actualDays = daysSince(lastUpdate(site.getUpdatedAt(), site.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = baseTarget(site);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 有项目却无资产预警生成。
     * <p>
     * 数据来源：全部基地；
     * 生成条件：基地存在未结项项目、资产总数为 0，且任一项目立项批复时间（无则创建时间）距今超过配置天数 days（默认 90 天）；
     * 实际值：基地未结项项目数量；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateBase03(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(90L);
        List<RecruitSiteInfoEntity> sites = DBUtils.query(
                "SELECT " + SITE_COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO",
                RecruitSiteInfoEntity.class);
        int count = 0;
        for (RecruitSiteInfoEntity site : sites) {
            int projectCount = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_PROJECT " +
                            "WHERE site_id = ? AND project_status <> '" + PROJECT_STAGE_CLOSED + "'",
                    site.getSiteId());
            if (projectCount == 0) {
                continue;
            }
            int assetCount = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_ASSET WHERE site_id = ?",
                    site.getSiteId());
            if (assetCount > 0) {
                continue;
            }
            boolean overdue = false;
            List<RecruitSiteProjectEntity> projects = DBUtils.query(
                    "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                            "WHERE site_id = ? AND project_status <> '" + PROJECT_STAGE_CLOSED + "'",
                    RecruitSiteProjectEntity.class, site.getSiteId());
            for (RecruitSiteProjectEntity project : projects) {
                Date start = project.getApprovalTime() != null ? project.getApprovalTime() : project.getCreatedAt();
                if (daysSince(start) > days) {
                    overdue = true;
                    break;
                }
            }
            if (overdue) {
                WarningTarget target = baseTarget(site);
                target.setMetricValue(projectCount + "个项目");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 基地资产健康度偏低预警生成。
     * <p>
     * 数据来源：全部基地及其关联资产；
     * 生成条件：基地资产总数大于 0，且“正常运行”资产占比低于配置比例 normalRatio（默认 0.6）；
     * 实际值：正常运行资产占比百分比；阈值：配置占比；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateBase04(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        double ratioThreshold = config.path("normalRatio").asDouble(0.6);
        List<RecruitSiteInfoEntity> sites = DBUtils.query(
                "SELECT " + SITE_COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO",
                RecruitSiteInfoEntity.class);
        int count = 0;
        for (RecruitSiteInfoEntity site : sites) {
            int total = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_ASSET WHERE site_id = ?",
                    site.getSiteId());
            if (total == 0) {
                continue;
            }
            int normal = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_ASSET WHERE site_id = ? AND asset_status = ?",
                    site.getSiteId(), ASSET_STATUS_NORMAL);
            double ratio = normal * 1.0D / total;
            if (ratio < ratioThreshold) {
                WarningTarget target = baseTarget(site);
                target.setMetricValue(String.format("%.0f%%", ratio * 100));
                target.setThresholdValue(String.format("%.0f%%", ratioThreshold * 100));
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 挂牌后长期无项目预警生成。
     * <p>
     * 数据来源：全部基地；
     * 生成条件：挂牌年份距今超过配置年数 years（默认 2 年），且基地下没有任何项目；
     * 实际值：挂牌至今的年数；阈值：配置年数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateBase05(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long years = config.path("years").asLong(2L);
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        List<RecruitSiteInfoEntity> sites = DBUtils.query(
                "SELECT " + SITE_COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO",
                RecruitSiteInfoEntity.class);
        int count = 0;
        for (RecruitSiteInfoEntity site : sites) {
            if (site.getListingYear() == null || site.getListingYear().isBlank()) {
                continue;
            }
            int listingYear;
            try {
                listingYear = Integer.parseInt(site.getListingYear());
            } catch (NumberFormatException e) {
                logger.warn("基地[{}]挂牌年份格式异常: {}", site.getSiteId(), site.getListingYear());
                continue;
            }
            long actualYears = currentYear - listingYear;
            if (actualYears < years) {
                continue;
            }
            int projectCount = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_PROJECT WHERE site_id = ?",
                    site.getSiteId());
            if (projectCount == 0) {
                WarningTarget target = baseTarget(site);
                target.setMetricValue(actualYears + "年");
                target.setThresholdValue(years + "年");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 建设超期未验收预警生成。
     * <p>
     * 数据来源：项目状态为“建设中”的项目；
     * 生成条件：立项批复时间（无则创建时间）距今超过配置天数 days（默认 730 天）；
     * 实际值：立项批复至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject01(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(730L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                        "WHERE project_status = '" + PROJECT_STAGE_BUILDING + "'",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            Date start = project.getApprovalTime() != null ? project.getApprovalTime() : project.getCreatedAt();
            long actualDays = daysSince(start);
            if (actualDays > days) {
                WarningTarget target = projectTarget(project);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 批复资金未按期拨付预警生成。
     * <p>
     * 数据来源：已填写立项批复时间但未填写立项拨付时间的项目；
     * 生成条件：立项批复时间距今超过配置天数 days（默认 90 天）；
     * 实际值：立项批复至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject02(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(90L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                        "WHERE approval_time IS NOT NULL AND approval_grant_time IS NULL",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            long actualDays = daysSince(project.getApprovalTime());
            if (actualDays > days) {
                WarningTarget target = projectTarget(project);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 验收资金未按期拨付预警生成。
     * <p>
     * 数据来源：已填写验收批复时间但未填写验收拨付时间的项目；
     * 生成条件：验收批复时间距今超过配置天数 days（默认 90 天）；
     * 实际值：验收批复至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject03(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(90L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                        "WHERE acceptance_time IS NOT NULL AND acceptance_grant_time IS NULL",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            long actualDays = daysSince(project.getAcceptanceTime());
            if (actualDays > days) {
                WarningTarget target = projectTarget(project);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 绩效拨付缺失/超期预警生成。
     * <p>
     * 数据来源：全部项目；
     * 生成条件：按绩效年度依次检查，第一年以验收批复时间为起点，第二、三年以上一阶段拨付时间为起点，
     * 对应年度绩效拨付时间为空且起点距今超过配置天数 days（默认 365 天）；
     * 实际值：缺失的绩效年度及超期天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject04(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(365L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            String stage = null;
            Date start = null;
            if (project.getAcceptanceTime() != null && project.getPerformanceGrantTime1() == null) {
                stage = "第一年";
                start = project.getAcceptanceTime();
            } else if (project.getPerformanceGrantTime1() != null && project.getPerformanceGrantTime2() == null) {
                stage = "第二年";
                start = project.getPerformanceGrantTime1();
            } else if (project.getPerformanceGrantTime2() != null && project.getPerformanceGrantTime3() == null) {
                stage = "第三年";
                start = project.getPerformanceGrantTime2();
            }
            if (stage == null || daysSince(start) <= days) {
                continue;
            }
            WarningTarget target = projectTarget(project);
            target.setMetricValue(stage + "绩效拨付超" + daysSince(start) + "天");
            target.setThresholdValue(days + "天");
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 项目状态与资金进度不一致预警生成。
     * <p>
     * 数据来源：全部项目；
     * 生成条件：状态为“已验收”但验收批复时间为空、状态为“已结项”但资金拨付明细不完整、
     * 或状态为“建设中”却已填写验收信息；
     * 实际值：状态与字段不一致；阈值：无，此规则不需要 condition_config 参数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject05(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            String reason = null;
            if (PROJECT_STAGE_ACCEPTED.equals(project.getProjectStatus()) && project.getAcceptanceTime() == null) {
                reason = "项目状态为已验收但验收批复时间为空";
            } else if (PROJECT_STAGE_CLOSED.equals(project.getProjectStatus())
                    && (project.getAcceptanceGrantAmount() == null
                    || project.getPerformanceGrantAmount1() == null
                    || project.getPerformanceGrantAmount2() == null
                    || project.getPerformanceGrantAmount3() == null)) {
                reason = "项目已结项但资金拨付明细不完整";
            } else if (PROJECT_STAGE_BUILDING.equals(project.getProjectStatus())
                    && (project.getAcceptanceTime() != null || project.getAcceptanceGrantTime() != null)) {
                reason = "项目状态为建设中但已填写验收信息";
            }
            if (reason == null) {
                continue;
            }
            WarningTarget target = projectTarget(project);
            target.setMetricValue("状态与字段不一致");
            target.setThresholdValue("-");
            target.setReason(reason);
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 合计金额与明细不一致预警生成。
     * <p>
     * 数据来源：合计拨付金额非空的项目；
     * 生成条件：合计拨付金额与立项、验收、三年绩效各阶段拨付金额之和的偏差超过配置金额差 amountDiff（默认 0.01）；
     * 实际值：合计金额与明细金额之和；阈值：允许的最大偏差；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject06(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        double amountDiff = config.path("amountDiff").asDouble(0.01);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                        "WHERE total_grant_amount IS NOT NULL",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            BigDecimal sum = sumGrantAmount(project);
            BigDecimal diff = project.getTotalGrantAmount().subtract(sum).abs();
            if (diff.compareTo(BigDecimal.valueOf(amountDiff)) <= 0) {
                continue;
            }
            WarningTarget target = projectTarget(project);
            target.setMetricValue("合计" + project.getTotalGrantAmount() + "，明细" + sum);
            target.setThresholdValue("偏差不超过" + amountDiff);
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 项目长期无资产预警生成。
     * <p>
     * 数据来源：项目状态未结项的项目；
     * 生成条件：项目下资产数量为 0，且项目创建时间（无则立项批复时间）距今超过配置天数 days（默认 90 天）；
     * 实际值：0 个资产；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject07(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(90L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                        "WHERE project_status <> '" + PROJECT_STAGE_CLOSED + "'",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            int assetCount = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_ASSET WHERE project_id = ?",
                    project.getProjectId());
            Date start = project.getCreatedAt() != null ? project.getCreatedAt() : project.getApprovalTime();
            if (assetCount == 0 && daysSince(start) > days) {
                WarningTarget target = projectTarget(project);
                target.setMetricValue("0个资产");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 项目信息长期未维护预警生成。
     * <p>
     * 数据来源：项目状态未结项的项目；
     * 生成条件：最近更新时间（updated_at 优先，无则 created_at）距今超过配置天数 days（默认 365 天）；
     * 实际值：最近更新至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject08(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(365L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT " +
                        "WHERE project_status <> '" + PROJECT_STAGE_CLOSED + "'",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            long actualDays = daysSince(lastUpdate(project.getUpdatedAt(), project.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = projectTarget(project);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 项目审核超时预警生成。
     * <p>
     * 数据来源：审核状态为“待审核”的项目；
     * 生成条件：最近提交时间（updated_at 优先，无则 created_at）距今超过配置天数 days（默认 15 天）；
     * 实际值：最近提交至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject09(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(15L);
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT WHERE status = '" + PROJECT_STATUS_PENDING + "'",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            long actualDays = daysSince(lastUpdate(project.getUpdatedAt(), project.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = projectTarget(project);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 项目材料缺失预警生成。
     * <p>
     * 数据来源：全部项目；
     * 生成条件：项目未挂接任何项目文件（RECRUIT_SITE_PROJECT_FILE）；
     * 实际值：0 个文件；阈值：至少 1 个；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateProject10(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT",
                RecruitSiteProjectEntity.class);
        int count = 0;
        for (RecruitSiteProjectEntity project : projects) {
            int fileCount = DBUtils.getInt(
                    "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_PROJECT_FILE WHERE project_id = ?",
                    project.getProjectId());
            if (fileCount > 0) {
                continue;
            }
            WarningTarget target = projectTarget(project);
            target.setMetricValue("0个文件");
            target.setThresholdValue("至少1个");
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 报废资产长期未处置预警生成。
     * <p>
     * 数据来源：资产状态为“报废”的资产；
     * 生成条件：最近更新时间（updated_at 优先，无则 created_at）距今超过配置天数 days（默认 90 天）；
     * 实际值：最近更新至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset01(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(90L);
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET " +
                        "WHERE asset_status = '" + ASSET_STATUS_SCRAPPED + "'",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            long actualDays = daysSince(lastUpdate(asset.getUpdatedAt(), asset.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = assetTarget(asset);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 未运行资产长期未说明预警生成。
     * <p>
     * 数据来源：资产状态为“未运行”的资产；
     * 生成条件：最近更新时间（updated_at 优先，无则 created_at）距今超过配置天数 days（默认 90 天）；
     * 实际值：最近更新至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset02(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(90L);
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET " +
                        "WHERE asset_status = '" + ASSET_STATUS_NOT_RUNNING + "'",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            long actualDays = daysSince(lastUpdate(asset.getUpdatedAt(), asset.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = assetTarget(asset);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 使用频次缺失或为 0 预警生成。
     * <p>
     * 数据来源：全部资产；
     * 生成条件：使用频次 usage_frequency 为空或等于 0；
     * 实际值：0 次；阈值：大于 0 次；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset03(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET " +
                        "WHERE usage_frequency IS NULL OR usage_frequency = 0",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            WarningTarget target = assetTarget(asset);
            target.setMetricValue("0次");
            target.setThresholdValue(">0次");
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 使用频次明显偏低预警生成。
     * <p>
     * 数据来源：使用频次非空的资产；
     * 生成条件：使用频次低于配置值 frequency（必填参数，默认 1）；
     * 实际值：当前使用频次；阈值：配置值；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset04(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        if (!config.has("frequency")) {
            logger.warn("规则[{}]缺少frequency参数，跳过", rule.getRuleCode());
            return 0;
        }
        long frequency = config.path("frequency").asLong(1L);
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET " +
                        "WHERE usage_frequency IS NOT NULL",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            if (asset.getUsageFrequency() >= frequency) {
                continue;
            }
            WarningTarget target = assetTarget(asset);
            target.setMetricValue(asset.getUsageFrequency() + "次");
            target.setThresholdValue(frequency + "次");
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 资产信息长期未维护预警生成。
     * <p>
     * 数据来源：全部资产；
     * 生成条件：最近更新时间（updated_at 优先，无则 created_at）距今超过配置天数 days（默认 180 天）；
     * 实际值：最近更新至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset05(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(180L);
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            long actualDays = daysSince(lastUpdate(asset.getUpdatedAt(), asset.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = assetTarget(asset);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 资产基础数据不完整预警生成。
     * <p>
     * 数据来源：全部资产；
     * 生成条件：数量为空或小于等于 0，或名称、单位、存放地点、照片任一字段缺失；
     * 实际值：缺失字段名称；阈值：字段完整；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset06(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            List<String> missing = new ArrayList<>();
            if (asset.getQuantity() == null || asset.getQuantity() <= 0) {
                missing.add("数量");
            }
            if (isBlank(asset.getAssetName())) {
                missing.add("名称");
            }
            if (isBlank(asset.getUnit())) {
                missing.add("单位");
            }
            if (isBlank(asset.getStorageLocation())) {
                missing.add("存放地点");
            }
            if (isBlank(asset.getAssetPhoto())) {
                missing.add("照片");
            }
            if (missing.isEmpty()) {
                continue;
            }
            WarningTarget target = assetTarget(asset);
            target.setMetricValue(String.join("、", missing) + "缺失");
            target.setThresholdValue("字段完整");
            target.setMissingFields(String.join("、", missing));
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 项目结项后资产未更新预警生成。
     * <p>
     * 数据来源：关联项目已结项且资产状态仍为“正常运行”的资产；
     * 生成条件：资产最近更新时间（updated_at 优先，无则 created_at）距今超过配置天数 days（默认 30 天）；
     * 实际值：最近更新至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset07(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(30L);
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET " +
                        "WHERE asset_status = '" + ASSET_STATUS_NORMAL + "'",
                RecruitSiteAssetEntity.class);
        int count = 0;
        for (RecruitSiteAssetEntity asset : assets) {
            RecruitSiteProjectEntity project = DBUtils.get(
                    "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT WHERE project_id = ?",
                    RecruitSiteProjectEntity.class, asset.getProjectId());
            if (project == null || !PROJECT_STAGE_CLOSED.equals(project.getProjectStatus())) {
                continue;
            }
            long actualDays = daysSince(lastUpdate(asset.getUpdatedAt(), asset.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = assetTarget(asset);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 疑似重复登记预警生成。
     * <p>
     * 数据来源：全部资产；
     * 生成条件：同一项目下资产名称和品牌型号完全一致的记录数大于 1；
     * 实际值：重复记录条数；阈值：仅 1 条；
     * 生成方式：每个重复组取第一条资产作为预警对象，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluateAsset08(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET",
                RecruitSiteAssetEntity.class);
        Map<String, List<RecruitSiteAssetEntity>> groups = new HashMap<>();
        for (RecruitSiteAssetEntity asset : assets) {
            String key = asset.getProjectId() + "|" + valueOf(asset.getAssetName()) + "|" + valueOf(asset.getBrandModel());
            groups.computeIfAbsent(key, k -> new ArrayList<>()).add(asset);
        }
        int count = 0;
        for (List<RecruitSiteAssetEntity> group : groups.values()) {
            if (group.size() <= 1) {
                continue;
            }
            RecruitSiteAssetEntity asset = group.get(0);
            WarningTarget target = assetTarget(asset);
            target.setMetricValue(group.size() + "条重复");
            target.setThresholdValue("仅1条");
            target.setDuplicateCount(group.size());
            target.setWarningContent(renderTemplate(rule, target));
            count += upsertWarning(rule, target);
        }
        return count;
    }

    /**
     * 年报计划超过配置天数未审批预警生成。
     * <p>
     * 数据来源：审核状态为“待审核”的年报计划；
     * 生成条件：最近更新或创建时间距今超过配置天数 days（默认 30 天）；
     * 实际值：待审核至今的天数；阈值：配置天数；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluatePlan01(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        long days = config.path("days").asLong(30L);
        List<RecruitSiteAnnualPlanEntity> plans = DBUtils.query(
                "SELECT " + PLAN_COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PLAN " +
                        "WHERE status = '" + PLAN_STATUS_PENDING + "'",
                RecruitSiteAnnualPlanEntity.class);
        int count = 0;
        for (RecruitSiteAnnualPlanEntity plan : plans) {
            long actualDays = daysSince(lastUpdate(plan.getUpdatedAt(), plan.getCreatedAt()));
            if (actualDays > days) {
                WarningTarget target = planTarget(plan);
                target.setMetricValue(actualDays + "天");
                target.setThresholdValue(days + "天");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    /**
     * 年报计划占比低于阈值预警生成。
     * <p>
     * 数据来源：占比非空的年报计划；
     * 生成条件：面向社会开放服务数/技能服务数占比低于配置比例 ratio（默认 20%）；
     * 实际值：当前占比；阈值：配置占比；
     * 生成方式：命中后组装 WarningTarget，调用 upsertWarning 写入或更新 RECRUIT_SITE_WARNING。
     */
    private int evaluatePlan02(RecruitSiteWarningRuleEntity rule, JsonNode config) {
        double ratioThreshold = config.path("ratio").asDouble(20.0);
        List<RecruitSiteAnnualPlanEntity> plans = DBUtils.query(
                "SELECT " + PLAN_COLUMNS + " FROM wsbs.RECRUIT_SITE_ANNUAL_PLAN " +
                        "WHERE service_ratio IS NOT NULL",
                RecruitSiteAnnualPlanEntity.class);
        int count = 0;
        for (RecruitSiteAnnualPlanEntity plan : plans) {
            BigDecimal ratio = plan.getServiceRatio();
            if (ratio.compareTo(BigDecimal.valueOf(ratioThreshold)) < 0) {
                WarningTarget target = planTarget(plan);
                target.setMetricValue(ratio.stripTrailingZeros().toPlainString() + "%");
                target.setThresholdValue(BigDecimal.valueOf(ratioThreshold).stripTrailingZeros().toPlainString() + "%");
                target.setWarningContent(renderTemplate(rule, target));
                count += upsertWarning(rule, target);
            }
        }
        return count;
    }

    private WarningTarget planTarget(RecruitSiteAnnualPlanEntity plan) {
        WarningTarget target = new WarningTarget();
        target.setTargetType(TARGET_ANNUAL_PLAN);
        target.setTargetId(plan.getPlanId());
        target.setSiteId(plan.getSiteId());
        target.setTyshxym(plan.getTyshxym());
        target.setDistrictCode(plan.getDistrictCode());
        target.setAnnualYear(plan.getAnnualYear());
        return target;
    }

    private List<RecruitSiteWarningRuleEntity> queryEnabledRules() {
        return DBUtils.query(
                "SELECT rule_id, rule_code, rule_name, target_type, warning_level, condition_config, " +
                        "content_template, description, enabled, sort_no, created_by, created_at, " +
                        "updated_by, updated_at FROM wsbs.RECRUIT_SITE_WARNING_RULE " +
                        "WHERE enabled = 1 ORDER BY target_type, sort_no, rule_id",
                RecruitSiteWarningRuleEntity.class);
    }

    private JsonNode parseConfig(String config) {
        if (isBlank(config)) {
            return objectMapper.createObjectNode();
        }
        try {
            return objectMapper.readTree(config);
        } catch (Exception e) {
            throw new BusinessException("预警规则条件参数JSON解析失败");
        }
    }

    /**
     * 预警查重与落库。
     * <p>
     * 先按 rule_id + target_id + 待处理状态查重：
     * 已存在则更新预警文案、实际值、阈值、最近触发时间并累计触发次数；
     * 不存在则插入新预警，记录首次触发时间、最近触发时间并初始化累计次数为 1。
     */
    private int upsertWarning(RecruitSiteWarningRuleEntity rule, WarningTarget target) {
        int existing = DBUtils.getInt(
                "SELECT COUNT(1) FROM wsbs.RECRUIT_SITE_WARNING " +
                        "WHERE rule_id = ? AND target_id = ? AND warning_status = '" + WARNING_STATUS_PENDING + "'",
                rule.getRuleId(), target.getTargetId());
        if (existing > 0) {
            DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_WARNING SET " +
                            "warning_content = ?, metric_value = ?, threshold_value = ?, " +
                            "last_trigger_time = SYSDATE, trigger_count = trigger_count + 1, updated_at = SYSDATE " +
                            "WHERE rule_id = ? AND target_id = ? AND warning_status = '" + WARNING_STATUS_PENDING + "'",
                    target.getWarningContent(), target.getMetricValue(), target.getThresholdValue(),
                    rule.getRuleId(), target.getTargetId());
            return 1;
        }
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_WARNING " +
                        "(warning_id, rule_id, rule_code, rule_name, target_type, target_id, site_id, project_id, " +
                        "asset_id, tyshxym, district_code, warning_level, warning_status, warning_content, " +
                        "metric_value, threshold_value, first_trigger_time, last_trigger_time, trigger_count, " +
                        "created_at, updated_at) " +
                        "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_WARNING.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                        "?, ?, ?, SYSDATE, SYSDATE, 1, SYSDATE, SYSDATE)",
                rule.getRuleId(),
                rule.getRuleCode(),
                rule.getRuleName(),
                rule.getTargetType(),
                target.getTargetId(),
                target.getSiteId(),
                target.getProjectId(),
                target.getAssetId(),
                target.getTyshxym(),
                target.getDistrictCode(),
                rule.getWarningLevel(),
                WARNING_STATUS_PENDING,
                target.getWarningContent(),
                target.getMetricValue(),
                target.getThresholdValue());
        return 1;
    }

    private WarningTarget baseTarget(RecruitSiteInfoEntity site) {
        WarningTarget target = new WarningTarget();
        target.setTargetType(TARGET_BASE);
        target.setTargetId(site.getSiteId());
        target.setSiteId(site.getSiteId());
        target.setTyshxym(site.getTyshxym());
        target.setDistrictCode(site.getDistrictCode());
        target.setSiteName(site.getSiteName());
        return target;
    }

    private WarningTarget projectTarget(RecruitSiteProjectEntity project) {
        WarningTarget target = new WarningTarget();
        target.setTargetType(TARGET_PROJECT);
        target.setTargetId(project.getProjectId());
        target.setSiteId(project.getSiteId());
        target.setProjectId(project.getProjectId());
        target.setDistrictCode(project.getDistrictCode());
        target.setProjectName(project.getProjectName());
        target.setProjectStatus(project.getProjectStatus());
        return target;
    }

    private WarningTarget assetTarget(RecruitSiteAssetEntity asset) {
        WarningTarget target = new WarningTarget();
        target.setTargetType(TARGET_ASSET);
        target.setTargetId(asset.getAssetId());
        target.setSiteId(asset.getSiteId());
        target.setProjectId(asset.getProjectId());
        target.setAssetId(asset.getAssetId());
        target.setTyshxym(asset.getTyshxym());
        target.setDistrictCode(asset.getDistrictCode());
        target.setAssetName(asset.getAssetName());
        target.setAssetStatus(asset.getAssetStatus());
        target.setUsageFrequency(asset.getUsageFrequency());
        return target;
    }

    private String renderTemplate(RecruitSiteWarningRuleEntity rule, WarningTarget target) {
        String content = rule.getContentTemplate();
        if (isBlank(content)) {
            content = "对象[" + target.getTargetId() + "]触发预警";
        }
        if (target.getSiteName() == null && target.getSiteId() != null && content.contains("{siteName}")) {
            RecruitSiteInfoEntity site = DBUtils.get(
                    "SELECT " + SITE_COLUMNS + " FROM wsbs.RECRUIT_SITE_INFO WHERE site_id = ?",
                    RecruitSiteInfoEntity.class, target.getSiteId());
            target.setSiteName(site == null ? null : site.getSiteName());
        }
        if (target.getProjectName() == null && target.getProjectId() != null && content.contains("{projectName}")) {
            RecruitSiteProjectEntity project = DBUtils.get(
                    "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT WHERE project_id = ?",
                    RecruitSiteProjectEntity.class, target.getProjectId());
            target.setProjectName(project == null ? null : project.getProjectName());
        }
        if (target.getAssetName() == null && target.getAssetId() != null && content.contains("{assetName}")) {
            RecruitSiteAssetEntity asset = DBUtils.get(
                    "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET WHERE asset_id = ?",
                    RecruitSiteAssetEntity.class, target.getAssetId());
            target.setAssetName(asset == null ? null : asset.getAssetName());
        }
        content = replaceLiteral(content, "{siteName}", target.getSiteName());
        content = replaceLiteral(content, "{projectName}", target.getProjectName());
        content = replaceLiteral(content, "{assetName}", target.getAssetName());
        content = replaceLiteral(content, "{annualYear}", target.getAnnualYear());
        content = replaceLiteral(content, "{projectStatus}", target.getProjectStatus());
        content = replaceLiteral(content, "{assetStatus}", target.getAssetStatus());
        content = replaceLiteral(content, "{usageFrequency}", target.getUsageFrequency());
        content = replaceLiteral(content, "{metric}", target.getMetricValue());
        content = replaceLiteral(content, "{threshold}", target.getThresholdValue());
        content = replaceLiteral(content, "{reason}", target.getReason());
        content = replaceLiteral(content, "{missingFields}", target.getMissingFields());
        content = replaceLiteral(content, "{duplicateCount}", target.getDuplicateCount());
        return content;
    }

    private String replaceLiteral(String text, String placeholder, Object value) {
        return value == null ? text : text.replace(placeholder, String.valueOf(value));
    }

    private long daysSince(Date date) {
        if (date == null) {
            return 0;
        }
        long millis = System.currentTimeMillis() - date.getTime();
        return millis / (24L * 60L * 60L * 1000L);
    }

    private Date lastUpdate(Date updatedAt, Date createdAt) {
        return updatedAt != null ? updatedAt : createdAt;
    }

    private BigDecimal sumGrantAmount(RecruitSiteProjectEntity project) {
        BigDecimal sum = BigDecimal.ZERO;
        sum = sum.add(valueOf(project.getApprovalGrantAmount()));
        sum = sum.add(valueOf(project.getAcceptanceGrantAmount()));
        sum = sum.add(valueOf(project.getPerformanceGrantAmount1()));
        sum = sum.add(valueOf(project.getPerformanceGrantAmount2()));
        sum = sum.add(valueOf(project.getPerformanceGrantAmount3()));
        return sum;
    }

    private BigDecimal valueOf(BigDecimal value) {
        return value == null ? BigDecimal.ZERO : value;
    }

    private String valueOf(String value) {
        return value == null ? "" : value;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }

    /**
     * 预警落库需要的目标信息，由各校验器组装后统一写库。
     */
    private static class WarningTarget {
        private Integer targetType;
        private Long targetId;
        private Long siteId;
        private Long projectId;
        private Long assetId;
        private String tyshxym;
        private String districtCode;
        private String siteName;
        private String projectName;
        private String assetName;
        private String annualYear;
        private String projectStatus;
        private String assetStatus;
        private Long usageFrequency;
        private String metricValue;
        private String thresholdValue;
        private String warningContent;
        private String reason;
        private String missingFields;
        private Integer duplicateCount;

        public Integer getTargetType() {
            return targetType;
        }

        public void setTargetType(Integer targetType) {
            this.targetType = targetType;
        }

        public Long getTargetId() {
            return targetId;
        }

        public void setTargetId(Long targetId) {
            this.targetId = targetId;
        }

        public Long getSiteId() {
            return siteId;
        }

        public void setSiteId(Long siteId) {
            this.siteId = siteId;
        }

        public Long getProjectId() {
            return projectId;
        }

        public void setProjectId(Long projectId) {
            this.projectId = projectId;
        }

        public Long getAssetId() {
            return assetId;
        }

        public void setAssetId(Long assetId) {
            this.assetId = assetId;
        }

        public String getTyshxym() {
            return tyshxym;
        }

        public void setTyshxym(String tyshxym) {
            this.tyshxym = tyshxym;
        }

        public String getDistrictCode() {
            return districtCode;
        }

        public void setDistrictCode(String districtCode) {
            this.districtCode = districtCode;
        }

        public String getSiteName() {
            return siteName;
        }

        public void setSiteName(String siteName) {
            this.siteName = siteName;
        }

        public String getProjectName() {
            return projectName;
        }

        public void setProjectName(String projectName) {
            this.projectName = projectName;
        }

        public String getAssetName() {
            return assetName;
        }

        public void setAssetName(String assetName) {
            this.assetName = assetName;
        }

        public String getAnnualYear() {
            return annualYear;
        }

        public void setAnnualYear(String annualYear) {
            this.annualYear = annualYear;
        }

        public String getProjectStatus() {
            return projectStatus;
        }

        public void setProjectStatus(String projectStatus) {
            this.projectStatus = projectStatus;
        }

        public String getAssetStatus() {
            return assetStatus;
        }

        public void setAssetStatus(String assetStatus) {
            this.assetStatus = assetStatus;
        }

        public Long getUsageFrequency() {
            return usageFrequency;
        }

        public void setUsageFrequency(Long usageFrequency) {
            this.usageFrequency = usageFrequency;
        }

        public String getMetricValue() {
            return metricValue;
        }

        public void setMetricValue(String metricValue) {
            this.metricValue = metricValue;
        }

        public String getThresholdValue() {
            return thresholdValue;
        }

        public void setThresholdValue(String thresholdValue) {
            this.thresholdValue = thresholdValue;
        }

        public String getWarningContent() {
            return warningContent;
        }

        public void setWarningContent(String warningContent) {
            this.warningContent = warningContent;
        }

        public String getReason() {
            return reason;
        }

        public void setReason(String reason) {
            this.reason = reason;
        }

        public String getMissingFields() {
            return missingFields;
        }

        public void setMissingFields(String missingFields) {
            this.missingFields = missingFields;
        }

        public Integer getDuplicateCount() {
            return duplicateCount;
        }

        public void setDuplicateCount(Integer duplicateCount) {
            this.duplicateCount = duplicateCount;
        }
    }
}
