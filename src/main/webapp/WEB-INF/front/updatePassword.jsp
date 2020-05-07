<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<!doctype html>
<script>
    $(function () {
        $("#updatePassword").click(function () {
            $("#updatePasswordForm").validate({
                rules: {

                    oldPassword: {required: true, rangelength: [6, 10]},
                    password: {required: true, rangelength: [6, 10]},
                    againPassword: {required: true, rangelength: [6, 10], equalTo: "#password"}

                },
                //提示信息
                messages: {
                    oldPassword: {required: "请输入旧密码！", rangelength:"密码长度为6到10位！"},
                    password: {required: "请输入新密码！", rangelength: "密码长度为6到10位！"},
                    againPassword: {required: "请从新输入新密码！", rangelength: "密码长度为6到10位！", equalTo: "两次密码不一样"}
                }
            });
            var flag = $("#updatePasswordForm").valid();
            if(flag){
                var data = $.param({
                    "userId": $("#userId").text()
                }) + "&" + $('#updatePasswordForm').serialize();
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/updateUserPassword",
                    datatype: "json",
                    type: "post",
                    data: data,
                    success: function (data) {
                        alert(data)
                    }
                });
            }

        })
    })
</script>
<br>

<form id="updatePasswordForm" class="form-horizontal">
    <div class="form-group">
        <label for="oldPassword" class="col-xs-3 control-label">旧密码：</label>
        <div class="col-xs-9 form-inline">
            <input type="password" style="width: 200px" class="form-control" id="oldPassword"
                   name="oldPassword"
                   placeholder="请输入旧密码">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-xs-3 control-label">新密码：</label>
        <div class="col-xs-9 form-inline">
            <input type="password" style="width: 200px" class="form-control" id="password"
                   name="password"
                   placeholder="输入新密码">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-xs-3 control-label">再次输入：</label>
        <div class="col-xs-9 form-inline">
            <input type="password" style="width: 200px" class="form-control" id="againPassword"
                   name="againPassword" placeholder="再次输入新密码">
        </div>
    </div>

    <div class="col-xs-2"></div>
    <div class="col-xs-9 ">
        <button type="button" id="updatePassword" style="width: 250px" class="btn btn-success">确定修改</button>
    </div>
</form>