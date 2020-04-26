<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script src="../boot/js/jQuerysession.js"></script>
    <script src="../boot/js/bootstrap.min.js"></script>
</head>
<script src="../boot/js/jquery-2.2.1.min.js"></script>
<script>

    function test(data) {
        console.log(data.get("page"));
        return 2;
    }

    $(function () {
        $("#deleteTrButton").click({msg:1},function (e) {
            console.log("fffxf");
            console.log($(this));
            console.log(e.data.msg);
         //   $("#deleteTr tr :gt(7)").remove();
        });
        $("#fromButton").click(function () {
            //  console.log(  $("input").val());
            //  console.log(  $("#from").serializeArray());
            var forData = new FormData;
            forData.append("page", 1);
            var t = test(forData);
            console.log(t);
            console.log($("#img").attr("src"));
            //   $("#img").attr("src","../img/doctor_default.png");
            console.log($("#img").attr("src"));

            /*   console.log(new FormData( $("#from")[0]) );*/
        })

    });

    function dele() {
        console.log("dele");
    }

    // console.log($("#img").prop("src"));
    $('#deleteDoctorModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
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
        <button type="button" style="margin-right: 50px" id="deleteTrButton">delet</button>
        <button type="button"  id="deleteTrButton">delet</button>
        <button type="button" id="deleteTrButton">delet</button>
    <from id="from" action="${pageContext.request.contextPath }/doctor/addDoctor" method="post">
        <input type="text" name="name">
        <input id="fromButton" type="button">
    </from>

    <a href="javascript:$('#update').load('doctor/updateDoctor.jsp?id=7c6')"> update</a>
    <a href="${pageContext.request.contextPath }/doctor/gotoUpdateDoctor?doctorId=7981f85d-94d3-4e1f-99da-1b7c451539c6">
        ssgegf</a>
    <img style="height: 80px;width: 70px" id="img" src="../img/1587391257276_1.png">gvesdgvsedges
    <div id="update">
        sfbfd gvgbv
    </div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#deleteDoctorModal">删除
    </button>
    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteDoctorModal">
        Launch demo modal
    </button>
    <!-- Modal -->
    <div class="modal fade" id="deleteDoctorModal" tabindex="-1" role="dialog" aria-labelledby="deleteDoctorModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="deleteDoctorModalLabel">删除</h4>
                </div>
                <div class="modal-body">
                    确定删除<span id="deleteMsg"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="dele()" class="btn btn-danger">确定</button>
                </div>
            </div>
        </div>
    </div>
</html>