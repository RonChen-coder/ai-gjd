package com.wondersgroup.shrs.job.corp;

import com.wondersgroup.shrs.job.corp.bpo.CancellationCorpTmpBPO;
import com.wondersgroup.wdls.core.suport.schedul.BaseJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;


/**
 * 过渡期注销单位处理job
 * <p>
 * 外网注销单位有一张名为zp_zxdw的表（里面的数据每天都先删除后插入），里面每天晚上1点钟会将数据同步到内网
 * 原先是打算在内网建一张公共招聘自己的表，里面是全量的zp_zxdw数据，内网程序调用法人库接口更新单位状态
 * 现在的做法是，直接在外网上建一张公共招聘自己的表，里面是全量的zp_zxdw数据，外网调用法人库接口更新单位状态
 *
 * @author chenjinfu
 * @date 2021/7/21 16:13
 **/
@Component
public class CancellationCorpTmpJob extends BaseJob {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    CancellationCorpTmpBPO cancellationCorpTmpBPO;

    /**
     * 定时表达式
     * <p>
     * 每天凌晨2点、4点执行
     * <p>
     * 警告：如果修改执行时间后，请修改实现类里面的删除全表记录的代码，当前做法是，每天的第一次执行会删除全表记录，后续执行都不删除记录
     **/
    private final String corn = "0 0 2,4 * * ?";

    /**
     * 是否立刻执行
     * <p>
     * 如果立刻执行，定时表达式置null，只执行一次
     **/
    private final boolean executeNow = false;

    /**
     * 是否执行该定时任务
     * <p>
     * 除了生产环境会执行，其他环境都不执行
     **/
    @Value("${ggzp.job.corp.execute:false}")
    private boolean execute;

    @Override
    public String getCron() {
        return executeNow ? null : corn;
    }

    @Override
    public void execute() {
        logger.info("CancellationCorpTmpJob是否执行execute=[{}]", execute);
        if (execute) {
            logger.info("过渡期注销单位处理,CancellationCorpTmpJob执行开始,时间=[{}]", new Date());
            cancellationCorpTmpBPO.doCancellationCorpTmp(corn, executeNow);
            logger.info("过渡期注销单位处理,CancellationCorpTmpJob执行结束,时间=[{}]", new Date());
        }
    }


}
