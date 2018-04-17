<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>500  对不起出错了</title>
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
        <div style="float: left"><img src="${pageContext.request.contextPath}/images/500.png" alt="500  对不起出错了"></div>
        <div style="float: right; color: #fff; margin-top: 130px;">
            <div style="font-size: 30px;"><span style="font-size: 36px;">OH！</span>有错误发生！！</div>
            <div style="font-size: 16px; line-height: 50px;">很抱歉，程序暂时无法处理您的访问请求！</div>
            <div>
                <a href="javascript:history.go(-1)"><img src="${pageContext.request.contextPath}/images/404-greap1.png" alt="跳转下一页"></a>
                <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/images/404-greap.png" alt="返回首页"></a>
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
        if (u==0) location.href="${pageContext.request.contextPath}/index";
    }
    setInterval(a,1000);

</script>
</body>
</html>