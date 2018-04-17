<!--分页-->
   <input type="hidden" value="${pageView.pageCount}" id="pageCount"/>
   <div class="col-xs-12 clearfix pageFenye jqueryPage ">
	<div class="pull-left pager">
		<#if pageView.pageCount==0>
			当前第【0 / ${pageView.pageCount}】记录总数【${pageView.rowCount}】
		<#else>
			当前第【${pageView.pageNow} / ${pageView.pageCount}】记录总数【${pageView.rowCount}】
		</#if>
		<!--
			当前第【1/ 1】记录总数【5】
		-->
		<input type="text" style="height: 30px; width: 40px; text-align: center;vertical-align: top;line-height:30px;padding:0;" id="inputPageNow" name="inputPageNow" onkeyup="inputPageNowKeyUp()" <#if pageView.pageCount!=0> value="${pageView.pageNow}"</#if>/>
		<a class="btn btn-primary" onClick="checkInputPageNow()" href="javascript:;" style="border-radius: 0;vertical-align: top;">Go</a>
		<!--
		 跳转至第【】页	
		-->
	</div>
	
	<div class="pager pull-right" style="height:35px;">
		<#if pageView.pageNow==1 || pageView.pageCount==0>
			<a class="disabled pageFen01" >首页</a>
			<a class="disabled pageFen01" >上一页</a>
	    <#else>
	    	<#assign pageBack=pageView.pageNow - 1 />
	    	<a class="pageFen01 greenHover" href="javascript:configPageController('1');">首页</a>
			<a class="pageFen01 greenHover" href="javascript:configPageController('${pageBack}');">上一页</a>
		</#if>
		<#if pageView.pageNow==pageView.pageCount || pageView.pageCount==0>
	    	<a class="disabled pageFen01">下一页</a>
			<a class="disabled pageFen01">尾页</a>
	    <#else>
	    	<#assign pageNext=pageView.pageNow + 1 />
	    	<a class="pageFen01 greenHover" href="javascript:configPageController('${pageNext}');">下一页</a>
			<a class="pageFen01 greenHover" href="javascript:configPageController('${pageView.pageCount}');">尾页</a>
		</#if>
	</div>
   </div>
<script type="text/javascript">
/**
 * value 跳转页数
 */
var pageNowRegex =  /^[0-9]*[1-9][0-9]*$/;
window.onload=function(){
 	var pageNow = '${pageView.pageNow}';
 	var pageCount = '${pageView.pageCount}';
 	if(parseInt(pageCount) != 0 && parseInt(pageNow)>parseInt(pageCount)){
		changePageNow(pageCount);
	}
 };
 
 function changePageNow(value){
 	$("#pageNow").val(value);
	 queryformPage();
 }
 
 function configPageController(value) {
	var pageCount=$("#pageCount").val();
	if(value<1){
		value=1;
	}
	if(parseInt(pageCount) != 0 && parseInt(value)>parseInt(pageCount)){
		value=pageCount;
	}
	$("#pageNow").val(value);
	$("#oldPageNow").val(value);
	queryformPage();
}

function inputPageNowKeyUp(){
	var inputPageNow = $("#inputPageNow").val();
	var pageCount = $("#pageCount").val();
	if(!pageNowRegex.test(inputPageNow) || Number(inputPageNow) > Number(pageCount)){
		$("#inputPageNow").val("");
	}
}

function checkInputPageNow(){
	var inputPageNow = $("#inputPageNow").val();
	var pageCount = $("#pageCount").val();
	if(pageNowRegex.test(inputPageNow) &&　Number(inputPageNow) <= Number(pageCount)){
		if(inputPageNow != null && inputPageNow != null){
			$("#pageNow").val(inputPageNow);
			$("#oldPageNow").val(inputPageNow);
		}else{
			$("#pageNow").vRal("1");
			$("#oldPageNow").val("1");
		}
	}
	queryformPage();
}

function queryformPage() {
	 if($("form").length ==1){
		 $("form").submit();
	 }else if($("#queryForm").length > 0){
		 $("#queryForm").submit();
	 }
 }
</script>