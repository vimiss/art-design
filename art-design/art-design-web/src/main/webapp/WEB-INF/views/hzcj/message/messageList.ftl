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
						<form action="${ctx}/message/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">	
									<div class="col-sm-3">
										<label>消息标题：</label>
										<input type="text" name="messTitle" value="${messageVo.messTitle?if_exists}" class="InputName0" maxlength="20" style="width:200px;">
									</div>
									<div class="col-sm-3">
										<label>消息内容：</label>
										<input type="text" name="messContent" value="${messageVo.messContent?if_exists}" class="InputName0" maxlength="20" style="width:200px;">
									</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;"></div>
								<div class="col-xs-12">	
								 <div class="col-sm-3">
										<label>消息类型：</label>
										<select class="chosen-select AceSelect" name="messType" >
											<@option name="message_type_param" status="1" value="${messageVo.messType}"/>
										</select>
								</div>		
								 <div class="col-sm-6">
										<label>发布时间：</label>
										<input id="start_time" name="startTime" value="${messageVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${messageVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>
							</div>	
							</div>	
								<div class="col-xs-12 ">
									<span class="BtnNormalSu default-btn btn-blue" onclick="add();">新 增</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="modify();">修 改</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="remove();">删 除</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="push();">推 送</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="pushList();">推送统计</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="pushMessage();">发送小秘书消息</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center" >
												序号
											</th>
											<th class="center" >
												消息标题
											</th>
											<th class="center" >
												消息类型
											</th>
											<th class="center" >
												发布时间
											</th>
										</tr>
										</thead>
										<tbody>
										<#if messageList>
											<#list messageList as message>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${message.messId}" name="messId" /></div>
												</td>
												<td class="center">
													<div>${message_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div>${message.messTitle}</div>
												</td>
												<td class="center">
													<div>
													<@option name="message_type_param" status="1" type="3" value="${message.messType}"/>
													</div>
												</td>
												<td class="center">
													<div><@date_sub value='${message.messTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="5"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#include "commons/page.ftl">
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/message/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="messType" value="${messageVo.messType}" />
	<input type="hidden" name="startTime" value="${messageVo.startTime}" />
	<input type="hidden" name="endTime" value="${messageVo.endTime}" />
	<input type="hidden" name="messContent" value="${messageVo.messContent}" />
	<input type="hidden" name="messTitle" value="${messageVo.messTitle}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="user_relation_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function add(){
		$('#catalog_list_modal').html("加载中...").load(ctx+'/message/token/add/page?r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	function remove(){
		var id = $('input:radio[name="messId"]:checked').val();
		if (!id) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		Modal.confirm({msg:"确认删除吗？",okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/message/remove',
                data        : "r="+Math.random()+"&id=" + id ,
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
	function pushMessage(){
		Modal.confirm({msg:"确认发送吗？",okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/message/pushMessage',
                dataType    : 'json',
                encode      : true
            }).done(function(result) {
                if (result.code == "0") {
                	Modal.alert({msg:"发送成功"});
                } else {
                	Modal.alert({msg:result.msg});
                	return false;
                }
            });  
        }
    });  
	}
	function push(id){
		var id = $('input:radio[name="messId"]:checked').val();
		if (!id) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$('#catalog_list_modal').html("加载中...").load(ctx+'/msgPushManagement/msgPush?id='+id+'&type=1',function(){
			$("#catalog_list_modal").modal();
		});
	}
	function modify(){
		var id = $('input:radio[name="messId"]:checked').val();
		if (!id) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$('#catalog_list_modal').html("加载中...").load(ctx+'/message/token/modify/page?id='+id+'&r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	function pushList(param){
		$('#user_relation_list_modal').html("加载中...").load('${ctx}/msgPushManagement/list', param, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_relation_list_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">