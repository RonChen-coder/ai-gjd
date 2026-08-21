package com.lysh.proj.model;

/**
 * 文件下载模型。
 * 用于承载文件系统返回的文件名称、内容和类型。
 */
public class RecruitGJDFileModel {
    /** 文件名称 */
    private String name;
    /** 文件字节内容 */
    private byte[] bytes;
    /** 文件类型 */
    private String contentType;

    public RecruitGJDFileModel() {
    }

    public RecruitGJDFileModel(String name, byte[] bytes, String contentType) {
        this.name = name;
        this.bytes = bytes;
        this.contentType = contentType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
}
