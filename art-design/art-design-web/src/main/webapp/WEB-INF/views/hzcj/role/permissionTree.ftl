<#assign ctx = request.contextPath>
<link rel="stylesheet" href="${ctx}/pg/zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${ctx}/pg/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${ctx}/pg/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/pg/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
	var setting = {
			view: {
				selectedMulti: false
			},
			check: {
				enable: true,
				chkStyle: "checkbox",
				radioType: "all"
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback:{
				onCheck:onCheck 
			}
		};

		var zNodes =[];
		var roleId =$("#roleId").val();
		$.ajax({
			type: "POST",
			url: '${ctx}/role/manage/selectPermissionTree',
			data:  {roleId:roleId},
			dataType: 'json',
			async:false,
			success:function(data){
				zNodes = data.data;
			}
		});
		
		function onCheck(e,treeId,treeNode){
			var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
			nodes=treeObj.getCheckedNodes(true),
			v="";
			vv = "";
			for(var i=0;i<nodes.length;i++){
				v+=nodes[i].name + ",";
				vv+=nodes[i].id + ",";
			}
			$("#permissonId").val(vv);//为隐藏域赋选中节点的值
			//return !treeNode.isParent;//当是父节点 返回false 不让选取
		}
		
		function showTree() {
	        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	        var treeNodes = zTree.getNodes();
	        $.ajax({  
		        url : "${ctx}/role/manage/checkedRole",  
		        async: false, 
		        data:{roleId:$('#roleId').val()},
		        type : "POST",  
		        dataType : "json",  
		        success : function(data) {  
		            var id = "";
		            for(var i = 0;i < data.length;i++){
		                if(i==0)
		                    id = data[i];
		                else
		                    id += ","+data[i];  
		                 var treeNode = zTree.getNodeByParam("id", data[i], null);
		                 treeNode.checked = true;
		                 zTree.updateNode(treeNode);
	                }
	                $("#permissonId").val(id);
		        }  
		    });  
       
        }
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            treeObj.expandAll(true);
            showTree();
		});
</script>

<div class="zTreeDemoBackground left">
	<ul id="treeDemo" class="ztree" style="width:720px;" ></ul>
</div>