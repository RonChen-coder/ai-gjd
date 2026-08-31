package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.math.BigDecimal;

/**
 * 高基地年度绩效评分请求模型。
 */
public class RecruitSiteAnnualPerformanceScoreReq implements ValueObject {
    /** 年度绩效ID */
    private Long performanceId;
    /** 评分 */
    private BigDecimal score;
    /** 评分说明 */
    private String scoreOpinion;

    public Long getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(Long performanceId) {
        this.performanceId = performanceId;
    }

    public BigDecimal getScore() {
        return score;
    }

    public void setScore(BigDecimal score) {
        this.score = score;
    }

    public String getScoreOpinion() {
        return scoreOpinion;
    }

    public void setScoreOpinion(String scoreOpinion) {
        this.scoreOpinion = scoreOpinion;
    }
}
