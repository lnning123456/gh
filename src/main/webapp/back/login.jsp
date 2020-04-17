<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; ISO-8859-1" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="../jqgrid/css/jquery-ui.css">
    <link rel="stylesheet" href="../jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script src="../boot/js/jQuerysession.js"></script>
    <script src="../boot/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function changeImage() {
            $("#imgCode").prop("src", "/gh/code/code?time=" + new Date().getTime());
        }

        $(function () {
            $("form").validate({
                //规定验证规则
                rules: {
                    password: {required: true},
                    name: {required: true},
                    code: {required: true}
                },
                //提示信息
                messages: {
                    password: {required: "密码不能为空！"},
                    name: {required: "用户名不能为空！"},
                    code: {required: "验证码不能为空！"}
                }
            });

            $("#loginButton").click(function () {
                var flag = $("#loginForm").valid();
                if (flag) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/login",
                        datatype: "json",
                        type: "post",
                        data: $("#loginForm").serialize(),
                        success: function (data) {
                            console.log(data);
                            if ('ok' === data.msg) {
                                location.href = "${pageContext.request.contextPath}/back/main.jsp"
                            } else {
                                $("#msg").html(data.msg)
                                console.log(data.msg);

                            }

                        }
                    });
                }
            });
        });
    </script>
</head>
<div id="loginDiv" class="row">
    <div class="col-md-12" style="text-align: center">
        <h1 style="color:red">
            欢迎来到挂号后台管理系统，请输入管理名和密码！
        </h1>
        <br/>
        <br/>
    </div>

    <div class="col-md-4"></div>
    <div class="col-md-6">
        <span style="color: red" id="msg"></span>
        <form class="form-horizontal" method="post" id="loginForm">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="adminName"> 管理名：</label>
                <div class="col-sm-10 form-inline">
                    <input type="text" style="height: 35px;width: 265px" class="form-control" name="name"
                           placeholder="请输入管理名..." id="adminName">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="password"> 密 码：</label>
                <div class="col-sm-10 form-inline">
                    <input class="form-control" style="height: 35px;width: 265px" type="password" name="password"
                           placeholder="请输入密码..." id="password">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="code"> 验证码：</label>
                <div class="col-sm-10 form-inline">
                    <img id="imgCode" src="${pageContext.request.contextPath}/code/code " onClick="changeImage()">
                    <a id="vcodeImgBtn" name="change_code_link" class="code_picww" onclick="changeImage()">换一张图</a>
                    <input class="form-control" type="text" style="height: 35px;width: 120px" sty name="code" id="code"
                           placeholder="输入验证码...">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3"></div>
                <div class="col-sm-4" style="margin-left: 23px">
                    <button class="btn btn-primary" type="button" id="loginButton">登录</button>
                </div>
            </div>
        </form>
    </div>

</div>

</html>