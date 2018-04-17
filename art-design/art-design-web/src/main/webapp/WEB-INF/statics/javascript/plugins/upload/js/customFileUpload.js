
;var customFileUpload = {
		/**
		 * 
		 * @param options 选项配置
		 */
		upload:function(options,custom){
			var opt = {};
			var customOpt = {};
			
			var defaultCustom = {
					selector:"#file_upload",//jquery对象选择器
					contextPath:"/",//项目路径
					fileListID:"file_list",//文件列表id
					fieldNameMap:{"fileId":"fileId",//根据配置动态生成隐藏域
								"fileName":"fileName",
								"filePath":"filePath",
								"fileType":"fileType"
							  }
			};
			$.extend(customOpt,defaultCustom,custom);
			
			
			var defaultOpt = {
					"swf":"/js/upload/res/uploadify.swf",
					"uploader":"/ppp/resources/upload",
					"auto":true,
					"progressData":"speed",
					"removeCompleted":true,
					"removeTimeout":1,
					"multi":false,
					"method":"post",
					"fileObjName":"uploadFile",
					//"buttonImage":"",
					"buttonText":"请选择上传文件",
					"fileSizeLimit" : "200MB",//KB MB
					"queueID":"file_upload_queue",//"file_upload_queue"
					"uploadLimit" : "1",
//					"formData" : {"sysFlag":"cc"},
					"fileTypeDesc":"请选择上传文件",
					"fileTypeExts":"*.flv;*.mp4",
					/*"onUploadStart": opt.onUploadStart,
					"onDialogOpen": opt.onDialogOpen,
					"onSelect":opt.onSelect,*/
					"onUploadSuccess":function(file, data, response){
						
						var swfuploadify = this;
						//settings = this.settings;
						var stats = swfuploadify.getStats();
						//console.log(data);
						var jsonData = "";
						try{
							jsonData = $.parseJSON(data);
						}catch (e) {
							  stats.successful_uploads -= 1;
							  stats.upload_cancelled += 1;
							  swfuploadify.setStats(stats);
							  bootbox.alert("文件上传失败！");
							return;
						}
						
						//console.log("a")
						
						
						if(jsonData.result =="1"){
							
							var $fileList = $("#"+ customOpt.fileListID);
							
							if($fileList){
								// Get the size of the file
								var fileSize = Math.round(file.size / 1024);
								var suffix   = 'KB';
								if (fileSize > 1000) {
									fileSize = Math.round(fileSize / 1000);
									suffix   = 'MB';
								}
								var fileSizeParts = fileSize.toString().split('.');
								fileSize = fileSizeParts[0];
								if (fileSizeParts.length > 1) {
									fileSize += '.' + fileSizeParts[1].substr(0,2);
								}
								fileSize += suffix;
								
								// Truncate the filename if it's too long
								var fileName = file.name;
								if (fileName.length > 25) {
									fileName = fileName.substr(0,25) + '...';
								}
								
								 var itemData = {
										 	'itemId'     : jsonData.fileId,
											'fileId'     : jsonData.fileId,
											'fileName'   : fileName,
											'fileSize'   : fileSize,
											'contextPath': customOpt.contextPath
								 }
								
								
								 	var itemListTemplate = '<div style="display:none" id="${itemId}" class="uploadify-queue-item">\
									<div class="cancel">\
										<a href="javascript:">X</a>\
									</div>\
									<span class="fileName">${fileName} (${fileSize})</span>\
									</div>';

									
								 	var itemHTML = itemListTemplate;
									for (var d in itemData) {
										itemHTML = itemHTML.replace(new RegExp('\\$\\{' + d + '\\}', 'g'), itemData[d]);
									}
									
									$fileList.append(itemHTML);
									$("#"+itemData.itemId).fadeIn(500);
								
								//添加隐藏域
								for(var field in customOpt.fieldNameMap){
									if(jsonData[field] && customOpt.fieldNameMap[field]){
										var $input = $("<input>");
										$input.attr("type","hidden").attr("name",customOpt.fieldNameMap[field]).val(jsonData[field]);
										$("#"+itemData.itemId).append($input);
									}
								}
								
								//添加删除事件
								var $cancel_a = $("#"+itemData.itemId + " .cancel a");
								
								$cancel_a.attr("href","javascript:");
								$cancel_a.on("click",function(){
									if(confirm("您已上传文件，是否放弃?")){
										if ($('#' + itemData.itemId)) {
											  stats.successful_uploads -= 1;
											  stats.upload_cancelled += 1;
											  swfuploadify.setStats(stats);
											  
											  $('#' + itemData.itemId).fadeOut(500, function() {
													$(this).remove();
											  });
										  }
									}
								});
							}
						}else{
							 //var stats = swfuploadify.getStats();
							  stats.successful_uploads -= 1;
							  stats.upload_cancelled += 1;
							  swfuploadify.setStats(stats);
							  if(jsonData.msg){
								  bootbox.alert(jsonData.msg);
							  }else{
								  bootbox.alert("文件上传失败！");
							  }
							 
						}
					}
				}
			
			$.extend(opt,defaultOpt,options)
			customFileUpload.selector = customOpt.selector;
			customFileUpload.uploader = opt.uploader;
			$(customOpt.selector).uploadify(opt);
			if(opt.buttonImage){
				//uploadify-button
				$(customOpt.selector+"-button").removeClass("uploadify-button");
			}
			
		}
}