<!--分页-->
   <input type="hidden" value="${pageView.pageCount}" id="pageCount3"/>
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
		<input type="text" style="height: 30px; width: 40px; text-align: center;vertical-align: top;line-height:30px;padding:0;" id="inputPageNow3" name="inputPageNow3" onkeyup="inputPageNowKeyUp3()" <#if pageView.pageCount!=0>value="${pageView.pageNow}"</#if>>
		<!--<a onclick="addQuestion(31,2)" class="btn btn-primary col-xs-4" href="#">加 &nbsp;&nbsp;&nbsp;&nbsp;题</a>-->
		<a class="btn btn-primary" onClick="checkInputPageNow3()" href="javascript:;" style="border-radius: 0;vertical-align: top;">go</a>
	</div>
	<div class="pager pull-right" style="height:35px;">
		<#if pageView.pageNow==1 || pageView.pageCount==0>
			<a class="disabled pageFen01" >首页</a>
			<a class="disabled pageFen01" >上一页</a>
	    <#else>
	    	<#assign pageBack=pageView.pageNow - 1 />
	    	<a class="pageFen01" href="javascript:;configPageController3('1')">首页</a>
			<a class="pageFen01" href="javascript:;configPageController3('${pageBack}')">上一页</a>
		</#if>
		<#if pageView.pageNow==pageView.pageCount || pageView.pageCount==0>
	    	<a class="disabled pageFen01">下一页</a>
			<a class="disabled pageFen01">尾页</a>
	    <#else>
	    	<#assign pageNext=pageView.pageNow + 1 />
	    	<a class="pageFen01" href="javascript:;configPageController3('${pageNext}')">下一页</a>
			<a class="pageFen01" href="javascript:;configPageController3('${pageView.pageCount}')">尾页</a>
		</#if>
	</div>
   </div>
<script type="text/javascript">
/**
 * value 跳转页数
 */
 var pageNowRegex =  /^[0-9]*[1-9][0-9]*$/;
 function configPageController3(value) {
	var pageCount=$("#pageCount3").val();
	if(value<1){
		value=1;
	}
	if(parseInt(pageCount) != 0 && parseInt(value)>parseInt(pageCount)){
		value=pageCount;
	}
	$("#pageNow3").val(value);
	queryformPage3();
}

function inputPageNowKeyUp3(){
	var inputPageNow = $("#inputPageNow3").val();
	var pageCount = $("#pageCount3").val();
	if(!pageNowRegex.test(inputPageNow) || Number(inputPageNow) > Number(pageCount)){
		$("#inputPageNow3").val("");
	}
}

function checkInputPageNow3(){
	var inputPageNow = $("#inputPageNow3").val();
	var pageCount = $("#pageCount3").val();
	if(pageNowRegex.test(inputPageNow) &&　Number(inputPageNow) <= Number(pageCount)){
		if(inputPageNow != null && inputPageNow != null){
			$("#pageNow3").val(inputPageNow);
		}else{
			$("#pageNow3").val("1");
		}
	}
	queryformPage3();
}
 
function queryformPage3() {
	var common = $("#common").attr("class");
	var school = $("#school").attr("class");
	var personal = $("#personal").attr("class");
	var book = $("#book").attr("class");
	if(validateActive(common)) {
		ajaxQueryQuestion(1);
	}else if(validateActive(school)){
		ajaxQueryQuestion(2);
	}else if(validateActive(personal)){
		ajaxQueryQuestion(3);
	}else if(validateActive(book)){
		ajaxQueryQuestion(4);
	}
 }
 
 function validateActive(obj){
 	var flag = false;
 	if(typeof(obj) != 'undefined' && obj != null && obj !='' && obj.indexOf("active")>=0){
 		flag = true;
 	}
 	return flag;
 }
</script>