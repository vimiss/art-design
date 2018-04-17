package com.art.design.web.common.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.art.design.common.exception.SystemException;

public class SystemExceptionHandler implements HandlerExceptionResolver {
	private static final Logger log = LoggerFactory.getLogger(SystemExceptionHandler.class);
	
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("ex", ex);
		log.error("系统错误,请联系管理员",ex);
		if (ex instanceof SystemException) {
			return new ModelAndView("errors/500", model);
		} else {
			return new ModelAndView("errors/500", model);
		}
	}
}
