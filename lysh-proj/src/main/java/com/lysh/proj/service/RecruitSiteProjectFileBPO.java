package com.lysh.proj.service;

import com.lysh.proj.model.RecruitSiteProjectFile;

import java.util.List;

/**
 * 高基地项目文件业务处理接口。
 * 管理端支持上传、修改、下载；企业端支持上传、修改、下载和删除。
 */
public interface RecruitSiteProjectFileBPO {

    /**
     * 管理端新增项目文件记录，fileStorageKey 由文件上传接口返回。
     *
     * @param file 项目文件请求体
     * @return 创建后的项目文件
     */
    RecruitSiteProjectFile uploadByAdmin(RecruitSiteProjectFile file);

    /**
     * 企业端新增当前单位项目文件记录，fileStorageKey 由文件上传接口返回。
     *
     * @param file 项目文件请求体
     * @return 创建后的项目文件
     */
    RecruitSiteProjectFile uploadByCorp(RecruitSiteProjectFile file);

    /**
     * 管理端修改项目文件。
     *
     * @param file 待更新的项目文件
     * @return 更新后的项目文件
     */
    RecruitSiteProjectFile updateByAdmin(RecruitSiteProjectFile file);

    /**
     * 企业端修改当前单位项目文件。
     *
     * @param file 待更新的项目文件
     * @return 更新后的项目文件
     */
    RecruitSiteProjectFile updateByCorp(RecruitSiteProjectFile file);

    /**
     * 管理端根据文件ID查询项目文件。
     *
     * @param fileId 文件主键ID
     * @return 项目文件
     */
    RecruitSiteProjectFile findById(Long fileId);

    /**
     * 企业端根据文件ID查询当前单位项目文件。
     *
     * @param fileId 文件主键ID
     * @return 项目文件
     */
    RecruitSiteProjectFile findCorpById(Long fileId);

    /**
     * 管理端查询项目文件列表。
     *
     * @param projectId 项目主键ID
     * @return 项目文件列表
     */
    List<RecruitSiteProjectFile> listByProjectId(Long projectId);

    /**
     * 企业端查询当前单位项目文件列表。
     *
     * @param projectId 项目主键ID
     * @return 项目文件列表
     */
    List<RecruitSiteProjectFile> listCorpByProjectId(Long projectId);

    /**
     * 企业端删除项目文件，同时删除文件存储。
     *
     * @param fileId 文件主键ID
     */
    void deleteByCorp(Long fileId);
}
