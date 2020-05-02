<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<script>
    $(function () {
        $("#updatePassword").click(function () {
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
        })
    })
</script>
<br>

<form id="updatePasswordForm" class="form-horizontal">
    <div class="form-group">
        <label for="oldPassword" class="col-xs-3 control-label">原密码：</label>
        <div class="col-xs-9 form-inline">
            <input type="password" style="width: 150px" class="form-control" id="oldPassword"
                   name="oldPassword"
                   placeholder="请输入原登录密码">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-xs-3 control-label">新密码：</label>
        <div class="col-xs-9 form-inline">
            <input type="password" style="width: 150px" class="form-control" id="password"
                   name="password"
                   placeholder="再次输入密码">
        </div>
    </div>

    <div class="col-xs-2"></div>
    <div class="col-xs-9 ">
        <button type="button" id="updatePassword" style="width: 250px" class="btn btn-success">确定修改</button>
    </div>
</form>