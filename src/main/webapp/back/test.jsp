<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录界面</title>
</head>
<head>

    <center>${requestScope.doctor}
        <h1 style="color:red">
            欢迎来到挂号后台管理系统，请输入管理名和密码！
        </h1>
        <form  action="#" method="post" class="login-form" id="loginForm">
            <table border="0">
                <tr>
                    <td>管理名：</td>
                    <td> <input style="height: 35px;width: 200px" type="text" name="name" placeholder="请输入管理名..." id="username"></td>
                </tr>
                <tr>
                    <td>密 码：</td>
                    <td><input  style="height: 35px;width: 200px" type="password" name="password" placeholder="请输入密码..."
                                id="password">
                    </td>
                </tr>
                <tr>
                    <td>验证码：</td>
                    <td><img id="imgCode" src="${pageContext.request.contextPath}/code/code " onClick="changeImage()" >
                        <a id="vcodeImgBtn" name="change_code_link"  onclick="changeImage()">换一张图</a>
                        <input type="text" style="height: 35px;width: 100px" sty name="code" id="code" placeholder="请输入验证码...">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="登录" style="color:#BC8F8F">
        </form>
<a href="testTime.jsp?test=wrwrewe">sfesfs</a>
    </center>
</head>
<input type="date">
</html>