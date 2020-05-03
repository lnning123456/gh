<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>线上挂号</title>
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script src="../boot/js/jQuerysession.js"></script>
    <script src="../boot/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    label.error {
        color: red;
        margin-left: 50px;
    }
</style>
<script>

    function loginChangeImage() {
        $("#loginCode").prop("src", "/gh/code/code?time=" + new Date().getTime());
    };

    $(function () {
        $('#changeContent').load('${pageContext.request.contextPath}/front/doctor');
        $("#mainLocation").click(function () {
            $('#changeContent').load('${pageContext.request.contextPath}/front/doctor')
        });
        $("#login").click(function () {
            $("#userLoginForm").validate({
                rules: {
                    call: {required: true, digits: true, rangelength: [11, 11]},
                    password: {required: true,rangelength: [6, 10]},
                    code: {required: true,rangelength: [4,4]}
                },
                //提示信息
                messages: {
                    call: {required: "请输入！", digits: "请输入合法手机号！", rangelength: "请输入合法手机号！"},
                    password: {required: "请输入登录密码！",rangelength: "密码长度为6到10位！"},
                    code: {required: "请输入验证码！",rangelength:"验证码长度为4！"}
                }
            });
            var flag = $("#userLoginForm").valid();
            if (flag) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/login",
                    datatype: "json",
                    type: "post",
                    data: $("#userLoginForm").serialize(),
                    success: function (data) {
                        console.log(data);
                        if (data === "登录成功") {
                            window.location.reload();
                        }else {
                            $("#loginErrorMsg").text(data);
                        }

                    }
                });
            }
        });
        $("#logout").click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/logout",
                success: function (data) {
                    window.location.reload();
                }
            });
        });

    })

</script>
<br>
<div style="text-align: right;margin-right: 100px ">
    <span id="userId" style="display: none">${sessionScope.user.userId}</span>
    <span id="msg" style="display: none"><%=request.getParameter("msg") %></span>
    <c:if test="${sessionScope.user==null}">
        您好,请选择
        <a href="javascript:$('#loginModal').modal('show');loginChangeImage()">登录</a>&nbsp;|&nbsp;
        <a href="javascript:$('#changeContent').load('${pageContext.request.contextPath}/front/register')" >注册</a>
    </c:if>
    <c:if test="${sessionScope.user!=null}">
        <span >您好,用户: &nbsp;${sessionScope.user.username} </span>
        &nbsp;&nbsp;
        <a href="javascript:$('#changeContent').load('${pageContext.request.contextPath}/front/my')">个人中心 </a>
        &nbsp;&nbsp;
        <a id="logout">退出登录 <span class="glyphicon glyphicon-log-out"></span></a>
    </c:if>

</div>
<br>
<div class="container-fluid">
<nav class="navbar navbar-default" style="background: #79c9ec;">
    <div class="container">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <h3 style="float:left" class="navbar-text">线上挂号</h3>
                <h4 id="mainLocation" class="navbar-text">首页</h4>
                <form class="navbar-form " id="queryDoctorFrom">
                    <div class="form-group">
                        <div class="form-inline">
                            <input type="text" style="width: 200px" class="form-control" id="queryDoctorName"
                                   placeholder="输入医生名字">
                        </div>
                    </div>
                    <button type="button" id="queryDoctorButton" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
    </div>
</nav>
<br>
<div class="row">
    <div class="col-sm-3"></div>
</div>
<div class="row">
    <div class="col-sm-3"></div>
    <div id="changeContent" class="col-sm-8" style="position: relative ;left:10px;"></div>

</div>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 style="text-align: center;color: red" class="modal-title" id="loginLabel">登录</h4>
            </div>
            <div class="modal-body">
                <span id="loginErrorMsg" style="color:red;"></span>
                <form id="userLoginForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="call" class="col-xs-3 control-label">手机号码：</label>
                        <div class="col-xs-9 form-inline">
                            <input type="text" style="width: 150px" class="form-control" id="call" name="call"
                                   placeholder="请输入手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-xs-3 control-label">登录密码：</label>
                        <div class="col-xs-9 form-inline">
                            <input type="password" style="width: 150px" class="form-control" id="password"
                                   name="password"
                                   placeholder="请输入登录密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="code"> 验证码：</label>
                        <div class="col-xs-9 form-inline">
                            <img id="loginCode" src="${pageContext.request.contextPath}/code/code "
                                 onClick="loginChangeImage()">
                            <a id="vcodeImgBtn" name="change_code_link" class="code_picww"
                               onclick="loginChangeImage()">换一张图</a>
                            <input class="form-control" type="text" style="height: 35px;width: 120px"  name="code"
                                   id="code" placeholder="请输入验证码...">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="login" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
</div>



</html>