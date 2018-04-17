package com.art.design.service.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

@Component
@Aspect()
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class DynamicDataSourceAspect {

    private final static Logger logger= LoggerFactory.getLogger(DynamicDataSourceAspect.class);

    public void switchReadDataSource(JoinPoint point){
      // 获取到当前执行的方法名
        String methodName = point.getSignature().getName();
        logger.info("设置当前方法为读库 的方法名："+methodName);
        DataSourceContextHolder.setType(DataSourceContextHolder.DATA_SOURCE_READ);
    }

    public void switchWriteDataSource(JoinPoint point){

        // 获取到当前执行的方法名
        String methodName = point.getSignature().getName();
        logger.info("设置当前方法为写库 的方法名："+methodName);
        DataSourceContextHolder.setType(DataSourceContextHolder.DATA_SOURCE_WRITE);
    }

    public void clearDataSourceContextHolder(JoinPoint point){

        // 获取到当前执行的方法名
        String methodName = point.getSignature().getName();
        logger.info("执行完当前方法清空数据源 :"+DataSourceContextHolder.getType()+" 的方法名："+methodName);
        DataSourceContextHolder.clearType();
    }

}