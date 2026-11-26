package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.math.BigDecimal;
import java.util.List;

/**
 * 高基地运行状况看板数据模型。
 */
public class RecruitSiteDashboardData implements ValueObject {
    /** KPI 汇总数据 */
    private Summary summary;
    /** 区县维度柱状图数据 */
    private List<DistrictStat> districtStats;
    /** 行业分类饼图数据 */
    private List<IndustryStat> industryStats;
    /** 基地项目数分层柱状图数据 */
    private List<BaseProjectStat> baseProjectStats;
    /** 历年资助资金折线图数据 */
    private List<FundTrend> fundTrend;
    /** 项目状态分布数据 */
    private List<ProjectStatusStat> projectStatusStats;
    /** 预警状态分布数据 */
    private List<WarningStat> warningStats;

    public Summary getSummary() {
        return summary;
    }

    public void setSummary(Summary summary) {
        this.summary = summary;
    }

    public List<DistrictStat> getDistrictStats() {
        return districtStats;
    }

    public void setDistrictStats(List<DistrictStat> districtStats) {
        this.districtStats = districtStats;
    }

    public List<IndustryStat> getIndustryStats() {
        return industryStats;
    }

    public void setIndustryStats(List<IndustryStat> industryStats) {
        this.industryStats = industryStats;
    }

    public List<BaseProjectStat> getBaseProjectStats() {
        return baseProjectStats;
    }

    public void setBaseProjectStats(List<BaseProjectStat> baseProjectStats) {
        this.baseProjectStats = baseProjectStats;
    }

    public List<FundTrend> getFundTrend() {
        return fundTrend;
    }

    public void setFundTrend(List<FundTrend> fundTrend) {
        this.fundTrend = fundTrend;
    }

    public List<ProjectStatusStat> getProjectStatusStats() {
        return projectStatusStats;
    }

    public void setProjectStatusStats(List<ProjectStatusStat> projectStatusStats) {
        this.projectStatusStats = projectStatusStats;
    }

    public List<WarningStat> getWarningStats() {
        return warningStats;
    }

    public void setWarningStats(List<WarningStat> warningStats) {
        this.warningStats = warningStats;
    }

    public static class Summary {
        /** 基地总数 */
        private Long siteCount;
        /** 项目总数 */
        private Long projectCount;
        /** 资产总数 */
        private Long assetCount;
        /** 累计资助金额 */
        private BigDecimal totalGrantAmount;
        /** 待处理预警数 */
        private Long pendingWarningCount;

        public Long getSiteCount() {
            return siteCount;
        }

        public void setSiteCount(Long siteCount) {
            this.siteCount = siteCount;
        }

        public Long getProjectCount() {
            return projectCount;
        }

        public void setProjectCount(Long projectCount) {
            this.projectCount = projectCount;
        }

        public Long getAssetCount() {
            return assetCount;
        }

        public void setAssetCount(Long assetCount) {
            this.assetCount = assetCount;
        }

        public BigDecimal getTotalGrantAmount() {
            return totalGrantAmount;
        }

        public void setTotalGrantAmount(BigDecimal totalGrantAmount) {
            this.totalGrantAmount = totalGrantAmount;
        }

        public Long getPendingWarningCount() {
            return pendingWarningCount;
        }

        public void setPendingWarningCount(Long pendingWarningCount) {
            this.pendingWarningCount = pendingWarningCount;
        }
    }

    public static class DistrictStat {
        /** 区县编码 */
        private String districtCode;
        /** 基地数 */
        private Long siteCount;
        /** 项目数 */
        private Long projectCount;
        /** 资助金额 */
        private BigDecimal grantAmount;

        public String getDistrictCode() {
            return districtCode;
        }

        public void setDistrictCode(String districtCode) {
            this.districtCode = districtCode;
        }

        public Long getSiteCount() {
            return siteCount;
        }

        public void setSiteCount(Long siteCount) {
            this.siteCount = siteCount;
        }

        public Long getProjectCount() {
            return projectCount;
        }

        public void setProjectCount(Long projectCount) {
            this.projectCount = projectCount;
        }

        public BigDecimal getGrantAmount() {
            return grantAmount;
        }

        public void setGrantAmount(BigDecimal grantAmount) {
            this.grantAmount = grantAmount;
        }
    }

    public static class IndustryStat {
        /** 行业分类 */
        private String industryCategory;
        /** 基地数 */
        private Long siteCount;
        /** 项目数 */
        private Long projectCount;

        public String getIndustryCategory() {
            return industryCategory;
        }

        public void setIndustryCategory(String industryCategory) {
            this.industryCategory = industryCategory;
        }

        public Long getSiteCount() {
            return siteCount;
        }

        public void setSiteCount(Long siteCount) {
            this.siteCount = siteCount;
        }

        public Long getProjectCount() {
            return projectCount;
        }

        public void setProjectCount(Long projectCount) {
            this.projectCount = projectCount;
        }
    }

    public static class BaseProjectStat {
        /** 基地ID */
        private Long siteId;
        /** 基地名称 */
        private String siteName;
        /** 区县编码 */
        private String districtCode;
        /** 行业分类 */
        private String industryCategory;
        /** 项目数 */
        private Long projectCount;

        public Long getSiteId() {
            return siteId;
        }

        public void setSiteId(Long siteId) {
            this.siteId = siteId;
        }

        public String getSiteName() {
            return siteName;
        }

        public void setSiteName(String siteName) {
            this.siteName = siteName;
        }

        public String getDistrictCode() {
            return districtCode;
        }

        public void setDistrictCode(String districtCode) {
            this.districtCode = districtCode;
        }

        public String getIndustryCategory() {
            return industryCategory;
        }

        public void setIndustryCategory(String industryCategory) {
            this.industryCategory = industryCategory;
        }

        public Long getProjectCount() {
            return projectCount;
        }

        public void setProjectCount(Long projectCount) {
            this.projectCount = projectCount;
        }
    }

    public static class FundTrend {
        /** 年份 */
        private String year;
        /** 资助金额 */
        private BigDecimal grantAmount;

        public String getYear() {
            return year;
        }

        public void setYear(String year) {
            this.year = year;
        }

        public BigDecimal getGrantAmount() {
            return grantAmount;
        }

        public void setGrantAmount(BigDecimal grantAmount) {
            this.grantAmount = grantAmount;
        }
    }

    public static class ProjectStatusStat {
        /** 项目状态 */
        private String status;
        /** 数量 */
        private Long count;

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public Long getCount() {
            return count;
        }

        public void setCount(Long count) {
            this.count = count;
        }
    }

    public static class WarningStat {
        /** 预警状态 */
        private String warningStatus;
        /** 数量 */
        private Long count;

        public String getWarningStatus() {
            return warningStatus;
        }

        public void setWarningStatus(String warningStatus) {
            this.warningStatus = warningStatus;
        }

        public Long getCount() {
            return count;
        }

        public void setCount(Long count) {
            this.count = count;
        }
    }
}
