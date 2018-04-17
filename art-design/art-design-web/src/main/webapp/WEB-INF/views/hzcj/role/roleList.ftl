<#assign ctx = request.contextPath>
<#include "commons/head.ftl">
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
			</ul>
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
						<li><a href="${ctx}/index">首页</a>
						<li><a href=""></a></li>
						<li></li>
					</ul>
				</div>
<div class="page-content ">
	<div class="row" style="padding-top: 10px;">
	<form action="${ctx}/role/manage/toRoleList" method="POST" id="queryForm">
	<div style="margin-top: 20px;">
		<label style="vertical-align: top; margin-top: 5px;margin-left: 21px;">角色名称：</label>
		<input type="text" name="name" value="${name?if_exists?html}" class="InputName0" maxlength="30">
		<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
	</div>
	
	<div class="col-xs-12">
		<span onclick="addRole()" class="BtnNormalSu default-btn btn-blue">新增角色</span>
		
		<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
	<thead>
	
	<tr role="row">
		<th class="center">
			序号
		</th>
		<th class="center">
			<span class="lbl" title="">角色名称</span>
		</th>
		<th class="center">
			角色编码
		</th>
		<th class="center">
			 描述
		</th>
		<th class="center">
			创建人
		</th>
		<th class="center">
			创建时间
		</th>
		<th class="center">
			操作
		</th>
	</tr>
	</thead>
	<tbody>
	<#if roleList>
	    <#list roleList as role>
		<tr>
			<td class="center">
				<div>${role_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
			</td>
			<td class="center" >
				<div>${role.name}</div>
			</td>
			<td class="center">
				<div>
				<@option name="role_type_param" status="1" type="3" value="${role.code}"/>
				</div>
			</td>
			<td class="center">
				<div>${role.description}</div>
			</td>
			<td class="center">
				<div>${role.userName}</div>
			</td>
			<td class="center">
				<div><@date_sub value='${role.createTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
			</td>
			<td class="center">
				<a href="javascript:;" onclick="updateRole(${role.id})" class="btn btn-primary btn-sm">
											
					<span>编辑</span>
				</a>
				<a href="javascript:;" onclick="assignPermission(${role.id})" class="btn btn-primary btn-sm">
						<span>分配权限</span>
				</a>
				<a href="javascript:;" onclick="deleteRole(${role.id})" class="btn btn-sm btn-danger">
					<span>删除</span>
				</a>
			</td>
		</tr>
	 </#list>
	 <#else>
	 	<tr align="center"><td colspan="6"><font color="red" size="4">没有查询到数据！</font></td></tr>
	</#if>
	</tbody>
</table>
	<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
	<#include "commons/page.ftl">
	</div>
	<div>
	</form>
				</div>
			</div>
		</div>
	</div>
	</fiv>
	</div>
<form id="lastQueryStudentForm" method="post" name="lastQueryForm"  action="${ctx}/role/manage/toRoleList">
	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="name" value="${name}"/>
</form>

<#include "commons/foot.ftl">
<!-- 新增角色 --> 
<div class="modal fade" id="add_role_modal"  data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<!-- 修改角色 --> 
<div class="modal fade" id="update_role_modal"  data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<!-- 分配权限 --> 
<div class="modal fade" id="assign_permission_modal"  data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<!-- Modal -->
<div class="modal fade HoranMyModals" id="delete_role_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="text-center" style="font-size: 24px; padding: 50px 0">您确定要删除吗？</div>
					</div>
				</div>
			</div>
			<div class="modal-footer ">
				<div class="text-center">
					<input id="param" type="hidden">
					<a href="javascript:;" id="deletePackage" class="default-btn btn-orange noBorder marginLR20">确 定</a>
					<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${ctx}/js/hzcj/role.js?v=${jsv}"></script>
<#include "commons/end.ftl">