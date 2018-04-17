var resourcesIdStr = "";
var setting = {
	check : {
		enable : true
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback: {
		onCheck:hideInfo
	}
};
var code;

function hideInfo(){
	$("#checkAddResourcesTree").html("");
	$("#checkModifyResourcesTree").html("");
}

function setCheck(treeId) {
	var zTree = $.fn.zTree.getZTreeObj(treeId), py = $("#py").attr("checked") ? "p"
			: "", sy = $("#sy").attr("checked") ? "s" : "", pn = $("#pn").attr(
			"checked") ? "p" : "", sn = $("#sn").attr("checked") ? "s" : "", type = {
		"Y" : py + sy,
		"N" : pn + sn
	};
	zTree.setting.check.chkboxType = type;
	showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "'
			+ type.N + '" };');
}

function showCode(str) {
	if (!code)
		code = $("#code");
	code.empty();
	code.append("<li>" + str + "</li>");
}
function zTreeOnCheck(e, treeId, treeNode) {
	resourcesIdStr = "";
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	nodes = treeObj.getCheckedNodes(true);
	for ( var int = 0; int < nodes.length; int++) {
		var node = nodes[int];
		if (node.checked == true) {
			var nodeId = node.id;
			if (resourcesIdStr == "") {
				resourcesIdStr = nodeId;
			} else {
				resourcesIdStr = resourcesIdStr + "," + nodeId;
			}
		}
	}
}
$(document)
		.ready(
				function() {
					$("#addResourcesRoleName").keyup(function(){
						if($("#addResourcesRoleName").val().trim()!=""){
							$("#checkAddResourcesRoleName").html("");
						};
					});

					$("#addRole").click(
							function() {
								//$("#queryRoleName")[0].value = "";
								$.fn.zTree.init($("#addResourcesTree"),
										setting, addRoleTree);
								$("#addResourcesRoleName").val("");
								$("#description").val("");
								 $("span.help-block").each(function(){
									 $(this).html("");
								 });
							});

					$("#addRoleBtn")
							.click(
									function() {
										var roleName = $("#addResourcesRoleName")[0].value;
										var description = $("#description").val();
										
										if(!(/^[a-zA-Z0-9\u4E00-\u9FA5]{2,20}$/).test(roleName)){
											$("#checkAddResourcesRoleName").html("角色名称必须为：2~20 位字母、数字或中文.");
											return;
									 	}
										var tempResourcesIdStr = "";
										var treeObj = $.fn.zTree
												.getZTreeObj("addResourcesTree");
										if (treeObj == null || treeObj == "") {
											$("#checkAddResourcesTree").html("请选择资源!");
											return;
										}
										var nodes = treeObj.getCheckedNodes(true);
										if (nodes == null || nodes == "") {
											$("#checkAddResourcesTree").html("请选择资源!");
											return;
										}
										for ( var int = 0; int < nodes.length; int++) {
											var node = nodes[int];
											if (node.checked == true) {
												var nodeId = node.id;
												if (tempResourcesIdStr == "") {
													tempResourcesIdStr = nodeId;
												} else {
													tempResourcesIdStr = tempResourcesIdStr
															+ "," + nodeId;
												}
											}
										}
										if (tempResourcesIdStr == "") {
											$("#checkAddResourcesTree").html("请选择资源!");
											return;
										}
										$.ajax({
													type : "POST",
													url : ctx+"/authority/role/checkRoleName",
													data : "roleName="
															+ roleName
															+ "&description="
															+ description,
													async : false,
													dataType:"json",
													error : function(request) {
														alert("Connection error");
														location.reload();
													},
													success : function(data) {
														if (data == "1") {
															$("#checkAddResourcesRoleName").html("重复的角色名!");
															return;
														} else {
															$.ajax({
																		type : "POST",
																		url : ctx+"/authority/role/addRole",
																		data : "roleName="
																				+ roleName
																				+ "&resourcesIdStr="
																				+ tempResourcesIdStr
																				+ "&description="
																				+ description,
																		async : false,
																		error : function(
																				request) {
																			bootbox.alert("Connection error",function(){
																			});
																			location
																					.reload();
																		},
																		success : function(data) {
																			$("#add_role_info").modal("hide");
																			bootbox.alert("添加成功!",function(){
																				location.reload();
																			});
																		}
																	});
														}
													}
												});
									});


					$("#modifyRoleBtn").click(function() {
										var tempResourcesIdStr = "";
										var treeObj = $.fn.zTree
												.getZTreeObj("modifyResourcesTree");
										if (treeObj == null || treeObj == "") {
											$("#checkModifyResourcesTree").html("请选择资源!");
											return;
										}
										var nodes = treeObj
												.getCheckedNodes(true);
										if (nodes == null || nodes == "") {
											$("#checkModifyResourcesTree").html("请选择资源!");
											return;
										}
										var description = $("#modifydescription").val();
										for ( var int = 0; int < nodes.length; int++) {
											var node = nodes[int];
											if (node.checked == true) {
												var nodeId = node.id;
												if (tempResourcesIdStr == "") {
													tempResourcesIdStr = nodeId;
												} else {
													tempResourcesIdStr = tempResourcesIdStr
															+ "," + nodeId;
												}
											}
										}
										var roleId = $("#modifyRoleId")[0].value;
										if (roleId == null || roleId == "") {
											bootbox.alert("数据异常,请刷新页面!");
											return;
										}
										var roleName = $("#modifyRoleName")[0].value;
										if(!(/^[a-zA-Z0-9\u4E00-\u9FA5]{2,20}$/).test(roleName)){
											$("#checkModifyRoleName").html("角色名称必须为：2~20 位字母、数字或中文.");
											return;
									 	}
										$
												.ajax({
													type : "POST",
													data : "isUpdate=true&roleId="
															+ roleId
															+ "&roleName="
															+ roleName,
													url : ctx+"/authority/role/checkRoleName",
													async : false,
													dataType:"json",
													error : function(request) {
														alert("Connection error");
														location.reload();
													},
													success : function(data) {
														if (data == "1") {
															$("#checkModifyRoleName").html("重复的角色名!");
															return;
														} else {
															$
																	.ajax({
																		type : "POST",
																		url : ctx+"/authority/role/updateRole",
																		data : "roleName="
																				+ roleName
																				+ "&resourcesIdStr="
																				+ tempResourcesIdStr
																				+ "&roleId="
																				+ roleId
																				+ "&description="
																				+ description,
																		async : false,
																		error : function(
																				request) {
																			alert("Connection error");
																			location
																					.reload();
																		},
																		success : function(
																				data) {
																			$("#update_role_info").modal("hide");
																			bootbox.alert("修改成功!",function(){
																				location.reload();
																			});
																		}
																	});
														}
													}
												});
									});

					$("#queryRoleBtn").click(function() {
						$("#greyBackGround").css("display", "none");
						$("#queryRoleDiv").css("display", "none");

					});
					$("#queryRoleBtnCancel").click(function() {
						$("#greyBackGround").css("display", "none");
						$("#queryRoleDiv").css("display", "none");

					});

					$("#queryRole").click(function() {
						$("#queryForm").submit();
					});
				});

function queryRole(roleId, roleName, description) {
	$("#queryRoleName")[0].value = roleName;
	$("#querydescription").val(description);
	/*
	 * if(receiveCustom=="1"){
	 * 
	 * $("#queryReceiveCustom").val(receiveCustom);
	 * 
	 * }else{
	 *  }
	 */
	$.ajax({
		type : "POST",
		url : ctx+"/authority/role/getRoleById",
		data : "roleId=" + roleId,
		async : false,
		error : function(request) {
			alert("Connection error");
			//location.reload();
		},
		success : function(data) {
			var queryRoleTree = eval(data);
			$.fn.zTree.init($("#queryResourcesTree"), setting, queryRoleTree);
			
            var treeObj = $.fn.zTree.getZTreeObj("queryResourcesTree");  
          //  var disabledNode = treeObj.getNodeByParam("level", 0);  
            var nodes =treeObj.getNodes();
            for(var i=0;i<nodes.length;i++){
            	if(nodes[i]!= undefined){
            		treeObj.setChkDisabled(nodes[i], true);
            		var treeNode =nodes[i].children;
            		//判断是否有下级节点
            		if(treeNode&&treeNode.length>0){
            			setDisable(treeObj,treeNode);
            		}
            	}
			}
          //  treeObj.setChkDisabled(disabledNode, true);     
			$("#greyBackGround").css("display", "block");
			$("#queryRoleDiv").fadeIn("slow");
		}
	});
};
function setDisable(treeObj,nodes){
	for(var j=0;j<nodes.length;j++){
		treeObj.setChkDisabled(nodes[j], true);
		var treeNode =nodes[j].children;
		if(treeNode && treeNode.length>0){
			setDisable(treeObj,treeNode);
		}
	}
}
function modifyRole(roleId, roleName, description) {
	$("#modifyRoleId")[0].value = roleId;
	$("#modifyRoleName")[0].value = roleName;
	$("#modifydescription").val(description);
	 $("span.help-block").each(function(){
		 $(this).html("");
	 });
	$
			.ajax({
				type : "POST",
				url : ctx+"/authority/role/getRoleById",
				data : "roleId=" + roleId,
				async : false,
				error : function(request) {
					alert("Connection error");
					location.reload();
				},
				success : function(data) {
					var modifyRoleTree = eval(data);
					$.fn.zTree.init($("#modifyResourcesTree"), setting,
							modifyRoleTree);
/*					$("#greyBackGround").css("display", "block");
					$("#modifyRoleDiv").fadeIn("slow");*/
				}
			});
};

function delRole(roleId) {
	$.ajax({
		type : "POST",
		url : ctx+"/authority/role/delRole",
		data : "roleId=" + roleId,
		async : false,
		dataType:"json",
		error : function(data) {
			bootbox.alert("Connection error");
			//location.reload();
		},
		success : function(data) {
			if (!data["success"]) {
				bootbox.alert("有员工正在使用此角色,您不能删除!");
				return;
			}
			bootbox.alert("删除成功!",function(){
				location.reload();
			});
		}
	});
};

function getRoleList(pageNow) {
	$("#pageNow")[0].value = pageNow;
	$("#queryForm").submit();
}