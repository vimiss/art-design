package com.art.design.common.druid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.filter.config.ConfigTools;
import com.alibaba.druid.pool.DruidDataSource;

public class DruidDataSourceWrapper extends DruidDataSource {
	private static final Logger log = LoggerFactory.getLogger(DruidDataSourceWrapper.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 3400406806671835012L;

	@Override
	public void setUsername(String username) {
		try {
//			username = ConfigTools.decrypt(username);
		} catch (Exception e) {
			log.error("解密连接数据库的用户名发生错误",e);
		}
		super.setUsername(username);
	}
	
	@Override
	public void setPassword(String password) {
		try {
//			password = ConfigTools.decrypt(password);
		} catch (Exception e) {
			log.error("解密连接数据库的密码发生错误",e);
		}
		super.setPassword(password);
	}
}
