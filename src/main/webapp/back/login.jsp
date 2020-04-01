<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; ISO-8859-1" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../boot/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../boot/js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript" src="../boot/js/jquery.validate.min.js"></script>
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
<body>
<center>
    <h1 style="color:red">
        欢迎来到挂号后台管理系统，请输入管理名和密码！
    </h1>
   <span style="color: red" id="msg"></span>
    <form  action="#" method="post" id="loginForm">
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
                    <a id="vcodeImgBtn" name="change_code_link"  class="code_picww"  onclick="changeImage()">换一张图</a>
                    <input type="text" style="height: 35px;width: 100px" sty name="code" id="code" placeholder="请输入验证码...">
                </td>
            </tr>
        </table>
        <br>

        <input type="button"  id="loginButton" value="登录" style="color:#3960bc; height:35px;width: 100px"></button>
    </form>
</center>
</body>
</html>