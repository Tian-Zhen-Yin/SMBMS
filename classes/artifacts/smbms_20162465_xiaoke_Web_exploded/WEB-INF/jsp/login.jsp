<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>超市订单管理系统</title>

<style type="text/css">
*{padding:0px;margin:0px;}
body{font-family:Arial, Helvetica, sans-serif;background:url(${pageContext.request.contextPath }/statics/images/grass.jpg) no-repeat 50% 0;font-size:12px;}
img{border:0;}
.lg{width:468px;height:468px;margin:100px auto;background:url(${pageContext.request.contextPath }/statics/images/login_bg.png) no-repeat;}
.lg_top{ height:200px;width:468px;}
.lg_main{width:400px;height:180px;margin:0 25px;}
.lg_m_1{width:290px;height:100px;padding:60px 55px 20px 55px;}
.ur{height:37px;line-height:37px;border:0;color:#666;width:236px;margin:4px 28px;background:url(${pageContext.request.contextPath }/statics/images/user.png) no-repeat;padding-left:10px;font-size:12px;font-family:Arial, Helvetica, sans-serif;}
.pw{height:37px;line-height:37px;border:0;color:#666;width:236px;margin:4px 28px;background:url(${pageContext.request.contextPath }/statics/images/password.png) no-repeat;padding-left:10px;font-size:12px;font-family:Arial, Helvetica, sans-serif;}
.bn{width:330px;height:72px;background:url(${pageContext.request.contextPath }/statics/images/enter.png) no-repeat;border:0;display:block;font-size:18px;color:#FFF;font-family:Arial, Helvetica, sans-serif;font-weight:bolder;cursor:pointer;}
.lg_foot{height:80px;width:330px;padding: 6px 68px 0 68px;}
</style>

</head>

<body>

<div class="lg">
<form action="${pageContext.request.contextPath }/logincon/login"  name="actionForm" id="actionForm"  method="post">
    <div class="lg_top"></div>
    <div class="lg_main">
        <div class="lg_m_1">
        
        <input name="userCode" placeholder="用户名" value="" class="ur" />
        <input name="userPassword" placeholder="密码" type="password" value="" class="pw" />
        
        </div>
    </div>
    <div class="lg_foot">
    <input type="submit" value="登录" class="bn" /></div>
</form>
</div>
<div style="text-align:center;">
</div>

</body>
</html>
