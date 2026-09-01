package com.wondersgroup.shrs.admin.corp.manage.entrust.bpo.impl;

import com.alibaba.excel.EasyExcel;
import com.wondersgroup.shrs.admin.corp.manage.entrust.bpo.RecruitQuizBPO;
import com.wondersgroup.shrs.admin.corp.manage.entrust.entity.RecruitResumeApplyQuizEntity;
import com.wondersgroup.shrs.admin.corp.manage.entrust.model.*;
import com.wondersgroup.shrs.admin.file.model.UploadFileModel;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.shrs.common.business.quiz.ListToStringConverter;
import com.wondersgroup.shrs.common.business.quiz.RecruitDoQuizListReq;
import com.wondersgroup.shrs.common.business.quiz.RecruitPersonQuizData;
import com.wondersgroup.shrs.common.business.quiz.RecruitPersonQuizQueryReq;
import com.wondersgroup.shrs.corp.corpinfo.model.RecruitKeypointCorpExportData;
import com.wondersgroup.wdls.core.annotation.ProviderConfig;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.CollectionUtils;
import com.wondersgroup.wdls.core.util.DateUtils;
import com.wondersgroup.wdls.core.util.StringUtils;
import com.wondersgroup.wdls.data.commons.DBUtils;
import com.wondersgroup.wdls.data.commons.PageParam;
import com.wondersgroup.wdls.data.commons.PageResult;
import com.wondersgroup.wdls.data.sqlquery.QueryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Service
@ProviderConfig(protocol = "hessian",timeout = 150000)
public class RecruitQuizBPOImpl implements RecruitQuizBPO {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final static String ADMIN_TYPE = "1";

    private final static String PERSON_TYPE = "2";

    @Override
    public RecruitResumeApplyQuizData getApplyQuiz(Long id) {
        return DBUtils.get("select * from RECRUIT_RESUME_APPLY_QUIZ where id = ?", RecruitResumeApplyQuizData.class, id);
    }

    @Override
    public RecruitQuizData queryValidRecruitQuizData(String quizId) {
        QueryBuilder queryBuilder = new QueryBuilder("/quiz/queryValidQuiz");
        queryBuilder.parseFilter("quizId", quizId);

        RecruitQuizData result = queryBuilder.getResult(RecruitQuizData.class);

        if (Objects.isNull(result)){
            return null;
        }

        //查询生效的题的选项列表
        QueryBuilder queryItemBuilder = new QueryBuilder("/quiz/queryValidQuizItemList");
        queryItemBuilder.parseFilter("quizId", quizId);
        queryItemBuilder.parseFilter("quizIndexId", result.getId());

        List<RecruitQuizItemData> itemDataList = queryItemBuilder.getList(RecruitQuizItemData.class);

        for (RecruitQuizItemData itemData:itemDataList) {
            itemData.setQuizItemContent(fillContent(itemData.getQuizItemContent()));

        }
        //打乱排序
        Collections.shuffle(itemDataList);
        result.setItemDataList(itemDataList);

        result.setQuizContent(fillContent(result.getQuizContent()));
        return result;
    }
    private String fillContent(String str){
        if (StringUtils.isEmpty(str)){
            return str;
        }
        String[] split = str.split("\\.");
        if (split.length<= 1){
            return str;
        }
        return split[1];
    }

    @Override
    public PageResult<RecruitQuizData> queryPageList(RecruitQuizQueryRequest request) {
        if (Objects.isNull(request)){
           throw new BusinessException("请求参数不能为空");
        }

        PageParam pageParam = request.getPageParam();
        if (Objects.isNull(pageParam)){
            pageParam.setPageIndex(0);
            pageParam.setPageSize(10L);
        }




        QueryBuilder queryBuilder = new QueryBuilder("/quiz/queryValidQuizList");
        queryBuilder.parseFilter("quizId", request.getQuizId());
        queryBuilder.parseFilter("quizContent", StringUtils.isNotEmpty(request.getQuizContent())? request.getQuizContent():null);
        if (Objects.isNull(request.getValidStatus())){
            queryBuilder.parseFilter("validStatus", "1");
        }else {
            queryBuilder.parseFilter("validStatus", request.getValidStatus());
        }

        if (Objects.nonNull(request.getBeginUpdateDate())){
            String beginUpdateDate = DateUtils.format(request.getBeginUpdateDate(), "yyyyMMdd") + "000000";
            queryBuilder.parseFilter("beginUpdateDate",beginUpdateDate);
        }
        if (Objects.nonNull(request.getEndUpdateDate())){
            String endUpdateDate = DateUtils.format(request.getEndUpdateDate(), "yyyyMMdd") + "235959";
            queryBuilder.parseFilter("endUpdateDate", endUpdateDate);
        }


        PageResult<RecruitQuizData> pageResult = queryBuilder.getPage(pageParam, RecruitQuizData.class);

        List<RecruitQuizData> dataList = pageResult.getData();

        for (RecruitQuizData data:dataList) {
            //查询生效的题的选项列表
            List<RecruitQuizItemData> itemDataList = getRecruitQuizItemData(data);
            for (RecruitQuizItemData itemData:itemDataList) {
                itemData.setQuizItemContent(fillContent(itemData.getQuizItemContent()));
            }
            data.setQuizContent(fillContent(data.getQuizContent()));
            data.setItemDataList(itemDataList);

        }

        pageResult.setData(dataList);

        return pageResult;
    }

    @Override
    public PageResult<RecruitQuizData> queryModifyList(RecruitModifyRequestData requestData) {
        if (Objects.isNull(requestData) || StringUtils.isEmpty(requestData.getQuizId())){
            throw new BusinessException("参数不能为空");
        }

        PageParam pageParam = requestData.getPageParam();
        if (Objects.isNull(requestData.getPageParam())){
            pageParam = new PageParam();
            pageParam.setPageSize(10);
            pageParam.setPageIndex(0);
        }

        QueryBuilder queryBuilder = new QueryBuilder("/quiz/queryModifyList");
        queryBuilder.parseFilter("quizId", requestData.getQuizId());
        PageResult<RecruitQuizData> pageResult = queryBuilder.getPage(pageParam, RecruitQuizData.class);
        List<RecruitQuizData> list = pageResult.getData();
        for (RecruitQuizData data:list) {
            //查询生效的题的选项列表
            List<RecruitQuizItemData> itemDataList = getRecruitQuizItemData(data);
            data.setItemDataList(itemDataList);
            for (RecruitQuizItemData itemData:itemDataList) {
                itemData.setQuizItemContent(fillContent(itemData.getQuizItemContent()));
            }
            data.setQuizContent(fillContent(data.getQuizContent()));
        }
        pageResult.setData(list);

        return pageResult;
    }

    private List<RecruitQuizItemData> getRecruitQuizItemData(RecruitQuizData data) {
        QueryBuilder queryItemBuilder = new QueryBuilder("/quiz/queryValidQuizItemList");
        queryItemBuilder.parseFilter("quizId", data.getQuizId());
        queryItemBuilder.parseFilter("quizIndexId", data.getId());
        return queryItemBuilder.getList(RecruitQuizItemData.class);
    }

    @Override
    public PageResult<RecruitPersonQuizData> queryPersonQuizPageList(RecruitPersonQuizQueryReq req) {

        QueryBuilder queryBuilder = new QueryBuilder("/quiz/queryPersonQuizPageList");

        if (StringUtils.isEmpty(ShrsContextUtils.getPid())){
            throw new BusinessException("请重新登录！");
        }
        queryBuilder.parseFilter("pid", ShrsContextUtils.getPid());
     //   queryBuilder.parseFilter("pid", 201608172112410L);
        queryBuilder.parseFilter("positionId",req.getPositionId());
        queryBuilder.parseFilter("positionCode", req.getPositionCode());
        queryBuilder.parseFilter("positionName",req.getPositionName());
        queryBuilder.parseFilter("corpName",req.getCorpName());
        queryBuilder.parseFilter("ifComplete",req.getIfComplete());

        PageParam pageParam = req.getPageParam();
        if (Objects.isNull(pageParam)){
            pageParam= new PageParam();
            pageParam.setPageIndex(0);
            pageParam.setPageSize(10);
        }


        PageResult<RecruitPersonQuizData> page = queryBuilder.getPage(pageParam, RecruitPersonQuizData.class);


        for (RecruitPersonQuizData data: page.getData()) {
            data.setMatchIndustryList(data.convertmatchIndustryList());
            data.setMatchIndustryCodeList(data.convertmatchIndustryCodeList());

        }

        return page;
    }

    @Override
    public List<RecruitQuizDoingData> queryDoQuizList(RecruitDoQuizListReq req, String type) {


       //String pid ="200509151078490";
        if (Objects.isNull(req)){
            throw new BusinessException("参数不能为空");
        }

        RecruitResumeApplyQuizEntity existEntity = DBUtils.get("/quiz/queryResumePidQuiz", RecruitResumeApplyQuizEntity.class,req.getId());

        if (Objects.isNull(existEntity)){
            throw new BusinessException("未找到做题链接");
        }

        if (Objects.equals(type, PERSON_TYPE)){
            if (!Objects.equals(existEntity.getPid(), ShrsContextUtils.getPid())){
                throw new BusinessException("越权错误");
            }
        }


        List<RecruitQuizDoingData> doquizList = getDoquizList(existEntity.getId());

        if (CollectionUtils.isEmpty(doquizList)){
            throw new BusinessException("做题链接题目加载错误");
        }

        // 填充每个题目明细 选项
        for (RecruitQuizDoingData doingData:doquizList) {
            RecruitQuizData quizData = this.queryValidRecruitQuizData(doingData.getQuizId());
            doingData.setRecruitQuizData(quizData);
            doingData.setQuizSnapShotId(existEntity.getId());
        }

        return doquizList;
    }



    /**
     * 获取做题链接的所有题目
     * @param doQuizId
     * @return
     */
    private List<RecruitQuizDoingData> getDoquizList(Long doQuizId) {
        QueryBuilder queryBuilder = new QueryBuilder("/quiz/queryDoQuizList");
        queryBuilder.parseFilter("foreignId", doQuizId);
        return queryBuilder.getList(RecruitQuizDoingData.class);
    }


    @Override
    public PageResult<RecruitPersonQuizData> adminQueryPersonQuizPageList(RecruitApplyQuizReq req) {

        if (Objects.isNull(req)){
            throw new BusinessException("请求参数错误");
        }

        //全市处理
        if (StringUtils.equals("0A", req.getDistrictCode())){
            req.setDistrictCode(null);
        }
        PageParam pageParam = Objects.nonNull(req.getPageParam())? req.getPageParam():new PageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/quiz/adminQueryPersonQuizPageList");
        queryBuilder.parseFilter("districtCode",req.getDistrictCode());
        queryBuilder.parseFilter("positionCode",req.getPositionCode());
        queryBuilder.parseFilter("positionName",req.getPositionName());
        queryBuilder.parseFilter("corpName",req.getCorpName());
        queryBuilder.parseFilter("xm",req.getXm());
        queryBuilder.parseFilter("zjhm",req.getZjhm());
        queryBuilder.parseFilter("ifComplete", req.getIfComplete());
        queryBuilder.parseFilter("ifPass",req.getIfPass());
        queryBuilder.parseFilter("beginTime",req.getBeginTime());
        queryBuilder.parseFilter("endTime", req.getEndTime());
        PageResult<RecruitPersonQuizData> page = queryBuilder.getPage(pageParam, RecruitPersonQuizData.class);


        for (RecruitPersonQuizData data : page.getData()) {
            data.setMatchIndustryList(data.convertmatchIndustryList());
            data.setMatchIndustryCodeList(data.convertmatchIndustryCodeList());

        }
        return page;
    }


    @Override
    public List<RecruitPersonQuizData> adminQueryPersonQuizAllList(RecruitApplyQuizReq req) {
        if (Objects.isNull(req)){
            throw new BusinessException("请求参数错误");
        }

        //全市处理
        if (StringUtils.equals("0A", req.getDistrictCode())){
            req.setDistrictCode(null);
        }
        PageParam pageParam = Objects.nonNull(req.getPageParam())? req.getPageParam():new PageParam();
        QueryBuilder queryBuilder = new QueryBuilder("/quiz/adminQueryPersonQuizPageList");
        queryBuilder.parseFilter("districtCode",req.getDistrictCode());
        queryBuilder.parseFilter("positionCode",req.getPositionCode());
        queryBuilder.parseFilter("positionName",req.getPositionName());
        queryBuilder.parseFilter("corpName",req.getCorpName());
        queryBuilder.parseFilter("xm",req.getXm());
        queryBuilder.parseFilter("zjhm",req.getZjhm());
        queryBuilder.parseFilter("ifComplete", req.getIfComplete());
        queryBuilder.parseFilter("ifPass",req.getIfPass());
        queryBuilder.parseFilter("beginTime",req.getBeginTime());
        queryBuilder.parseFilter("endTime", req.getEndTime());
        List<RecruitPersonQuizData> dataList = queryBuilder.getList( RecruitPersonQuizData.class);


        for (RecruitPersonQuizData data : dataList) {
            data.setMatchIndustryList(data.convertmatchIndustryList());
            data.setMatchIndustryCodeList(data.convertmatchIndustryCodeList());

        }
        return dataList;
    }

    @Override
    public UploadFileModel generatorExportFile(RecruitApplyQuizReq req) {
        Path tempFile =null;
        try {
            List<RecruitPersonQuizData> dataList = this.adminQueryPersonQuizAllList(req);
            if (CollectionUtils.isEmpty(dataList)){
                throw new BusinessException("查询列表为空，导出文件失败");
            }

            tempFile = Files.createTempFile("export_" + DateUtils.getTimeStr(), ".xlsx");

            EasyExcel.write(Files.newOutputStream(tempFile))
                    .head(RecruitPersonQuizData.class)
                    .registerConverter(new ListToStringConverter())
                    .sheet("简历初筛情况")
                    .doWrite(dataList);  // 写入数据
            return new UploadFileModel(tempFile.getFileName().toString(),  Files.readAllBytes(tempFile), Files.probeContentType(tempFile));
        }catch (Exception e){
            logger.error("导出简历初筛情况文件失败：",e);
            throw new BusinessException("导出简历初筛情况文件失败:",e);
        }finally {
            try {
                if (Objects.nonNull(tempFile)){
                    Files.deleteIfExists(tempFile);
                }
            }catch (IOException e){
                logger.error("删除简历初筛情况文件失败：",e);
            }

        }
    }


    /**
     * 获取最近一次的做题详情
     * 200303217066110
     */
    @Override
    public Object queryPersonQuizFirst() {
        QueryBuilder queryBuilder = new QueryBuilder("/quiz/queryPersonQuizFirst");

        if (StringUtils.isEmpty(ShrsContextUtils.getPid())){
            throw new BusinessException("请重新登录");
        }
        queryBuilder.parseFilter("pid", ShrsContextUtils.getPid());
           //queryBuilder.parseFilter("pid", "200303217066110");

        PageParam pageParam = new PageParam();

        PageResult<RecruitPersonQuizData> page = queryBuilder.getPage(pageParam, RecruitPersonQuizData.class);


        for (RecruitPersonQuizData data: page.getData()) {
            data.setMatchIndustryList(data.convertmatchIndustryList());
            data.setMatchIndustryCodeList(data.convertmatchIndustryCodeList());

        }

        return CollectionUtils.isNotEmpty(page.getData())?page.getData().get(0):null;
    }
}
