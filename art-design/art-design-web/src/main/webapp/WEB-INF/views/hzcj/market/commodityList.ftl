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
						<form action="${ctx}/commodity/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<div class="col-sm-3">
									<label>商品名称：</label>
									<input type="text" class="InputName0" name="commName" maxlength="40" value="${commodityVo.commName}" placeholder="请输入商品名称" />
								</div>
								<div class="col-sm-3">
									<label>商品编号：</label>
									<input type="text" class="InputName0" name="commNum" value="${commodityVo.commNum}" placeholder="请输入商品编号" />
								</div>
							</div>
							<div class="col-xs-12" style="margin-top:10px;"></div>
							<div class="col-xs-12">
								<div class="col-sm-3">
									<label>商品类型：</label>
									<select class="chosen-select AceSelect" name="commType">
										<@option name="comm_type_param" status="1" value="${commodityVo.commType}"/>
									</select>
								</div>
								<div class="col-sm-6">
									<label>发布时间：</label>
									<input id="start_time" name="startTime" value="${commodityVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
									<input id="end_time" name="endTime" value="${commodityVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>
							</div>
								<div class="col-xs-12 ">
									<span class="BtnNormalSu default-btn btn-blue" onclick="add();">新 增</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="modify();">修 改</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="remove();">删 除</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center" >
												序号
											</th>
											<th class="center" >
												商品编号
											</th>
											<th class="center" >
												商品名称
											</th>
											<th class="center" >
												商品类别
											</th>
											<th class="center" >
												商品类型
											</th>
											<th class="center" >
												积分
											</th>
											<th class="center" >
												总量
											</th>
											<th class="center">
												剩余数量
											</th>
											<th class="center">
												可兑换数量
											</th>
											<th class="center" >
												状态
											</th>
										</tr>
										</thead>
										<tbody>
										<#if commodityList>
											<#list commodityList as commodity>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${commodity.commId}" name="commId" /></div>
												</td>
												<td class="center">
													<div class="aName">${commodity_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${commodity.commNum}</div>
												</td>
												<td class="center">
													<div class="aName">${commodity.commName}</div>
												</td>
												<td class="center">
													<div class="aName">
													<@option name="comm_type_param" status="1" type="3" value="${commodity.commType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
													<@option name="comm_club_param"  method="getCommClubAsOption" status="1" type="3" value="${commodity.commClub}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">${commodity.commPoint}</div>
												</td>
												<td class="center">
													<div class="aName">${commodity.commAmount}</div>
												</td>
												<td class="center">
													<div class="aName">${commodity.commRemNum}</div>
												</td>
												<td class="center">
													<div class="aName">${commodity.commConNum}</div>
												</td>
												<td class="center">
												<div class="aName">
													<@option name="status_param" status="1" type="3" value="${commodity.commState}"/>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="11"><font color="red" size="4">没有查询到数据！</font></td></tr>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/commodity/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="commType" value="${commodityVo.commType}" />
	<input type="hidden" name="commName" value="${commodityVo.commName}" />
	<input type="hidden" name="commNum" value="${commodityVo.commNum}" />
	<input type="hidden" name="startTime" value="${commodityVo.startTime}" />
	<input type="hidden" name="endTime" value="${commodityVo.endTime}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script type="text/javascript">
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function add(){
		$('#catalog_list_modal').html("加载中...").load(ctx+'/commodity/add/page?r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	function remove(){
		var commId = $('input:radio[name="commId"]:checked').val();
		if (!commId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		Modal.confirm({msg:"确认删除吗？",okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/commodity/remove',
                data        : "r="+Math.random()+"&commId=" + commId ,
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
	function modify(){
		var commId = $('input:radio[name="commId"]:checked').val();
		if (!commId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$('#catalog_list_modal').html("加载中...").load(ctx+'/commodity/modify/page?commId='+commId+'&r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">