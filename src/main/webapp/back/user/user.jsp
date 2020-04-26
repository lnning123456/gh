<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<style type="text/css">
    td {
        text-align: center;
        vertical-align: middle;

    }
</style>
<script>
    $.ajax({
        url: "${pageContext.request.contextPath}/user/userList",
        datatype: "json",
        type: "post",
        data: {page: 1},
        success: function (data) {
            console.log(data);
            var tr = null;
            var user = data.users;
            console.log(user);
            for (i = 0; i < user.length; i++) {
                tr = tr + "<tr><td>" + user[i].userId + "</td><td>" + user[i].username + "</td><td>" + user[i].call + "</td><td>" + user[i].status +
                    "</td><td><a type='button' onclick='updateUser(this)' >修改状态</a><a style='margin-left: 50px' >挂号记录</a></td></tr>"
            }
            $("#userTable tr  ").eq(0).after(tr);
            $("#sum").empty().append(data.sum);
            $("#total").empty().append(data.total);
            $("#page").empty();
            for (i = 1; i <= data.total; i++) {
                $("#page").append("<option>" + i + "</option>");
            }
        }
    });
    $(function () {

        $("#sure").click(function () {
            var status = $("#status :selected").val();
            var id = $(".updateId").text();
            if (status === "") {
                alert("请选择修改状态")
            } else if (status === $(".updateId").parent().children().eq(3).text()) {
                alert("修改状态不能一样")
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/updateUserStatus",
                    datatype: "json",
                    type: "post",
                    data: {userId:id,status:status},
                    success: function (data) {

                        $(".updateId").parent().children().eq(3).text(status);
                        $('#updateUserModal').modal('hide');
                        alert(data);
                    }
                })

            }


        });
        $('#updateUserModal').on('hide.bs.modal', function () {
            console.log('模态框关闭了');
            $(".updateId").removeClass("updateId")
        });
    });

    function updateUser(a) {
        console.log(a);
        var parent = $(a).parent().parent();
        parent.children().eq(0).addClass("updateId");
        var name = parent.children().eq(1).text();
        $("#current").empty().append(name + "用户状态为：" + parent.children().eq(3).text());
        $('#updateUserModal').modal('show');
    }
</script>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <form class="navbar-form " id="queryDoctorFrom">
                <div class="form-group">
                    <div class="form-inline">
                        <input type="text" class="form-control" id="queryDoctorInput" placeholder="输入用户名字/手机号">
                    </div>
                </div>
                <button type="button" id="queryDoctorButton" class="btn btn-primary">查询</button>
            </form>

        </div>
    </div>
</nav>
<div id="userDiv">
    <table id="userTable" class="table table-bordered">
        <tr>
            <td>用户编号</td>
            <td>用户姓名</td>
            <td>用户手机号</td>
            <td>状态</td>
            <td>操作</td>
        </tr>

        <tr>
            <td colspan="5" style="text-align: center">
                <span>第&nbsp&nbsp
                <select style="width: 35px" id="page"></select>&nbsp&nbsp页</span>
                总页数: <span id="total"></span> &nbsp&nbsp总条数：<span id="sum"></span></td>
        </tr>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="updateUserModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 style="text-align: center;color: red" class="modal-title" id="updateUserModalLabel">修改用户状态</h4>
            </div>
            <div class="modal-body">
                <span id="current"></span>
                <br>
                选择修改状态：
                <select style="width: 200px;height: 25px;text-align:center;text-align-last:center" id="status">
                    <option value="" disabled selected hidden>---请选择用户状态---</option>
                    <option value="正常">正常</option>
                    <option value="注销">注销</option>
                </select>
                <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="sure" class="btn btn-danger">确定</button>
            </div>
        </div>
    </div>
</div>