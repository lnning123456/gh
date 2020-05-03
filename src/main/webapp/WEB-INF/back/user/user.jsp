<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<style type="text/css">
    td {
        text-align: center;
        vertical-align: middle;

    }
</style>
<script>
    function query(formData){
        $.ajax({
            url: "${pageContext.request.contextPath}/user/userList",
            datatype: "json",
            type: "post",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                var tr = null;
                var option = null;
                var user = data.users;
                for (i = 0; i < user.length; i++) {
                    tr = tr + "<tr><td>" + user[i].userId + "</td><td>" + user[i].username + "</td><td>" + user[i].call + "</td><td>" + user[i].status +
                        "</td><td><a type='button' onclick='updateUser(this)' >修改状态</a>" +
                        "<a style='margin-left: 50px' onclick=order(this)>挂号记录</a></td></tr>"
                }
                $("#userTable tr ").not(":first").not(":last").empty("");
                $("#userTable tr  ").eq(0).after(tr);
                $("#sum").empty().append("总条数：" + data.sum);
                $("#total").empty().append("总页数：" + data.total);
                $("#page").empty();
                for (i = 1; i <= data.total; i++) {
                    if (parseInt(data.page) === i) {
                        option = option + "<option  selected='selected'>" + i + "</option>";
                    } else {
                        option = option + "<option>" + i + "</option>";
                    }
                }
                $("#page").append(option);
            }
        });
    }
    var formData = new FormData();
    formData.append("page", 1);
    query(formData);
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
                    data: {userId: id, status: status},
                    success: function (data) {
                        $(".updateId").parent().children().eq(3).text(status);
                        alert(data);
                        $('#updateUserModal').modal('hide');

                    }
                })

            }

        });
        $('#updateUserModal').on('hide.bs.modal', function () {
            $(".updateId").removeClass("updateId")
        });

        $("#queryUserButton").click(function () {
            var call=$("#queryUserCall").val();
            var formData = new FormData();
            formData.append("page", 1);
            formData.append("call", call);
            query(formData);
        });
        $("#allUser").click(function () {
            var formData = new FormData();
            formData.append("page", 1);
            query(formData);
        })
    });

    function updateUser(a) {
        var parent = $(a).parent().parent();
        parent.children().eq(0).addClass("updateId");
        var name = parent.children().eq(1).text();
        $("#current").empty().append(name + "用户当前状态为：" + parent.children().eq(3).text());
        $('#updateUserModal').modal('show');
    }

    function order(a) {
        var userId = $(a).parent().parent().children().eq(0).text();
        var username = $(a).parent().parent().children().eq(1).text();
      $("#changeContent").load("${pageContext.request.contextPath}/back/user/order?userId="+userId)
    }
    function previousPage() {
        var formData = new FormData();
        var page = parseInt($("#page :selected").text());
        console.log(page);
        if (page === 1) {
            alert("已经是首页")
        } else {
            page = page - 1;
            formData.append("page", page);
            formData.append("userId", userId);
            query(formData);
        }
    }
    function nextPage() {
        var formData = new FormData();
        var page = parseInt($("#page :selected").text());
        var total = $("#total").text();
        total = parseInt(total.substr(total.length - 1, 1));
        if (page === total) {
            alert("已经是尾页");
        } else {
            page = page + 1;
            formData.append("page", page);
            formData.append("userId", userId);
            query(formData);
        }
    }
    function page() {
        var page = parseInt($("#page :selected").text());
        var formData = new FormData();
        formData.append("page", page);
        formData.append("userId", userId);
        query(formData);
    }


</script>
<div id="userDiv">
<nav class="navbar navbar-default">
    <div class="container-fluid">

            <a id="allUser" class="navbar-text">全部</a>
            <form class="navbar-form navbar-left " id="queryUserFrom">
                <div class="form-group">

                        <input type="text" class="form-control" id="queryUserCall" placeholder="输入手机号">


                </div>
                <button type="button" id="queryUserButton" class="btn btn-primary">查询</button>
            </form>


    </div>
</nav>

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
                <span style="float: left;margin-right: 50px" id="total"></span>
                <span style="float: left" id="sum"></span>
                <a onclick="previousPage()">上 一页</a><span>&nbsp&nbsp
                第&nbsp&nbsp
                <select style="width: 35px" id="page" onchange="page()" ></select>
                &nbsp&nbsp页</span>
                <a onclick="nextPage()">下一页</a>

        </tr>
    </table>
</div>
<div id="orderDiv"></div>
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