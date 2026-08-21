package com.lysh.proj.service;

import com.lysh.proj.common.BehaviorBizType;
import com.lysh.proj.model.RecruitSiteApplyMaterial;
import com.lysh.proj.model.RecruitSiteBehaviorLog;
import com.lysh.proj.model.RecruitSiteInfo;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/**
 * 行为日志记录器。
 * 对比修改前后的字段，仅为实际发生变化的字段生成中文日志。
 */
@Component
public class BehaviorLogRecorder {

    private static final String MODIFY = "修改";

    private final RecruitSiteBehaviorLogBPO behaviorLogBPO;

    public BehaviorLogRecorder(RecruitSiteBehaviorLogBPO behaviorLogBPO) {
        this.behaviorLogBPO = behaviorLogBPO;
    }

    /**
     * 记录基地信息修改或审核的字段变化。
     */
    public void recordSiteInfoChanges(Long siteId, RecruitSiteInfo oldInfo, RecruitSiteInfo newInfo,
                                      String operatorName, String operatorId, String operatorRole,
                                      String operationType) {
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "基地名称", oldInfo.getSiteName(), newInfo.getSiteName());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "企业统一社会信用代码", oldInfo.getTyshxym(), newInfo.getTyshxym());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "单位名称", oldInfo.getCompanyName(), newInfo.getCompanyName());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "挂牌年份", oldInfo.getListingYear(), newInfo.getListingYear());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "基地类别", oldInfo.getSiteCategory(), newInfo.getSiteCategory());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "所属行业类别", oldInfo.getIndustryCategory(), newInfo.getIndustryCategory());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "属地区编码", oldInfo.getDistrictCode(), newInfo.getDistrictCode());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "上级主管部门", oldInfo.getSuperiorDepartment(), newInfo.getSuperiorDepartment());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "基地地址", oldInfo.getSiteAddress(), newInfo.getSiteAddress());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "基地简介", oldInfo.getSiteIntro(), newInfo.getSiteIntro());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "状态", oldInfo.getStatus(), newInfo.getStatus());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "审核人", oldInfo.getReviewer(), newInfo.getReviewer());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "审核意见", oldInfo.getReviewOpinion(), newInfo.getReviewOpinion());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                operationType, "归档状态", oldInfo.getArchiveStatus(), newInfo.getArchiveStatus());
    }

    /**
     * 记录基地申请材料的字段变化，日志归属对应基地。
     */
    public void recordMaterialChanges(Long siteId, RecruitSiteApplyMaterial oldMaterial,
                                      RecruitSiteApplyMaterial newMaterial,
                                      String operatorName, String operatorId, String operatorRole) {
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "关联基地ID", oldMaterial.getSiteId(), newMaterial.getSiteId());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "材料名称", oldMaterial.getMaterialName(), newMaterial.getMaterialName());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "材料说明", oldMaterial.getMaterialDesc(), newMaterial.getMaterialDesc());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "文件名称", oldMaterial.getFileName(), newMaterial.getFileName());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "文件存储key", oldMaterial.getFileStorageKey(), newMaterial.getFileStorageKey());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "材料状态", oldMaterial.getStatus(), newMaterial.getStatus());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "上传人", oldMaterial.getUploaderName(), newMaterial.getUploaderName());
        recordChange(BehaviorBizType.BASE.getCode(), siteId, operatorName, operatorId, operatorRole,
                MODIFY, "上传人编号", oldMaterial.getUploaderId(), newMaterial.getUploaderId());
    }

    /**
     * 字段值发生变化时生成一条中文行为日志。
     */
    public void recordChange(Integer bizType, Long bizId, String operatorName, String operatorId,
                             String operatorRole, String operationType, String fieldName,
                             Object oldValue, Object newValue) {
        String oldText = displayValue(oldValue);
        String newText = displayValue(newValue);
        if (Objects.equals(oldText, newText)) {
            return;
        }
        BehaviorBizType bizTypeEnum = BehaviorBizType.fromCode(bizType);
        String bizTypeLabel = bizTypeEnum == null ? "业务对象" : bizTypeEnum.getLabel();
        String operator = displayValue(operatorName);
        RecruitSiteBehaviorLog log = new RecruitSiteBehaviorLog();
        log.setBizType(bizType);
        log.setBizId(bizId);
        log.setOperatorName(operatorName);
        log.setOperatorId(operatorId);
        log.setOperatorRole(operatorRole);
        log.setOperationType(operationType);
        log.setFieldName(fieldName);
        log.setOldValue(oldText);
        log.setNewValue(newText);
        log.setLogContent("操作人【" + operator + "】" + operationType + "了" + bizTypeLabel +
                "信息字段【" + fieldName + "】，由【" + oldText + "】变更为【" + newText + "】");
        behaviorLogBPO.record(log);
    }

    private String displayValue(Object value) {
        if (value == null) {
            return "空";
        }
        if (value instanceof Date) {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format((Date) value);
        }
        String text = String.valueOf(value).trim();
        return text.isEmpty() ? "空" : text;
    }
}
