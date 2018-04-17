<#assign ctx = request.contextPath>
<#include "commons/head.ftl">
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>
	</div>

	<div class="page-content">
		
		<div class="page-content">
		    <div style="color:red; font-size:22px;">${message_login}</div>  
			请您不要重复提交！
		</div>
		
	</div>
</div>
<#include "commons/foot.ftl">
<!--body html end-->
<#include "commons/end.ftl">