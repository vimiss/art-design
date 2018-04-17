<#--
	格式化数字, 大于1万的转化成万, 大于1亿的转化成亿
-->
<#macro amount_sub amount type=1>
	<#if type == 1>
		<#if amount == null>
--
		<#else>
${amount?number?string("#,##0.00")}
		</#if>
	<#else>
		<#local num_zero=0 />
		<#local num_one_thousand=10000 />
		<#local num_billion=100000000 />

		<#if amount == null>
			<#local result = num_zero />
			<#local unit="元" />
		<#elseif amount?number gt num_zero && amount?number lt num_one_thousand>
			<#local result="${amount}" />
			<#local unit="元" />
		<#elseif amount?number gte num_one_thousand && amount?number lt num_billion>
			<#local result="${amount?number / 10000}" />
			<#local unit="万" />
		<#elseif amount?number gte num_billion>
			<#local result="${amount?number / 100000000}" />
			<#local unit="亿" />
		<#else>
			<#local result="${amount}" />
			<#local unit="元" />
		</#if>
${result + unit}
	</#if>
</#macro>
