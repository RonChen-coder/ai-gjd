package com.lysh.proj.model;

import com.wondersgroup.wdls.core.domain.vo.ValueObject;

import java.util.List;

/**
 * 高基地运行状况看板项目详情模型。
 */
public class RecruitSiteDashboardProjectDetail implements ValueObject {
    /** 项目基本信息 */
    private RecruitSiteProject project;
    /** 项目资产列表 */
    private List<RecruitSiteAsset> assets;
    /** 项目文档列表 */
    private List<RecruitSiteProjectFile> files;

    public RecruitSiteProject getProject() {
        return project;
    }

    public void setProject(RecruitSiteProject project) {
        this.project = project;
    }

    public List<RecruitSiteAsset> getAssets() {
        return assets;
    }

    public void setAssets(List<RecruitSiteAsset> assets) {
        this.assets = assets;
    }

    public List<RecruitSiteProjectFile> getFiles() {
        return files;
    }

    public void setFiles(List<RecruitSiteProjectFile> files) {
        this.files = files;
    }
}
