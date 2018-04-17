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
						<form action="${ctx}/commorder/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<div class="col-sm-3">
									<label>用户账号：</label>
									<input type="text" class="InputName0" name="orderUsername" value="${commOrderVo.orderUsername}" maxlength="40" placeholder="请输入用户账号" />
								</div>
								<div class="col-sm-3">
									<label>订单状态：</label>
									<select class="chosen-select AceSelect" name="ordState">
										<@option name="order_state_param" status="1" value="${commOrderVo.ordState}"/>
									</select>
								</div>
								<div class="col-sm-6">
									<label style="margin-left: 30px">订单时间：</label>
									<input id="start_time" name="startTime" value="${commOrderVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									至
									<input id="end_time" name="endTime" value="${commOrderVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>
							</div>
							
								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >
												序号
											</th>
											<th class="center" >
												用户账号
											</th>
											<th class="center" >
												物品名称
											</th>
											<th class="center" >
												物品数量
											</th>
											<th class="center" >
												消耗积分
											</th>
											<th class="center" >
												兑换日期
											</th>
											<th class="center" >
												订单状态
											</th>
											<th class="center">
												收货人
											</th>
											<th class="center">
												手机
											</th>
											<th class="center" >
												审核人
											</th>
											<th class="center" >
												审核日期
											</th>
											<th class="center" >
												操作
											</th>
										</tr>
										</thead>
										<tbody>
										<#if commOrderList>
											<#list commOrderList as commOrder>
											<tr>
												<td class="center">
													<div class="aName">${commOrder_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${commOrder.orderUsername}</div>
												</td>
												<td class="center">
													<div class="aName">${commOrder.commName}</div>
												</td>
												<td class="center">
													<div class="aName">${commOrder.ordNum}</div>
												</td>
												<td class="center">
													<div class="aName">${commOrder.ordPoint}</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${commOrder.ordTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">
													<@option name="order_state_param" status="1" type="3" value="${commOrder.ordState}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">${commOrder.addrUsername}</div>
												</td>
												<td class="center">
													<div class="aName">${commOrder.addrMobile}</div>
												</td>
													<td class="center">
													<div class="aName">${commOrder.auditUsername}</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${commOrder.auditTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">
													<#if commOrder.ordState=='0'>
													<a class="btn btn-primary btn-sm" onclick="audit(${commOrder.ordId},1);">同意</a>
													<a class="btn btn-primary btn-sm" onclick="audit(${commOrder.ordId},0);">拒绝</a>
													<#else>
														--
													</#if>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="12"><font color="red" size="4">没有查询到数据！</font></td></tr>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/commorder/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="ordState" value="${commOrderVo.ordState}" />
	<input type="hidden" name="orderUsername" value="${commOrderVo.orderUsername}" />
	<input type="hidden" name="startTime" value="${commOrderVo.startTime}" />
	<input type="hidden" name="endTime" value="${commOrderVo.endTime}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function audit(ordId,state){
		var msg="";
		if(state==1){
			msg="确定同意吗？";
		}else{
			msg="确定拒绝吗？";
		}
		Modal.confirm({msg:msg,okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/commorder/modify',
                data        : "ordId="+ordId+"&state=" + state ,
                dataType    : 'json',
                encode      : true
            }).done(function(result) {
                if (result.code == "0") {
                	Modal.alert({msg:"审核成功",okCallback:function(){
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
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">