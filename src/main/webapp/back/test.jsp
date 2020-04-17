<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录界面</title>
</head>
<script src="../boot/js/jquery-2.2.1.min.js"></script>
<script>
    $(function () {
        $("#deleteTrButton").click(function () {
            console.log("fffxf");
           $("#deleteTr tr :gt(7)").remove();
        });
        $("#fromButton").click(function () {
            console.log(  $("input").val());
          //  console.log(  $("#from").serializeArray());
            console.log(new FormData( $("#from")[0]) );
        })
    })

</script>
<head>
<%--
    <center>${requestScope.doctor}
        <h1 style="color:red">
            欢迎来到挂号后台管理系统，请输入管理名和密码！
        </h1>
        <form action="#" method="post" class="login-form" id="loginForm">
            <table border="0">
                <tr>
                    <td>管理名：</td>
                    <td><input style="height: 35px;width: 200px" type="text" name="name" placeholder="请输入管理名..."
                               id="username"></td>
                </tr>
                <tr>
                    <td>密 码：</td>
                    <td><input style="height: 35px;width: 200px" type="password" name="password" placeholder="请输入密码..."
                               id="password">
                    </td>
                </tr>
                <tr>
                    <td>验证码：</td>
                    <td><img id="imgCode" src="${pageContext.request.contextPath}/code/code " onClick="changeImage()">
                        <a id="vcodeImgBtn" name="change_code_link" onclick="changeImage()">换一张图</a>
                        <input type="text" style="height: 35px;width: 100px" sty name="code" id="code"
                               placeholder="请输入验证码...">
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
<select id="select">
    <option value="1" disabled selected hidden>q</option>
    <option value="1">q2</option>
    <option value="1">q2</option>
    <option value="1">q2</option>
    <option value="1">q2</option>
</select>
<table id="deleteTr">
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
</table>
<button type="button" id="deleteTrButton"></button>

<div >
    <label id="file_upload1_label" for="file_upload1">
        <span id="uploadtip">添加图书封面</span>
        <img id="uploadimg" src="" alt="" width="118px" height="143px" />
    </label>
    <input type="file" name="src" class="" id="file_upload1"	onchange="upload_review()">
</div>
<script>
    function upload_review() {
        var img = document.getElementById("uploadimg");
        var input = document.getElementById("file_upload1");
        var tip = document.getElementById("uploadtip");

        var file = input.files.item(0);
        var freader = new FileReader();
        freader.readAsDataURL(file);
        freader.onload = function(e) {
            img.src = e.target.result;
            tip.style.display = "none";
        };
    }
</script>--%>
<from id="from" action="${pageContext.request.contextPath }/doctor/addDoctor" method="post">
    <input type="text" name="name">
    <input id="fromButton" type="button">
</from>
    <a href="${pageContext.request.contextPath }/doctor/addDoctor"> sfsdf</a>
</html>