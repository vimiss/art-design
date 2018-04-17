<#-- 
	下拉选项获取
	option: 方法名称
	name: 下拉选项的key
	status: 是否使用, 0:未使用, 1:使用中
	code: 暂时供城市下拉用
	method: 自定义的方法名
	type: 1/null/'':搜索条件用, 2:新增用, 3:列表用, 4:同1,但是选项中没有"请选择", 5:禁用下拉用
	value: 需要选中的值
	unit: 可以拼接单位
	show: 要显示的选项, 如多个中间以,分隔
-->
<#macro option name status code method type value unit show>
	<@options name="${name}" status="${status}" code="${code}" method="${method}" show="${show}">
		<#if type == 1 || type == null || type == ''>
			<option value="">请选择</option>
			<#list option_list as opt>
				<#if opt.optionName == value>
				<option value="${opt.optionName}" selected="selected">${opt.optionDesc}</option>
				<#else>
				<option value="${opt.optionName}">${opt.optionDesc}</option>
				</#if>
			</#list>
		<#elseif type == 2>
			<option value="" selected="selected">请选择</option>
			<#list option_list as opt>
				<option value="${opt.optionName}">${opt.optionDesc}</option>
			</#list>
		<#elseif type == 3>
			<#if value == null || value == ''>
--
			<#else>
				<#list option_list as opt>
					<#if opt.optionName == value>
						<#local option_desc="${opt.optionDesc}" />
					</#if>
				</#list>
${option_desc}${unit?default("")}
			</#if>
		<#elseif type == 4>
			<#list option_list as opt>
				<#if opt.optionName == value>
				<option value="${opt.optionName}" selected="selected">${opt.optionDesc}</option>
				<#else>
				<option value="${opt.optionName}">${opt.optionDesc}</option>
				</#if>
			</#list>
		<#elseif type == 5>
			<option value="">--</option>
			<#list option_list as opt>
				<#if opt.optionName == value>
				<option value="${opt.optionName}" selected="selected">${opt.optionDesc}</option>
				<#else>
				<option value="${opt.optionName}">${opt.optionDesc}</option>
				</#if>
			</#list>
		</#if>
	</@options>
</#macro>

<#-- 省市下拉获取 -->
<#macro city_option province city join>
	<@options name="province_type_param" method="getProvinceAsOption" status="" code="" show="">
		<#if province == null || province == ''>
			<#local province_desc="--" />
		<#else>
			<#list option_list as opt>
				<#if opt.optionName == province>
					<#local province_desc="${opt.optionDesc}" />
				</#if>
			</#list>
		</#if>
	</@options>
	<@options name="city_type_param" method="getCityAsOption" code="${province}" status="" show="">
		<#if city == null || city == ''>
			<#local city_desc="--" />
		<#else>
			<#list option_list as opt>
				<#if opt.optionName == city>
					<#local city_desc="${opt.optionDesc}" />
				</#if>
			</#list>
		</#if>
	</@options>
	<#if province_desc == "--">
--
	<#else>
${province_desc}${join}${city_desc}
	</#if>
</#macro>

<#-- 截取字符串显示, 默认10位 -->
<#macro text_sub value length=10>
	<#if value?length gt length>
		<#local result="${value[0..length]+'...'}" />
	<#else>
		<#if value == null || value == "">
			<#local result="--" />
		<#else>
			<#local result="${value}" />
		</#if>
	</#if>
${result}
</#macro>

<#-- 将日期显示2行 -->
<#macro date_sub value>
	<#if value == null || value == "" || value == "--">
--
	<#else>
		<#local year="${value[0..9]}" />
		<#local hour="${value[11..18]}" />
	</#if>
${year}
<#if hour == null || hour == "">
<#else>
<br />${hour}
</#if>
</#macro>
