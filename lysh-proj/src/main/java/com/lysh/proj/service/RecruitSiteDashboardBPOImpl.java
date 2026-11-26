package com.lysh.proj.service;

import com.lysh.proj.entity.RecruitSiteAssetEntity;
import com.lysh.proj.entity.RecruitSiteProjectEntity;
import com.lysh.proj.entity.RecruitSiteWarningEntity;
import com.lysh.proj.model.RecruitSiteAsset;
import com.lysh.proj.model.RecruitSiteDashboardBase;
import com.lysh.proj.model.RecruitSiteDashboardData;
import com.lysh.proj.model.RecruitSiteDashboardProjectDetail;
import com.lysh.proj.model.RecruitSiteDashboardQueryReq;
import com.lysh.proj.model.RecruitSiteInfo;
import com.lysh.proj.model.RecruitSiteProject;
import com.lysh.proj.model.RecruitSiteProjectFile;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 高基地运行状况看板业务处理实现类。
 * 基于现有基地、项目、资产、预警数据在内存中聚合统计。
 */
@Service
public class RecruitSiteDashboardBPOImpl implements RecruitSiteDashboardBPO {

    private static final String DISTRICT_CITY = "00";
    private static final String WARNING_PENDING = "待处理";

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

    private static final String WARNING_COLUMNS = "warning_id, rule_id, rule_code, rule_name, target_type, " +
            "target_id, site_id, project_id, asset_id, tyshxym, district_code, warning_level, warning_status, " +
            "warning_content, metric_value, threshold_value, first_trigger_time, last_trigger_time, " +
            "trigger_count, handle_by, handle_time, handle_remark, created_at, updated_at";

    private final RecruitSiteInfoBPO siteInfoBPO;
    private final RecruitSiteProjectBPO projectBPO;
    private final RecruitSiteAssetBPO assetBPO;
    private final RecruitSiteProjectFileBPO projectFileBPO;

    public RecruitSiteDashboardBPOImpl(RecruitSiteInfoBPO siteInfoBPO,
                                       RecruitSiteProjectBPO projectBPO,
                                       RecruitSiteAssetBPO assetBPO,
                                       RecruitSiteProjectFileBPO projectFileBPO) {
        this.siteInfoBPO = siteInfoBPO;
        this.projectBPO = projectBPO;
        this.assetBPO = assetBPO;
        this.projectFileBPO = projectFileBPO;
    }

    /**
     * 汇总看板全部图表数据。
     * <p>
     * 数据来源为当前权限范围内的基地、项目、资产和预警记录；
     * 统计口径为项目数按所有项目，金额按立项拨付、验收拨付和三年绩效拨付合计。
     */
    @Override
    public RecruitSiteDashboardData getDashboardData(RecruitSiteDashboardQueryReq req) {
        if (req == null) {
            req = new RecruitSiteDashboardQueryReq();
        }
        applyAdminDistrict(req);
        List<RecruitSiteInfo> sites = filterSites(req);
        Set<Long> siteIds = sites.stream().map(RecruitSiteInfo::getSiteId).collect(Collectors.toSet());
        List<RecruitSiteProjectEntity> projects = filterProjectsBySiteIds(siteIds);
        List<RecruitSiteAssetEntity> assets = filterAssetsBySiteIds(siteIds);
        List<RecruitSiteWarningEntity> warnings = filterWarningsBySiteIds(siteIds);

        RecruitSiteDashboardData data = new RecruitSiteDashboardData();
        data.setSummary(buildSummary(sites, projects, assets, warnings));
        data.setDistrictStats(buildDistrictStats(sites, projects));
        data.setIndustryStats(buildIndustryStats(sites, projects));
        data.setBaseProjectStats(buildBaseProjectStats(sites, projects));
        data.setFundTrend(buildFundTrend(projects));
        data.setProjectStatusStats(buildProjectStatusStats(projects));
        data.setWarningStats(buildWarningStats(warnings));
        return data;
    }

    /**
     * 查询符合条件的基地列表。
     * <p>
     * 在筛选后的基地上统计项目数和资产数，并按最低项目数条件过滤。
     */
    @Override
    public List<RecruitSiteDashboardBase> queryBaseList(RecruitSiteDashboardQueryReq req) {
        if (req == null) {
            req = new RecruitSiteDashboardQueryReq();
        }
        applyAdminDistrict(req);
        List<RecruitSiteInfo> sites = filterSites(req);
        Set<Long> siteIds = sites.stream().map(RecruitSiteInfo::getSiteId).collect(Collectors.toSet());
        List<RecruitSiteProjectEntity> projects = filterProjectsBySiteIds(siteIds);
        List<RecruitSiteAssetEntity> assets = filterAssetsBySiteIds(siteIds);
        Map<Long, Long> projectCountMap = countProjectsBySite(projects);
        Map<Long, Long> assetCountMap = countAssetsBySite(assets);
        List<RecruitSiteDashboardBase> result = new ArrayList<>();
        for (RecruitSiteInfo site : sites) {
            long projectCount = projectCountMap.getOrDefault(site.getSiteId(), 0L);
            if (req.getMinProjectCount() != null && projectCount < req.getMinProjectCount()) {
                continue;
            }
            RecruitSiteDashboardBase item = new RecruitSiteDashboardBase();
            item.setSiteId(site.getSiteId());
            item.setSiteName(site.getSiteName());
            item.setCompanyName(site.getCompanyName());
            item.setDistrictCode(site.getDistrictCode());
            item.setIndustryCategory(site.getIndustryCategory());
            item.setProjectCount(projectCount);
            item.setAssetCount(assetCountMap.getOrDefault(site.getSiteId(), 0L));
            result.add(item);
        }
        return result;
    }

    /**
     * 查询项目详情及关联资产、文档。
     * <p>
     * 先按管理端权限校验项目属地区，再复用项目、资产、文件服务组装下钻详情。
     */
    @Override
    public RecruitSiteDashboardProjectDetail getProjectDetail(Long projectId) {
        if (projectId == null) {
            throw new BusinessException("项目ID不能为空");
        }
        RecruitSiteProject project = projectBPO.queryProjectById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkAdminDistrict(project.getDistrictCode());
        List<RecruitSiteAsset> assets = assetBPO.queryAssetList(projectId);
        List<RecruitSiteProjectFile> files = projectFileBPO.queryProjectFilesByProjectId(projectId);
        RecruitSiteDashboardProjectDetail detail = new RecruitSiteDashboardProjectDetail();
        detail.setProject(project);
        detail.setAssets(assets);
        detail.setFiles(files);
        return detail;
    }

    /**
     * 汇总顶部 KPI 卡片数据。
     */
    private RecruitSiteDashboardData.Summary buildSummary(List<RecruitSiteInfo> sites,
                                                          List<RecruitSiteProjectEntity> projects,
                                                          List<RecruitSiteAssetEntity> assets,
                                                          List<RecruitSiteWarningEntity> warnings) {
        RecruitSiteDashboardData.Summary summary = new RecruitSiteDashboardData.Summary();
        summary.setSiteCount((long) sites.size());
        summary.setProjectCount((long) projects.size());
        summary.setAssetCount((long) assets.size());
        BigDecimal amount = BigDecimal.ZERO;
        for (RecruitSiteProjectEntity project : projects) {
            amount = amount.add(sumGrantAmount(project));
        }
        summary.setTotalGrantAmount(amount);
        long pending = warnings.stream()
                .filter(w -> WARNING_PENDING.equals(w.getWarningStatus()))
                .count();
        summary.setPendingWarningCount(pending);
        return summary;
    }

    /**
     * 按区县统计基地数、项目数和资助金额。
     */
    private List<RecruitSiteDashboardData.DistrictStat> buildDistrictStats(List<RecruitSiteInfo> sites,
                                                                           List<RecruitSiteProjectEntity> projects) {
        Map<String, RecruitSiteDashboardData.DistrictStat> map = new LinkedHashMap<>();
        for (RecruitSiteInfo site : sites) {
            RecruitSiteDashboardData.DistrictStat stat = map.computeIfAbsent(site.getDistrictCode(), k -> {
                RecruitSiteDashboardData.DistrictStat s = new RecruitSiteDashboardData.DistrictStat();
                s.setDistrictCode(k);
                s.setSiteCount(0L);
                s.setProjectCount(0L);
                s.setGrantAmount(BigDecimal.ZERO);
                return s;
            });
            stat.setSiteCount(stat.getSiteCount() + 1);
        }
        for (RecruitSiteProjectEntity project : projects) {
            RecruitSiteInfo site = findSiteById(sites, project.getSiteId());
            if (site == null) {
                continue;
            }
            RecruitSiteDashboardData.DistrictStat stat = map.get(site.getDistrictCode());
            if (stat == null) {
                continue;
            }
            stat.setProjectCount(stat.getProjectCount() + 1);
            stat.setGrantAmount(stat.getGrantAmount().add(sumGrantAmount(project)));
        }
        return new ArrayList<>(map.values());
    }

    /**
     * 按行业分类统计基地数和项目数。
     */
    private List<RecruitSiteDashboardData.IndustryStat> buildIndustryStats(List<RecruitSiteInfo> sites,
                                                                           List<RecruitSiteProjectEntity> projects) {
        Map<String, RecruitSiteDashboardData.IndustryStat> map = new LinkedHashMap<>();
        for (RecruitSiteInfo site : sites) {
            RecruitSiteDashboardData.IndustryStat stat = map.computeIfAbsent(site.getIndustryCategory(), k -> {
                RecruitSiteDashboardData.IndustryStat s = new RecruitSiteDashboardData.IndustryStat();
                s.setIndustryCategory(k);
                s.setSiteCount(0L);
                s.setProjectCount(0L);
                return s;
            });
            stat.setSiteCount(stat.getSiteCount() + 1);
        }
        for (RecruitSiteProjectEntity project : projects) {
            RecruitSiteInfo site = findSiteById(sites, project.getSiteId());
            if (site == null) {
                continue;
            }
            RecruitSiteDashboardData.IndustryStat stat = map.get(site.getIndustryCategory());
            if (stat != null) {
                stat.setProjectCount(stat.getProjectCount() + 1);
            }
        }
        return new ArrayList<>(map.values());
    }

    /**
     * 统计每个基地包含的项目数，用于基地项目数分层柱状图。
     */
    private List<RecruitSiteDashboardData.BaseProjectStat> buildBaseProjectStats(List<RecruitSiteInfo> sites,
                                                                                 List<RecruitSiteProjectEntity> projects) {
        Map<Long, Long> countMap = countProjectsBySite(projects);
        List<RecruitSiteDashboardData.BaseProjectStat> result = new ArrayList<>();
        for (RecruitSiteInfo site : sites) {
            RecruitSiteDashboardData.BaseProjectStat stat = new RecruitSiteDashboardData.BaseProjectStat();
            stat.setSiteId(site.getSiteId());
            stat.setSiteName(site.getSiteName());
            stat.setDistrictCode(site.getDistrictCode());
            stat.setIndustryCategory(site.getIndustryCategory());
            stat.setProjectCount(countMap.getOrDefault(site.getSiteId(), 0L));
            result.add(stat);
        }
        return result;
    }

    /**
     * 按拨付时间所属年份归集历年资助资金。
     */
    private List<RecruitSiteDashboardData.FundTrend> buildFundTrend(List<RecruitSiteProjectEntity> projects) {
        Map<String, BigDecimal> yearAmountMap = new LinkedHashMap<>();
        for (RecruitSiteProjectEntity project : projects) {
            addGrant(yearAmountMap, project.getApprovalGrantTime(), project.getApprovalGrantAmount());
            addGrant(yearAmountMap, project.getAcceptanceGrantTime(), project.getAcceptanceGrantAmount());
            addGrant(yearAmountMap, project.getPerformanceGrantTime1(), project.getPerformanceGrantAmount1());
            addGrant(yearAmountMap, project.getPerformanceGrantTime2(), project.getPerformanceGrantAmount2());
            addGrant(yearAmountMap, project.getPerformanceGrantTime3(), project.getPerformanceGrantAmount3());
        }
        List<RecruitSiteDashboardData.FundTrend> result = new ArrayList<>();
        yearAmountMap.forEach((year, amount) -> {
            RecruitSiteDashboardData.FundTrend trend = new RecruitSiteDashboardData.FundTrend();
            trend.setYear(year);
            trend.setGrantAmount(amount);
            result.add(trend);
        });
        return result;
    }

    /**
     * 统计项目状态分布。
     */
    private List<RecruitSiteDashboardData.ProjectStatusStat> buildProjectStatusStats(List<RecruitSiteProjectEntity> projects) {
        Map<String, Long> map = new HashMap<>();
        for (RecruitSiteProjectEntity project : projects) {
            String status = project.getProjectStatus();
            map.put(status, map.getOrDefault(status, 0L) + 1);
        }
        List<RecruitSiteDashboardData.ProjectStatusStat> result = new ArrayList<>();
        map.forEach((status, count) -> {
            RecruitSiteDashboardData.ProjectStatusStat stat = new RecruitSiteDashboardData.ProjectStatusStat();
            stat.setStatus(status);
            stat.setCount(count);
            result.add(stat);
        });
        return result;
    }

    /**
     * 统计预警状态分布。
     */
    private List<RecruitSiteDashboardData.WarningStat> buildWarningStats(List<RecruitSiteWarningEntity> warnings) {
        Map<String, Long> map = new HashMap<>();
        for (RecruitSiteWarningEntity warning : warnings) {
            String status = warning.getWarningStatus();
            map.put(status, map.getOrDefault(status, 0L) + 1);
        }
        List<RecruitSiteDashboardData.WarningStat> result = new ArrayList<>();
        map.forEach((status, count) -> {
            RecruitSiteDashboardData.WarningStat stat = new RecruitSiteDashboardData.WarningStat();
            stat.setWarningStatus(status);
            stat.setCount(count);
            result.add(stat);
        });
        return result;
    }

    private void addGrant(Map<String, BigDecimal> yearAmountMap, Date time, BigDecimal amount) {
        if (time == null || amount == null) {
            return;
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(time);
        String year = String.valueOf(calendar.get(Calendar.YEAR));
        yearAmountMap.put(year, yearAmountMap.getOrDefault(year, BigDecimal.ZERO).add(amount));
    }

    private BigDecimal sumGrantAmount(RecruitSiteProjectEntity project) {
        BigDecimal sum = BigDecimal.ZERO;
        sum = sum.add(nullToZero(project.getApprovalGrantAmount()));
        sum = sum.add(nullToZero(project.getAcceptanceGrantAmount()));
        sum = sum.add(nullToZero(project.getPerformanceGrantAmount1()));
        sum = sum.add(nullToZero(project.getPerformanceGrantAmount2()));
        sum = sum.add(nullToZero(project.getPerformanceGrantAmount3()));
        return sum;
    }

    private BigDecimal nullToZero(BigDecimal value) {
        return value == null ? BigDecimal.ZERO : value;
    }

    private Map<Long, Long> countProjectsBySite(List<RecruitSiteProjectEntity> projects) {
        Map<Long, Long> map = new HashMap<>();
        for (RecruitSiteProjectEntity project : projects) {
            map.put(project.getSiteId(), map.getOrDefault(project.getSiteId(), 0L) + 1);
        }
        return map;
    }

    private Map<Long, Long> countAssetsBySite(List<RecruitSiteAssetEntity> assets) {
        Map<Long, Long> map = new HashMap<>();
        for (RecruitSiteAssetEntity asset : assets) {
            map.put(asset.getSiteId(), map.getOrDefault(asset.getSiteId(), 0L) + 1);
        }
        return map;
    }

    private RecruitSiteInfo findSiteById(List<RecruitSiteInfo> sites, Long siteId) {
        for (RecruitSiteInfo site : sites) {
            if (site.getSiteId().equals(siteId)) {
                return site;
            }
        }
        return null;
    }

    /**
     * 按区县和行业筛选基地。
     */
    private List<RecruitSiteInfo> filterSites(RecruitSiteDashboardQueryReq req) {
        List<RecruitSiteInfo> sites = siteInfoBPO.listAll();
        return sites.stream()
                .filter(s -> isBlank(req.getDistrictCode()) || req.getDistrictCode().equals(s.getDistrictCode()))
                .filter(s -> isBlank(req.getIndustryCategory()) || req.getIndustryCategory().equals(s.getIndustryCategory()))
                .collect(Collectors.toList());
    }

    /**
     * 查询并过滤指定基地范围内的项目。
     */
    private List<RecruitSiteProjectEntity> filterProjectsBySiteIds(Set<Long> siteIds) {
        List<RecruitSiteProjectEntity> projects = DBUtils.query(
                "SELECT " + PROJECT_COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT",
                RecruitSiteProjectEntity.class);
        return projects.stream().filter(p -> siteIds.contains(p.getSiteId())).collect(Collectors.toList());
    }

    /**
     * 查询并过滤指定基地范围内的资产。
     */
    private List<RecruitSiteAssetEntity> filterAssetsBySiteIds(Set<Long> siteIds) {
        List<RecruitSiteAssetEntity> assets = DBUtils.query(
                "SELECT " + ASSET_COLUMNS + " FROM wsbs.RECRUIT_SITE_ASSET",
                RecruitSiteAssetEntity.class);
        return assets.stream().filter(a -> siteIds.contains(a.getSiteId())).collect(Collectors.toList());
    }

    /**
     * 查询并过滤指定基地范围内的预警。
     */
    private List<RecruitSiteWarningEntity> filterWarningsBySiteIds(Set<Long> siteIds) {
        List<RecruitSiteWarningEntity> warnings = DBUtils.query(
                "SELECT " + WARNING_COLUMNS + " FROM wsbs.RECRUIT_SITE_WARNING",
                RecruitSiteWarningEntity.class);
        return warnings.stream().filter(w -> siteIds.contains(w.getSiteId())).collect(Collectors.toList());
    }

    private void applyAdminDistrict(RecruitSiteDashboardQueryReq req) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict)) {
            return;
        }
        if (isBlank(currentDistrict)) {
            throw new BusinessException("当前管理员未配置属地区");
        }
        req.setDistrictCode(currentDistrict);
    }

    private void checkAdminDistrict(String districtCode) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict)) {
            return;
        }
        if (isBlank(currentDistrict) || !currentDistrict.equals(districtCode)) {
            throw new BusinessException("数据越权");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
