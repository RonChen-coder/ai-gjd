package com.lysh.proj.job;

import com.lysh.proj.service.RecruitSiteWarningJobBPO;
import com.wondersgroup.wdls.core.suport.schedul.BaseJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 高基地预警定时任务
 * <p>
 * 每天凌晨 2 点执行一次，读取后台维护的启用规则，校验基地、项目、资产三类对象，
 * 命中后生成或更新 RECRUIT_SITE_WARNING 预警结果。实际业务过程封装在 RecruitSiteWarningJobBPO 中。
 *
 * @author lysh
 * @date 2026/8/26
 **/
@Component
public class RecruitSiteWarningJob extends BaseJob {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private RecruitSiteWarningJobBPO recruitSiteWarningJobBPO;

    /**
     * 定时表达式
     * <p>
     * 每天凌晨 2 点执行
     **/
    private final String corn = "0 0 2 * * ?";

    /**
     * 是否立刻执行
     * <p>
     * 如果立刻执行，定时表达式置null，只执行一次
     **/
    private final boolean executeNow = false;

    /**
     * 是否执行该定时任务
     * <p>
     * 默认关闭，生产环境通过配置 ggzp.job.warning.execute=true 开启
     **/
    @Value("${ggzp.job.warning.execute:false}")
    private boolean execute;

    @Override
    public String getCron() {
        return executeNow ? null : corn;
    }

    @Override
    public void execute() {
        logger.info("RecruitSiteWarningJob是否执行execute=[{}]", execute);
        if (execute) {
            logger.info("高基地预警校验，RecruitSiteWarningJob执行开始,时间=[{}]", new Date());
            recruitSiteWarningJobBPO.executeWarningCheck();
            logger.info("高基地预警校验，RecruitSiteWarningJob执行结束,时间=[{}]", new Date());
        }
    }
}
