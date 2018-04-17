<!--分页-->
   <input type="hidden" value="${pageView_ajax.pageCount}" id="pageCount_ajax"/>
   <div class="col-xs-12 clearfix pageFenye jqueryPage ">
	<div class="pull-left pager">
		<#if pageView_ajax.pageCount==0>
			当前第【0 / ${pageView_ajax.pageCount}】记录总数【${pageView_ajax.rowCount}】
		<#else>
			当前第【${pageView_ajax.pageNow} / ${pageView_ajax.pageCount}】记录总数【${pageView_ajax.rowCount}】
		</#if>
		<!--
			当前第【1/ 1】记录总数【5】
		-->
		<input type="text" style="height: 30px; width: 40px; text-align: center;vertical-align: top;line-height:30px;padding:0;" id="inputPageNow_ajax" name="inputPageNow_ajax" onkeyup="inputPageNowKeyUp_ajax()" <#if pageView_ajax.pageCount!=0>value="${pageView_ajax.pageNow}"</#if>>
		<a class="btn btn-primary" onClick="checkInputPageNow_ajax()" href="javascript:;" style="border-radius: 0;vertical-align: top;">go</a>
	</div>
	<div class="pager pull-right" style="height:35px;">
		<#if pageView_ajax.pageNow==1 || pageView_ajax.pageCount==0>
			<a class="disabled pageFen01" >首页</a>
			<a class="disabled pageFen01" >上一页</a>
	    <#else>
	    	<#assign pageBack=pageView_ajax.pageNow - 1 />
	    	<a class="pageFen01" href="javascript:;configPageController_ajax('1')">首页</a>
			<a class="pageFen01" href="javascript:;configPageController_ajax('${pageBack}')">上一页</a>
		</#if>
		<#if pageView_ajax.pageNow==pageView_ajax.pageCount || pageView_ajax.pageCount==0>
	    	<a class="disabled pageFen01">下一页</a>
			<a class="disabled pageFen01">尾页</a>
	    <#else>
	    	<#assign pageNext=pageView_ajax.pageNow + 1 />
	    	<a class="pageFen01" href="javascript:;configPageController_ajax('${pageNext}')">下一页</a>
			<a class="pageFen01" href="javascript:;configPageController_ajax('${pageView_ajax.pageCount}')">尾页</a>
		</#if>
	</div>
   </div>
<script type="text/javascript">
/**
 * value 跳转页数
 */
 var pageNowRegex =  /^[0-9]*[1-9][0-9]*$/;
 function configPageController_ajax(value) {
	var pageCount=$("#pageCount_ajax").val();
	if(value<1){
		value=1;
	}
	if(parseInt(pageCount) != 0 && parseInt(value)>parseInt(pageCount)){
		value=pageCount;
	}
	$("#pageNow_ajax").val(value);
	queryformPage_ajax();
}

function inputPageNowKeyUp_ajax(){
	var inputPageNow = $("#inputPageNow_ajax").val();
	var pageCount = $("#pageCount_ajax").val();
	if(!pageNowRegex.test(inputPageNow) || Number(inputPageNow) > Number(pageCount)){
		$("#inputPageNow_ajax").val("");
	}
}

function checkInputPageNow_ajax(){
	var inputPageNow = $("#inputPageNow_ajax").val();
	var pageCount = $("#pageCount_ajax").val();
	if(pageNowRegex.test(inputPageNow) &&　Number(inputPageNow) <= Number(pageCount)){
		if(inputPageNow != null && inputPageNow != null){
			$("#pageNow_ajax").val(inputPageNow);
		}else{
			$("#pageNow_ajax").val("1");
		}
	}
	queryformPage_ajax();
}

/* 
function queryformPage_ajax() {
	if ($("form").length ==1) {
		 $("form").submit();
	 } else if ($("#queryForm_ajax").length > 0) {
		 $("#queryForm_ajax").submit();
	 }
 }
 */

</script>