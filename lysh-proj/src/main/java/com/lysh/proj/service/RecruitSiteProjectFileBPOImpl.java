package com.lysh.proj.service;

import com.lysh.proj.common.BehaviorBizType;
import com.lysh.proj.entity.RecruitSiteProjectFileEntity;
import com.lysh.proj.model.RecruitSiteProject;
import com.lysh.proj.model.RecruitSiteProjectFile;
import com.wondersgroup.shrs.common.ShrsContextUtils;
import com.wondersgroup.wdls.core.exception.BusinessException;
import com.wondersgroup.wdls.data.commons.DBUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 高基地项目文件业务处理实现类。
 * 上传下载复用文件服务，删除文件时同步删除文件存储。
 */
@Service
public class RecruitSiteProjectFileBPOImpl implements RecruitSiteProjectFileBPO {

    private static final String DISTRICT_CITY = "00";
    private static final String COLUMNS = "file_id, project_id, project_status, file_name, file_desc, " +
            "file_storage_key, uploader_name, uploader_id, created_at, updated_at";

    private final RecruitFileUploadBPO fileUploadBPO;
    private final RecruitSiteProjectBPO projectBPO;
    private final BehaviorLogRecorder behaviorLogRecorder;

    public RecruitSiteProjectFileBPOImpl(RecruitFileUploadBPO fileUploadBPO,
                                         RecruitSiteProjectBPO projectBPO,
                                         BehaviorLogRecorder behaviorLogRecorder) {
        this.fileUploadBPO = fileUploadBPO;
        this.projectBPO = projectBPO;
        this.behaviorLogRecorder = behaviorLogRecorder;
    }

    @Override
    public RecruitSiteProjectFile uploadByAdmin(RecruitSiteProjectFile file) {
        validateCreateParams(file);
        RecruitSiteProject project = projectBPO.findById(file.getProjectId());
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + file.getProjectId());
        }
        checkAdminDistrict(project.getDistrictCode());
        Date now = new Date();
        file.setUploaderName(currentAdminOperatorName());
        file.setUploaderId(ShrsContextUtils.getUserId());
        file.setCreatedAt(now);
        file.setUpdatedAt(now);
        insert(file);
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), file.getProjectId(),
                file.getUploaderName(), file.getUploaderId(), "管理员", "上传",
                "项目文件", null, file.getFileName());
        return file;
    }

    @Override
    public RecruitSiteProjectFile uploadByCorp(RecruitSiteProjectFile file) {
        validateCreateParams(file);
        RecruitSiteProject project = projectBPO.findCorpById(file.getProjectId());
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + file.getProjectId());
        }
        Date now = new Date();
        String operatorName = currentCorpOperatorName("单位用户");
        file.setUploaderName(operatorName);
        file.setUploaderId(ShrsContextUtils.getOrganId());
        file.setCreatedAt(now);
        file.setUpdatedAt(now);
        insert(file);
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), file.getProjectId(),
                file.getUploaderName(), file.getUploaderId(), "基地申报单位", "上传",
                "项目文件", null, file.getFileName());
        return file;
    }

    @Override
    public RecruitSiteProjectFile updateByAdmin(RecruitSiteProjectFile file) {
        if (file.getFileId() == null) {
            throw new BusinessException("项目文件ID不能为空");
        }
        RecruitSiteProjectFile old = findFile(file.getFileId());
        if (old == null) {
            throw new BusinessException("项目文件不存在: " + file.getFileId());
        }
        checkFileProjectBinding(old, file);
        RecruitSiteProject project = projectBPO.findById(old.getProjectId());
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + old.getProjectId());
        }
        checkAdminDistrict(project.getDistrictCode());
        mergeFileFields(old, file);
        file.setUpdatedAt(new Date());
        String oldStorageKey = old.getFileStorageKey();
        update(file);
        deleteOldStorageIfChanged(oldStorageKey, file.getFileStorageKey());
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), file.getProjectId(),
                currentAdminOperatorName(), ShrsContextUtils.getUserId(), "管理员", "修改",
                "项目文件", old.getFileName(), file.getFileName());
        return file;
    }

    @Override
    public RecruitSiteProjectFile updateByCorp(RecruitSiteProjectFile file) {
        if (file.getFileId() == null) {
            throw new BusinessException("项目文件ID不能为空");
        }
        RecruitSiteProjectFile old = findFile(file.getFileId());
        if (old == null) {
            throw new BusinessException("项目文件不存在: " + file.getFileId());
        }
        checkCorpProject(old.getProjectId());
        checkFileProjectBinding(old, file);
        mergeFileFields(old, file);
        file.setUpdatedAt(new Date());
        String oldStorageKey = old.getFileStorageKey();
        update(file);
        deleteOldStorageIfChanged(oldStorageKey, file.getFileStorageKey());
        String operatorName = currentCorpOperatorName("单位用户");
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), file.getProjectId(),
                operatorName, ShrsContextUtils.getOrganId(), "基地申报单位", "修改",
                "项目文件", old.getFileName(), file.getFileName());
        return file;
    }

    @Override
    public RecruitSiteProjectFile findById(Long fileId) {
        RecruitSiteProjectFile file = findFile(fileId);
        if (file != null) {
            checkAdminProject(file.getProjectId());
        }
        return file;
    }

    @Override
    public RecruitSiteProjectFile findCorpById(Long fileId) {
        RecruitSiteProjectFile file = findFile(fileId);
        if (file != null) {
            checkCorpProject(file.getProjectId());
        }
        return file;
    }

    @Override
    public List<RecruitSiteProjectFile> listByProjectId(Long projectId) {
        checkAdminProject(projectId);
        return queryByProjectId(projectId);
    }

    @Override
    public List<RecruitSiteProjectFile> listCorpByProjectId(Long projectId) {
        checkCorpProject(projectId);
        return queryByProjectId(projectId);
    }

    @Override
    public void deleteByCorp(Long fileId) {
        RecruitSiteProjectFile file = findFile(fileId);
        if (file == null) {
            throw new BusinessException("项目文件不存在: " + fileId);
        }
        checkCorpProject(file.getProjectId());
        fileUploadBPO.deleteFileModel(file.getFileStorageKey());
        DBUtils.execSql("DELETE FROM wsbs.RECRUIT_SITE_PROJECT_FILE WHERE file_id = ?", fileId);
        String operatorName = currentCorpOperatorName("单位用户");
        behaviorLogRecorder.recordChange(BehaviorBizType.PROJECT.getCode(), file.getProjectId(),
                operatorName, ShrsContextUtils.getOrganId(), "基地申报单位", "删除",
                "项目文件", file.getFileName(), null);
    }

    private void validateCreateParams(RecruitSiteProjectFile file) {
        if (file == null) {
            throw new BusinessException("项目文件不能为空");
        }
        if (file.getProjectId() == null) {
            throw new BusinessException("项目ID不能为空");
        }
        if (isBlank(file.getProjectStatus())) {
            throw new BusinessException("项目状态不能为空");
        }
        if (isBlank(file.getFileName())) {
            throw new BusinessException("文件名称不能为空");
        }
        if (isBlank(file.getFileStorageKey())) {
            throw new BusinessException("文件存储key不能为空");
        }
    }

    private void checkFileProjectBinding(RecruitSiteProjectFile old, RecruitSiteProjectFile file) {
        if (file.getProjectId() != null && !old.getProjectId().equals(file.getProjectId())) {
            throw new BusinessException("项目文件创建后不能变更关联项目");
        }
        file.setProjectId(old.getProjectId());
    }

    private void mergeFileFields(RecruitSiteProjectFile old, RecruitSiteProjectFile file) {
        if (isBlank(file.getProjectStatus())) {
            file.setProjectStatus(old.getProjectStatus());
        }
        if (isBlank(file.getFileName())) {
            file.setFileName(old.getFileName());
        }
        if (isBlank(file.getFileDesc())) {
            file.setFileDesc(old.getFileDesc());
        }
        if (isBlank(file.getFileStorageKey())) {
            file.setFileStorageKey(old.getFileStorageKey());
        }
    }

    private void insert(RecruitSiteProjectFile file) {
        DBUtils.execSql("INSERT INTO wsbs.RECRUIT_SITE_PROJECT_FILE " +
                "(file_id, project_id, project_status, file_name, file_desc, file_storage_key, " +
                "uploader_name, uploader_id, created_at, updated_at) " +
                "VALUES (wsbs.SEQ_0073_RECRUIT_SITE_PROJECT_FILE.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                file.getProjectId(),
                file.getProjectStatus(),
                file.getFileName(),
                file.getFileDesc(),
                file.getFileStorageKey(),
                file.getUploaderName(),
                file.getUploaderId(),
                file.getCreatedAt(),
                file.getUpdatedAt());
        file.setFileId(Long.valueOf(DBUtils.getString("SELECT wsbs.SEQ_0073_RECRUIT_SITE_PROJECT_FILE.CURRVAL FROM DUAL")));
    }

    private void update(RecruitSiteProjectFile file) {
        DBUtils.execSql("UPDATE wsbs.RECRUIT_SITE_PROJECT_FILE SET " +
                "project_status = ?, file_name = ?, file_desc = ?, file_storage_key = ?, updated_at = ? " +
                "WHERE file_id = ?",
                file.getProjectStatus(),
                file.getFileName(),
                file.getFileDesc(),
                file.getFileStorageKey(),
                file.getUpdatedAt(),
                file.getFileId());
    }

    private void deleteOldStorageIfChanged(String oldStorageKey, String newStorageKey) {
        if (oldStorageKey != null && !oldStorageKey.equals(newStorageKey)) {
            fileUploadBPO.deleteFileModel(oldStorageKey);
        }
    }

    private RecruitSiteProjectFile findFile(Long fileId) {
        RecruitSiteProjectFileEntity entity = DBUtils.get(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT_FILE WHERE file_id = ?",
                RecruitSiteProjectFileEntity.class, fileId);
        return toModel(entity);
    }

    private List<RecruitSiteProjectFile> queryByProjectId(Long projectId) {
        List<RecruitSiteProjectFileEntity> entities = DBUtils.query(
                "SELECT " + COLUMNS + " FROM wsbs.RECRUIT_SITE_PROJECT_FILE " +
                        "WHERE project_id = ? ORDER BY created_at DESC, file_id DESC",
                RecruitSiteProjectFileEntity.class, projectId);
        return toModels(entities);
    }

    private void checkAdminProject(Long projectId) {
        RecruitSiteProject project = projectBPO.findById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
        checkAdminDistrict(project.getDistrictCode());
    }

    private void checkCorpProject(Long projectId) {
        RecruitSiteProject project = projectBPO.findCorpById(projectId);
        if (project == null) {
            throw new BusinessException("项目信息不存在: " + projectId);
        }
    }

    private void checkAdminDistrict(String districtCode) {
        String currentDistrict = ShrsContextUtils.getDistrictCode();
        if (DISTRICT_CITY.equals(currentDistrict)) {
            return;
        }
        if (isBlank(currentDistrict) || !currentDistrict.equals(districtCode)) {
            throw new BusinessException("数据越权");
        }
    }

    private List<RecruitSiteProjectFile> toModels(List<RecruitSiteProjectFileEntity> entities) {
        List<RecruitSiteProjectFile> models = new ArrayList<>();
        for (RecruitSiteProjectFileEntity entity : entities) {
            models.add(toModel(entity));
        }
        return models;
    }

    private RecruitSiteProjectFile toModel(RecruitSiteProjectFileEntity entity) {
        if (entity == null) {
            return null;
        }
        RecruitSiteProjectFile model = new RecruitSiteProjectFile();
        model.setFileId(entity.getFileId());
        model.setProjectId(entity.getProjectId());
        model.setProjectStatus(entity.getProjectStatus());
        model.setFileName(entity.getFileName());
        model.setFileDesc(entity.getFileDesc());
        model.setFileStorageKey(entity.getFileStorageKey());
        model.setUploaderName(entity.getUploaderName());
        model.setUploaderId(entity.getUploaderId());
        model.setCreatedAt(entity.getCreatedAt());
        model.setUpdatedAt(entity.getUpdatedAt());
        return model;
    }

    private String currentAdminOperatorName() {
        String userId = ShrsContextUtils.getUserId();
        return isBlank(userId) ? "管理员" : userId;
    }

    private String currentCorpOperatorName(String fallback) {
        String name = ShrsContextUtils.getOrganName();
        return isBlank(name) ? fallback : name;
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
