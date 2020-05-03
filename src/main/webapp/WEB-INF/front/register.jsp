<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<script>
    function registerChangeImage() {
        $("#registerCode").prop("src", "/gh/code/code?time=" + new Date().getTime());
    }
    $(function () {
        $("#userRegister").click(function () {
            $("#userRegisterForm").validate({
                rules: {
                    call: {required: true, digits: true, rangelength: [11, 11]},
                    username: {required: true},
                    password: {required: true, rangelength: [6, 10]},
                    againPassword: {required: true, rangelength: [6, 10], equalTo: "#password"},
                    code: {required: true, rangelength: [4, 4]}
                },
                //提示信息
                messages: {
                    call: {required: "请输入手机号！", digits: "请输入合法手机号！", rangelength: "请输入合法手机号！"},
                    username: {required: "请输用户名！"},
                    password: {required: "请输入登录密码！", rangelength: "密码长度为6到10位！"},
                    againPassword: {required: "请输入登录密码！", rangelength: "密码长度为6到10位！", equalTo: "两次密码不一样"},
                    code: {required: "请输入验证码！", rangelength: "验证码长度为4！"}
                }
            });
            var flag = $("#userRegisterForm").valid();
            if (flag) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/userRegister",
                    datatype: "json",
                    type: "post",
                    data: $("#userRegisterForm").serialize(),
                    success: function (data) {
                        console.log(data);
                        if (data === "ok") {
                            window.location.reload();
                        } else {
                            $("#registerErrorMsg").text(data);
                        }

                    }
                });
            }
        })
    })
</script>
<span style="color: red" id="registerErrorMsg"></span>
<form id="userRegisterForm" class="form-horizontal">
    <div class="form-group">
        <label for="call" class="col-xs-3 control-label">手机号码：</label>
        <div class="col-xs-9 form-inline">
            <input type="text" style="width: 150px" class="form-control" id="call" name="call"
                   placeholder="请输入手机号">
        </div>
    </div>
    <div class="form-group">
        <label for="call" class="col-xs-3 control-label">用户姓名·：</label>
        <div class="col-xs-9 form-inline">
            <input type="text" style="width: 150px" class="form-control" id="username" name="username"
                   placeholder="请输用户姓名">
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
        <label for="againPassword" class="col-xs-3 control-label">确认密码：</label>
        <div class="col-xs-9 form-inline">
            <input type="password" style="width: 150px" class="form-control" id="againPassword"
                   name="againPassword"
                   placeholder="再次输入密码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 control-label" for="code"> 验证码：</label>
        <div class="col-xs-9 form-inline">
            <img id="registerCode" src="${pageContext.request.contextPath}/code/code "
                 onClick="registerChangeImage()">
            <a id="vcodeImgBtn" name="change_code_link" class="code_picww"
               onclick="registerChangeImage()">换一张图</a>
            <input class="form-control" type="text" style="height: 35px;width: 120px" name="code"
                   id="code" placeholder="请输入验证码...">
        </div>
    </div>
    <div class="col-xs-2"></div>
    <div class="col-xs-9 ">
        <button type="button" id="userRegister" style="width: 250px" class="btn btn-success">确定注册</button>

    </div>

</form>

