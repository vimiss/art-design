package com.art.design.service.common;

public class DataSourceContextHolder {
    public static final String DATA_SOURCE_WRITE = "WRITE";
    public static final String DATA_SOURCE_READ = "READ";
    // 线程本地环境
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

    // 设置数据源类型
    public static void setType(String type) {
        contextHolder.set(type);
    }
    // 获取数据源类型
    public static String getType() {
        return (contextHolder.get());
    }
    // 清除数据源类型
    public static void clearType() {
        contextHolder.remove();
    }
}
