package com.wondersgroup.shrs.corp.employmentsurpluslack.bpo;

import com.wondersgroup.shrs.common.JB0073CommonCorpUtils;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.shrs.corp.corpinfo.entity.RecruitCorpInfoEntity;
import com.wondersgroup.shrs.corp.employmentsurpluslack.entity.EmploymentLackEntity;
import com.wondersgroup.shrs.corp.employmentsurpluslack.entity.EmploymentSurplusEntity;
import com.wondersgroup.shrs.corp.employmentsurpluslack.model.EmploymentLackData;
import com.wondersgroup.shrs.corp.employmentsurpluslack.model.EmploymentSurplusData;
import com.wondersgroup.shrs.corp.employmentsurpluslack.model.QueryEmploymentLackReqData;
import com.wondersgroup.shrs.corp.employmentsurpluslack.model.QueryEmploymentSurplusReqData;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.BeanUtils;
import com.wondersgroup.wdls.core.util.StringUtils;
import com.wondersgroup.wdls.core.validator.ValidatorUtils;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Author Huang Yongjun
 * @Date 2021/6/18 14:43
 * @Description 单位用工余缺信息
 */
@Service
public class CorpSurplusLackBPOImpl implements CorpSurplusLackBPO {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * @Description 审核状态
     */
    private static final String verifyStatus = "0";


    @Override
    public void saveEmploymentSurplus(EmploymentSurplusData data) {
        logger.debug("单位提交用工剩余申请入参：EmploymentSurplusData=[{}]", data.toString());

        //参数校验
        ValidatorUtils.validate(data);

        if (StringUtils.isBlank(data.getCid())) {
            throw new BusinessException("cid不能为空");
        }

        String cidContext = ShrsContextUtils.getOrganId();
        if (!cidContext.equals(data.getCid())) {
            throw new BusinessException("越权操作");
        }
        RecruitCorpInfoEntity corpInfoEntity = DBUtils.load(RecruitCorpInfoEntity.class,cidContext);
        if (corpInfoEntity==null|| !corpInfoEntity.getCorpName().equals(data.getCorpName()) || !corpInfoEntity.getTyshxym().equals(data.getTyshxym())){
            throw new BusinessException("非法请求");
        }
        Long surplusId = data.getSurplusId();
        //编辑申请信息
        if (surplusId != null) {
            EmploymentSurplusEntity employmentSurplusEntity = DBUtils.load(EmploymentSurplusEntity.class, surplusId);
            BeanUtils.copyPropertiesIgnoreNull(data, employmentSurplusEntity, true);
            DBUtils.save(employmentSurplusEntity);
        } else {
            EmploymentSurplusEntity employmentSurplusEntity = new EmploymentSurplusEntity();

            BeanUtils.copyPropertiesIgnoreNull(data, employmentSurplusEntity, true);

            //设置审批状态、区县
            employmentSurplusEntity.setVerifyStatus(verifyStatus);
            employmentSurplusEntity.setDistrictCode(JB0073CommonCorpUtils.getCorpDistrictByCid(data.getCid(), true));

            DBUtils.save(employmentSurplusEntity);
        }

    }


    @Override
    public void saveEmploymentLack(EmploymentLackData data) {
        logger.debug("单位提交用工缺失申请入参：EmploymentLackData=[{}]", data.toString());

        //参数校验
        ValidatorUtils.validate(data);

        if (StringUtils.isBlank(data.getCid())) {
            throw new BusinessException("cid不能为空");
        }

        String cidContext = ShrsContextUtils.getOrganId();
        if (!cidContext.equals(data.getCid())) {
            throw new BusinessException("越权操作");
        }

        Long lackId = data.getLackId();
        if (lackId != null) {
            //编辑
            EmploymentLackEntity employmentLackEntity = DBUtils.load(EmploymentLackEntity.class, lackId);
            BeanUtils.copyPropertiesIgnoreNull(data, employmentLackEntity, true);
            DBUtils.save(employmentLackEntity);
        } else {
            //新增
            EmploymentLackEntity employmentLackEntity = new EmploymentLackEntity();

            BeanUtils.copyPropertiesIgnoreNull(data, employmentLackEntity, true);

            //设置审批状态、区县
            employmentLackEntity.setVerifyStatus(verifyStatus);
            employmentLackEntity.setDistrictCode(JB0073CommonCorpUtils.getCorpDistrictByCid(data.getCid(), true));

            DBUtils.save(employmentLackEntity);
        }

    }


    @Override
    public PageResult<EmploymentSurplusData> queryEmploymentSurplus(QueryEmploymentSurplusReqData data) {

        if (StringUtils.isBlank(data.getCid())) {
            throw new BusinessException("cid不能为空");
        }

        String cidContext = ShrsContextUtils.getOrganId();
        if (!cidContext.equals(data.getCid())) {
            throw new BusinessException("越权操作");
        }

        //设置分页参数
        PageParam pageParam = null == data.getPageParam() ? new PageParam() : data.getPageParam();
        QueryBuilder qb = new QueryBuilder("/employmenturpluslack/queryEmploymentSurplus");
        qb.parseFilter("cid", data.getCid());
        qb.parseFilter("positionType", data.getPositionType());
        qb.parseFilter("verifyStatus", data.getVerifyStatus());
        PageResult<EmploymentSurplusData> pageResult = qb.getPage(pageParam, EmploymentSurplusData.class);
        return pageResult;
    }


    @Override
    public PageResult<EmploymentLackData> queryEmploymentLack(QueryEmploymentLackReqData data) {
        if (StringUtils.isBlank(data.getCid())) {
            throw new BusinessException("cid不能为空");
        }

        String cidContext = ShrsContextUtils.getOrganId();
        if (!cidContext.equals(data.getCid())) {
            throw new BusinessException("越权操作");
        }

        //设置分页参数
        PageParam pageParam = null == data.getPageParam() ? new PageParam() : data.getPageParam();
        QueryBuilder qb = new QueryBuilder("/employmenturpluslack/queryEmploymentLack");
        qb.parseFilter("cid", data.getCid());
        qb.parseFilter("positionType", data.getPositionType());
        qb.parseFilter("verifyStatus", data.getVerifyStatus());
        PageResult<EmploymentLackData> pageResult = qb.getPage(pageParam, EmploymentLackData.class);
        return pageResult;
    }
}
