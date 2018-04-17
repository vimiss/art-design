<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>404</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <style>
        *{ margin: 0; padding: 0;}
        img {border: 0;}
        a{ color: #666; text-decoration: none;}
        a{-webkit-tap-highlight-color:rgba(0,0,0,0);} /*取消a链接的黄色边框*/
        i,em{font-style:normal}
        a:hover { text-decoration: none;}
        a:focus { outline:none; -moz-outline:none; }
        img, :link img, :visited img {border:none;}
        :focus{outline: 0;}
        .Content{
            background: url("${pageContext.request.contextPath}/images/404-500.png") no-repeat;
            width: 100%;
            height: 100%;
            background-size: cover;
            -ms-behavior: url("${pageContext.request.contextPath}/images/backgroundsize.min.htc");
            behavior: url("${pageContext.request.contextPath}/images/backgroundsize.min.htc");
        }
        .ContentTop{ overflow: hidden;zoom: 1; margin: 0 auto; width: 666px; font-family: "Microsoft YaHei"}
    </style>
</head>
<body>
<div class="Content">
    <div class="ContentTop">
        <div style="float: left"><img src="${pageContext.request.contextPath}/images/404.png" alt="ERROR 404"></div>
        <div style="float: right; color: #fff; margin-top: 130px;">
            <div style="font-size: 24px;"><span style="font-size: 36px;">Sorry,</span>您访问的页面不存在</div>
            <div style="font-size: 16px; line-height: 50px;">您可以点击下面按钮继续访问</div>
            <div>
                <a href="javascript:history.go(-1)"><img src="${pageContext.request.contextPath}/images/404-greap.png" alt="返回上一页"></a>
                <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/images/404-index1.png" alt="返回首页"></a>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script>
    $(function () {
        var WinHeight = $(window).height();
        $(".Content").css({
        'minHeight': WinHeight +"px" ,
        'height':'auto'
        });

        $(".ContentTop").css({
            'paddingTop': WinHeight/4 +"px" ,
            'height':'auto'
        });
    })

    var u=5;
    function  a() {
        u=u-1
        //document.getElementById("aa").innerHTML="5秒后自动返回首页，还剩"+u+"秒";
        if (u==0) location.href="${pageContext.request.contextPath}/index"; //0秒时返回首页
    }
    setInterval(a,1000); //隔一秒执行a函数一次

</script>

</body>
</html>