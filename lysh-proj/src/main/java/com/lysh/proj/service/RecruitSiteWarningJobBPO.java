package com.lysh.proj.service;

/**
 * 高基地预警定时业务处理接口。
 * <p>
 * 定时任务只负责按 cron 触发调度，预警校验、结果生成、查重和落库等实际业务过程全部封装在本接口实现中。
 */
public interface RecruitSiteWarningJobBPO {

    /**
     * 高基地预警校验主业务过程。
     * <p>
     * 编排调用说明：
     * <ul>
     *     <li>1. 读取全部已启用（enabled = 1）的预警规则，按对象类型和排序号升序执行；</li>
     *     <li>2. 解析每条规则的 condition_config（JSON），按 rule_code 路由到对应校验逻辑；</li>
     *     <li>3. 校验命中后，按 (rule_id, target_id) 查找“待处理”预警：</li>
     *     <li>4. 已存在则更新最近触发时间、累计触发次数、实际值和预警文案；</li>
     *     <li>5. 不存在则新增预警记录，记录首次触发时间；</li>
     *     <li>6. 单条规则执行异常不影响其他规则，最后输出本次执行汇总日志。</li>
     * </ul>
     * 该方法由高基地预警定时任务 {@code RecruitSiteWarningJob} 统一调用，无需入参。
     */
    void executeWarningCheck();
}
