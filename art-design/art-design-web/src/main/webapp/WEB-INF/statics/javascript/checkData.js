/** 
*功能：	检查参数对象的值是否符合E-Mail格式 
*参数：	str：	参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isEmail(strEmail)                             
{
	var emailReg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	if(emailReg.test(strEmail))
		return true;
	return false;
}


/**
*规则：	移动: 前3位 134-139  或者 150-159   一共11位
*		联通: 前3位 130-133  或者 150-159   一共11位
* 		新增18号段。17号段，14号段
*	     这是最新规则
*功能：	检查参数的电话号码格式是否正确（仅手机号）
*参数：	str：	字符串
*返回：	如果通过验证返回true,否则返回false
*/
function isMobile(str){   
	var regu =/^1[3|4|5|7|8][0-9]{9}$/;	
	var reg = new RegExp(regu);	
	if (reg.test(str)) {	
		return true;	
	}else{	
		return false;
	}
}

/**
*格式要求 (1)国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(2到5位)
*			/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{2,5}))?$/
*		(2)手机号
*			/(^0{0,1}13[0-9]{9}$)|(^0{0,1}14[0-9]{9}$)|(^0{0,1}15[0-9]{9}$)|(^0{0,1}17[0-9]{9}$)|(^0{0,1}18[0-9]{9}$)/
*		(2)小灵通
*			/^[0][1-9]{1}[0-9]{9}$/ 
*功能：	检查参数的电话号码格式是否正确(包含手机)
*参数：	str：	字符串
*返回：	如果通过验证返回true,否则返回false
*/
function isTel(str){
	var regu = /(^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{2,5}))?$)|(^0{0,1}13[0-9]{9}$)|(^0{0,1}14[0-9]{9}$)|(^0{0,1}15[0-9]{9}$)|(^0{0,1}17[0-9]{9}$)|(^0{0,1}18[0-9]{9}$)|(^[0][1-9]{1}[0-9]{9}$)/;
	var reg = new RegExp(regu);	
	if (reg.test(str)) {	
		return true;	
	}else{	
		return false;
	}
}

/** 
*功能：	检查参数对象的值是否符邮政编码格式 
*参数：	str：		参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isZip(str){
	var filter=/^[1-9]\d{5}$/;
	if(!filter.test(str)) return false;
	return true;
}

/** 
*功能：	判断用户名是否是字母 数字 . _等组成并且6-20位
*参数：	str：		参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isUsername(str){
	var filter=  /^[a-zA-Z]+\s*[.A-Za-z0-9_-]{5,20}\s*$/; 
	if(!filter.test(str)) return false;
	return true;
}

/** 
*功能：	判断用户姓名是否是字母或者汉字组成并且2-20位
*参数：	str：		参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isRealname(str){
	var filter = /^([\u4E00-\u9FA5|a-zA-Z]){2,20}$/g;
	if(!filter.test(str)) return false;
	return true;
}

/** 
 *功能：	判断是否是QQ号，并且4-20位
 *参数：	str：		参数的字符串 
 *返回：	如果通过验证返回true,否则返回false 
 */ 
function isQQ(str){
	var filter = /^[1-9][0-9]{4,20}$/;
	if(!filter.test(str)) return false;
	return true;
}

/** 
*功能：	判断学生姓名是否是字母或者汉字组成并且1-20位
*参数：	str：		参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isRealStuName(str){
	var filter = /^([\u4E00-\u9FA5|a-zA-Z]){1,20}$/g;
	if(!filter.test(str)) return false;
	return true;
}

/** 
*功能：	判断字符串是否包含特殊字符
*参数：	str：		参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isRealStr(str){
	var filter = /^([\u4E00-\u9FA5|a-zA-Z0-9]){1,250}$/g;
	if(!filter.test(str)) return false;
	return true;
}


/** 
*功能：	判断是否是正整数
*参数：	str：		参数的字符串 
*返回：	如果通过验证返回true,否则返回false 
*/ 
function isPositiveInteger(str){
	var filter = /^[0-9]*[1-9][0-9]*$/;
	if(!filter.test(str)) return false;
	return true;
}



