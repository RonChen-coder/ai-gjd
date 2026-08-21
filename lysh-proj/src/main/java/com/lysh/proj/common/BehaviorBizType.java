package com.lysh.proj.common;

/**
 * 行为日志业务对象类型。
 * 当前支持基地、项目、资产三类业务对象。
 */
public enum BehaviorBizType {
    BASE(1, "基地"),
    PROJECT(2, "项目"),
    ASSET(3, "资产");

    private final int code;
    private final String label;

    BehaviorBizType(int code, String label) {
        this.code = code;
        this.label = label;
    }

    public int getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }

    public static BehaviorBizType fromCode(Integer code) {
        if (code == null) {
            return null;
        }
        for (BehaviorBizType type : values()) {
            if (type.code == code) {
                return type;
            }
        }
        return null;
    }
}
