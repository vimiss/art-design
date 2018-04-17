$(function() { 
	var date = new Date();
	$("#nowDate").text(date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日");
	$("#nowDay").text("星期  "+date.getDay());
	
	$(function(){  
        $(".bg").width($(document).width());  
        $('.bg').height($(document).height());  
        $('.bg').css('left',0);     
        $('.bg').css('top',0);  
    }); 
	
	//Check
	var check=$("#checkDiv");
	
	//TitleInput Check
	$(".middleInput").keyup(function() {
		check.text($(this).val());
		check.fadeIn(100);
		if($(this).val().length>60) {
			check.html("<font color='red'><b>标题字数超出限制</b></font>");
			$(this).val($(this).val().substring(0,60));
		}
	}).change(function() {
		check.fadeOut(100);
	});
	
	//ContentInput Check
	$(".largeInput").keyup(function() {
		check.text($(this).val());
		check.fadeIn(100);
		if($(this).val().length>996) {
			check.html("<font color='red'><b>内容字数超出限制</b></font>");
			$(this).val($(this).val().substring(0,996));
		}
	}).change(function() {
		check.fadeOut(100);
	});
	
	//NumberInput Check
	$(".hasNullInput").keyup(function() {
		var test=/^[0-9]{1,4}$/;
		check.text($(this).val());
		check.fadeIn(100);
		if(!test.test($(this).val())) {
			check.html("<font color='red'><b>格式错误 或大小超出 只能输入4位数或以下的数字</b></font>");
			$(this).val("");
		}
	}).change(function() {
		check.fadeOut(100);
	});
	
	//NumberInput Check
	$(".smallInput").keyup(function() {
		var test=/^[0-9]{1,4}$/;
		check.text($(this).val());
		check.fadeIn(100);
		if(!test.test($(this).val())) {
			check.html("<font color='red'><b>格式错误 或大小超出 只能输入4位数或以下的数字</b></font>");
			$(this).val(1);
		}
	}).change(function() {
		check.fadeOut(100);
	});
});