<!--分页-->
   <input type="hidden" value="${pageView.pageCount}" id="pageCount2"/>
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
		<input type="text" style="height: 30px; width: 40px; text-align: center;vertical-align: top;line-height:30px;padding:0;" id="inputPageNow2" name="inputPageNow" onkeyup="inputPageNowKeyUp2()" <#if pageView.pageCount!=0>value="${pageView.pageNow}"</#if>>
		<a class="btn btn-primary" onClick="checkInputPageNow2()" href="javascript:;" style="border-radius: 0;vertical-align: top;">go</a>
	</div>
	<div class="pager pull-right" style="height:35px;">
		<#if pageView.pageNow==1  || pageView.pageCount==0>
			<a class="disabled pageFen01" >首页</a>
			<a class="disabled pageFen01" >上一页</a>
	    <#else>
	    	<#assign pageBack=pageView.pageNow - 1 />
	    	<a class="pageFen01" href="javascript:;configPageController2('1')">首页</a>
			<a class="pageFen01" href="javascript:;configPageController2('${pageBack}')">上一页</a>
		</#if>
		<#if pageView.pageNow==pageView.pageCount || pageView.pageCount==0>
	    	<a class="disabled pageFen01">下一页</a>
			<a class="disabled pageFen01">尾页</a>
	    <#else>
	    	<#assign pageNext=pageView.pageNow + 1 />
	    	<a class="pageFen01" href="javascript:;configPageController2('${pageNext}')">下一页</a>
			<a class="pageFen01" href="javascript:;configPageController2('${pageView.pageCount}')">尾页</a>
		</#if>
	</div>
   </div>
<script type="text/javascript">
/**
 * value 跳转页数
 */
 var pageNowRegex2 =  /^[0-9]*[1-9][0-9]*$/;
 window.onload=function(){
 	var pageNow = '${pageView.pageNow}';
 	var pageCount = '${pageView.pageCount}';
 	if(parseInt(pageCount) != 0 && parseInt(pageNow)>parseInt(pageCount)){
		changePageNow2(pageCount);
	}
 };
 
 function changePageNow2(value){
 	$("#pageNow2").val(value);
	 queryformPage2();
 }
 function configPageController2(value) {
	var pageCount=$("#pageCount2").val();
	if(value<1){
		value=1;
	}
	if(parseInt(pageCount) != 0 && parseInt(value)>parseInt(pageCount)){
		value=pageCount;
	}
	$("#pageNow2").val(value);
	$("#oldPageNow2").val(value);
	 queryformPage2();

}
function inputPageNowKeyUp2(){
	var inputPageNow = $("#inputPageNow2").val();
	var pageCount = $("#pageCount2").val();
	if(!pageNowRegex2.test(inputPageNow) || Number(inputPageNow) > Number(pageCount)){
		$("#inputPageNow2").val("");
	}
}

function checkInputPageNow2(){
	var inputPageNow = $("#inputPageNow2").val();
	var pageCount = $("#pageCount2").val();
	if(pageNowRegex2.test(inputPageNow) &&　Number(inputPageNow) <= Number(pageCount)){
		if(inputPageNow != null && inputPageNow != null){
			$("#pageNow2").val(inputPageNow);
			$("#oldPageNow2").val(inputPageNow);
		}else{
			$("#pageNow2").val("1");
			$("#oldPageNow2").val(inputPageNow);
		}
	}
	queryformPage2();
}

 function queryformPage2() {
	
 }
</script>