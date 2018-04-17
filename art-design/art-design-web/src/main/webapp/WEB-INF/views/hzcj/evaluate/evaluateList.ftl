<#assign ctx = request.contextPath>

<#include "commons/head.ftl">
<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">

			<div id="sidebar" class="sidebar  responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<img src="${ctx}/img/line13.png" style="cursor: pointer">
				</div>
				<ul class="nav nav-list" style="top: 0px;">
					<#include "commons/menu.ftl">
				</ul><!-- /.nav-list -->


				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- 面包屑div -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
							<li><a href="${ctx}/index">首页</a></li>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/evaluate/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label>用户账号：</label>
									<input type="text" name="accoUsername" value="${feedbackInfoVo.accoUsername?if_exists}" class="InputName0" maxlength="20" style="width:200px;">
								</div>
								<div class="col-sm-3" >
									<label>资源类型：</label>
										<select class="chosen-select AceSelect" name="feedType" >
											<@option name="feedback_type_param" status="1" value="${feedbackInfoVo.feedType}"/>
										</select>
								</div>
								 <div class="col-sm-6">
										<label>反馈日期：</label>
										<input id="start_time" name="startTime" value="${feedbackInfoVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${feedbackInfoVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>		
							</div>
								<div class="col-xs-12 ">
									<span id="queryGet" onclick="get();" class="BtnNormalSu default-btn btn-blue">查 看</span>
									<span id="queryRemove" onclick="remove();" class="BtnNormalSu default-btn btn-blue">删 除</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">
												选择
											</th>
											<th class="center">
												序号
											</th>
											<th class="center">
												用户账户
											</th>
											<th class="center">
												资源类型
											</th>
											<th class="center">
												评价内容
											</th>
											<th class="center">
												创建时间
											</th>
										</tr>
										</thead>
										<tbody>
										<#if feedList>
											<#list feedList as feed>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${feed.feedId}" name="feedIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${feed_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${feed.userAccout.accoUsername}</div>
												</td>
												
												<td class="center">
													<div class="aName">
														<@option name="feedback_type_param" status="1" type="3" value="${feed.feedType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">${feed.feedDesc}</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${feed.feedTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="7"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#include "commons/page.ftl">
								</div>
							<!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/evaluate/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="feedType" value="${feedbackInfoVo.feedType}" />
	<input type="hidden" name="accoUsername" value="${feedbackInfoVo.accoUsername}" />
	<input type="hidden" name="startTime" value="${feedbackInfoVo.startTime}" />
	<input type="hidden" name="endTime" value="${feedbackInfoVo.endTime}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	function getRadioInput() {
		var radioInput = $('input:radio[name="feedIdRadio"]:checked').val();
		return radioInput;
	}
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function remove(){
		var feedIdRadio = getRadioInput();
		if (!feedIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认删除吗？",okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/evaluate/remove',
                data        : "r="+Math.random()+"&id=" + feedIdRadio ,
                dataType    : 'json',
                encode      : true
            }).done(function(result) {
                if (result.code == "0") {
                	Modal.alert({msg:"删除成功",okCallback:function(){
                		location.reload();
    					}
    				});
                } else {
                	Modal.alert({msg:result.msg});
                	return false;
                }
            });  
        }
    });  
	}
	function get(){
		var feedIdRadio = getRadioInput();
		if (!feedIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#catalog_list_modal').html("加载中...").load(ctx+'/evaluate/get?id='+feedIdRadio+'&r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">