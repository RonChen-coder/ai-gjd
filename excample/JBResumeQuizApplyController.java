package com.wondersgroup.shrs.admin.corp.controller.manage;

import com.wondersgroup.shrs.admin.corp.manage.entrust.bpo.RecruitQuizBPO;
import com.wondersgroup.shrs.admin.corp.manage.entrust.bpo.RecruitQuizTransBPO;
import com.wondersgroup.shrs.admin.corp.manage.entrust.bpo.RecruitResumeOptBPO;
import com.wondersgroup.shrs.admin.corp.manage.entrust.model.RecResumeData;
import com.wondersgroup.shrs.admin.corp.manage.entrust.model.RecruitApplyQuizModifyReq;
import com.wondersgroup.shrs.admin.corp.manage.entrust.model.RecruitApplyQuizReq;
import com.wondersgroup.shrs.admin.corp.manage.entrust.model.RecruitResumeApplyQuizData;
import com.wondersgroup.shrs.admin.file.model.UploadFileModel;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.shrs.common.business.quiz.RecruitDoQuizListReq;
import com.wondersgroup.shrs.corp.corpinfo.model.RecruitImportRecordParam;
import com.wondersgroup.shrs.district.code.util.DistrictCodeFilterUtil;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.core.util.JsonUtils;
import com.wondersgroup.wdls.core.util.StringUtils;
import com.wondersgroup.wdls.web.AjaxResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriUtils;

import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/admin/resume/quiz/apply")
public class JBResumeQuizApplyController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private RecruitQuizBPO recruitQuizBPO;

    @Autowired
    private RecruitQuizTransBPO recruitQuizTransBPO;
    @Autowired
    private DistrictCodeFilterUtil districtCodeFilterUtil;
    @Autowired
    private RecruitResumeOptBPO recruitResumeOptBPO;
    /**
     * 管理员维护简历初筛情况
     *
     * @param req
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public AjaxResult queryList(@RequestBody @Validated RecruitApplyQuizReq req){
        if (districtCodeFilterUtil.checkAdminDistrictCodePermission("2", ShrsContextUtils.getDistrictCode(),req.getDistrictCode())){
            throw new BusinessException("越权操作");
        }
        return AjaxResult.PAGE(recruitQuizBPO.adminQueryPersonQuizPageList(req));
    }

    /**
     * 对简历初筛做题情况进行导出excel
     * @param req
     * @param response
     * @return
     */
    @RequestMapping(value = "/export",method = RequestMethod.POST)
    public AjaxResult exportRecordList(@RequestBody @Validated RecruitApplyQuizReq req, HttpServletResponse response){

        try {
            if (districtCodeFilterUtil.checkAdminDistrictCodePermission("2", ShrsContextUtils.getDistrictCode(),req.getDistrictCode())){
                throw new BusinessException("越权操作");
            }
            UploadFileModel uploadFileModel = recruitQuizBPO.generatorExportFile(req);

            return this.downloadFile(response, uploadFileModel.getBytes(), uploadFileModel.getName());
        } catch (BusinessException businessException) {
            logger.info("导出重点企业文件失败:{}", businessException.getMessage());
            response.addHeader("Err-Msg", UriUtils.encode(businessException.getMessage(), "UTF-8"));
            return AjaxResult.FAILURE("导出重点企业文件失败");
        }

    }



    public AjaxResult  downloadFile(HttpServletResponse response, byte[] bytes, String filename) {
        try {
            filename = UriUtils.encode(filename, "UTF-8");

            response.setContentType("application/octet-stream");
            String resultFileName = new String(filename.getBytes(StandardCharsets.UTF_8 ),StandardCharsets.ISO_8859_1 );

            //设置下载的文件名
            response.addHeader("Content-Disposition", "attachment;filename=" + resultFileName);
            response.getOutputStream().write(bytes);

        } catch (Exception e) {
            logger.info("导出简历初筛做题情况excel失败:",e);
            response.addHeader("Err-Msg", e.getMessage());
            return AjaxResult.SUCCESS("下载失败");
        }

        return null;
    }

    /**
     * 管理员操作是否通过
     *
     * @param req 请求参数
     * @return
     */
    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    public AjaxResult modifyApplyQuiz(@RequestBody @Validated RecruitApplyQuizModifyReq req){
        //如果是跟职位关联的则直接调用为岗推人接口，里面会自动生成推荐记录、投递记录、发送通知和短信
        //这里就不做花里胡哨的校验了，直接异常捕获，有问题不影响主业务
        BigDecimal applyForId = null;
        try {
            RecruitResumeApplyQuizData applyQuiz = recruitQuizBPO.getApplyQuiz(req.getId());
            if(StringUtils.equals("1", req.getIfPass()) && Objects.nonNull(applyQuiz.getPositionId())){
                RecResumeData data = new RecResumeData();
                data.setPositionId(applyQuiz.getPositionId().toString());
                data.setPidList(Collections.singletonList(applyQuiz.getPid()));
                List<BigDecimal> applyForIds = recruitResumeOptBPO.saveRecResume(data);
                applyForId = applyForIds.get(0);
            }
        }catch (Exception e){
            logger.error("modifyApplyQuiz error,req=[{}]", JsonUtils.toJson(req), e);
        }

        recruitQuizTransBPO.saveAdminModifyQuizResume(req, applyForId);
        return AjaxResult.SUCCESS("操作成功");
    }

    /**
     * 查询做题详情
     *
     * @param req 请求参数
     * @return
     */
    @RequestMapping(value = "/detail",method = RequestMethod.POST)
    public AjaxResult queryApplyQuizDetail(@RequestBody @Validated  RecruitDoQuizListReq req){
        return AjaxResult.SUCCESS(recruitQuizBPO.queryDoQuizList(req,"1"));
    }


}
