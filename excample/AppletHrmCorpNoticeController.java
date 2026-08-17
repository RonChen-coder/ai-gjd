package com.wondersgroup.shrs.qyy.corp.controller;

import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.shrs.common.business.notice.bpo.CommonNoticeBPO;
import com.wondersgroup.shrs.common.business.notice.model.BellCountData;
import com.wondersgroup.shrs.common.business.notice.model.RecruitNoticeBatchReqData;
import com.wondersgroup.shrs.common.business.notice.model.RecruitNoticeReqData;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.web.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Package: com.wondersgroup.shrs.corp
 * @ClassName: HrmCorpNoticeController
 * @Author: xiayuanjun
 * @Description: 单位消息管理
 * @Date: 2021/6/25 15:13
 * @Version: 1.0
 */
@RestController
@RequestMapping("/qyy/corp/notice")
public class AppletHrmCorpNoticeController {

    @Autowired
    CommonNoticeBPO commonNoticeBPO;

    /**
     * 接收类型--单位
     **/
    private static final String RECEIVE_TYPE_CORP = "2";


    /**
     * 单位通知消息查询列表
     *
     * @param data 查询条件
     * @return com.wondersgroup.wdls.web.AjaxResult
     * @author xiayuanjun
     * @date 2021/6/25 17:51
     **/
    @RequestMapping(value = "/queryNoticeList", method = RequestMethod.POST)
    public AjaxResult queryNoticeList(@RequestBody @Validated RecruitNoticeReqData data) {
        data.setReceiveId(ShrsContextUtils.getOrganId());
        // 接收类型为单位
        data.setReceiveType(RECEIVE_TYPE_CORP);

        return AjaxResult.PAGE(commonNoticeBPO.queryNoticeList(data));
    }

    /**
     * 查看通知消息详情
     *
     * @param data 入参
     * @return com.wondersgroup.wdls.web.AjaxResult
     * @author xiayuanjun
     * @date 2021/6/25 10:25
     **/
    @RequestMapping(value = "/queryNoticeDetail", method = RequestMethod.POST)
    public AjaxResult queryNoticeDetail(@RequestBody @Validated RecruitNoticeReqData data) {
        if (null == data.getNoticeId()) {
            throw new BusinessException("noticeId不能为空");
        }
        return AjaxResult.SUCCESS(commonNoticeBPO.doNoticeDetail(data.getNoticeId()));
    }

    /**
     * 通知消息批量设为已读
     *
     * @param data 入参
     * @return com.wondersgroup.wdls.web.AjaxResult
     * @author xiayuanjun
     * @date 2021/6/25 10:25
     **/
    @RequestMapping(value = "/updateBatchReadNotice", method = RequestMethod.POST)
    public AjaxResult updateBatchReadNotice(@RequestBody @Validated RecruitNoticeBatchReqData data) {
        commonNoticeBPO.updateBatchReadNotice(data.getNoticeIdList());
        return AjaxResult.SUCCESS();
    }

    /**
     * 通知消息批量删除
     *
     * @param data 入参
     * @return com.wondersgroup.wdls.web.AjaxResult
     * @author xiayuanjun
     * @date 2021/6/25 10:25
     **/
    @RequestMapping(value = "/deleteBatchNotice", method = RequestMethod.POST)
    public AjaxResult deleteBatchNotice(@RequestBody @Validated RecruitNoticeBatchReqData data) {
        commonNoticeBPO.updateBatchdeleteNotice(data.getNoticeIdList());
        return AjaxResult.SUCCESS();
    }

    /**
     * 获取小铃铛红点数量
     *
     * @param data 查询条件pid
     * @return com.wondersgroup.wdls.web.AjaxResult
     * @author chenjinfu
     * @date 2021/9/28 17:01
     **/
    @RequestMapping(value = "/getBellCount", method = RequestMethod.POST)
    public AjaxResult getBellCount(@RequestBody @Validated BellCountData data) {
        data.setCid(ShrsContextUtils.getOrganId());
        return AjaxResult.SUCCESS(commonNoticeBPO.getBellCount(data));
    }
}
