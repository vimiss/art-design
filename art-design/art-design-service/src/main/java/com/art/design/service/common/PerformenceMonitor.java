package com.art.design.service.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.art.design.common.utils.DateUtil;

@Component
@Aspect
public class PerformenceMonitor {
	
    private final static Logger logger = LoggerFactory.getLogger(PerformenceMonitor.class);
    
    //声明环绕通知
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long begin = DateUtil.getCurrentTime();
        Object o = pjp.proceed();
        long end =  DateUtil.getCurrentTime();
        logger.info(pjp.getTarget().getClass()+"."+pjp.getSignature().getName()+"========"+(end-begin));
        return o;
    }

}
