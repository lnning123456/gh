<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<script>
    $(function () {
        $.ajax({ //一级科室
            url: "${pageContext.request.contextPath}/department/findAllDepartment1",
            success: function (data) {
                var tr;
                for (i = 0; i < data.length; i++) {
                    tr = "<tr><td>" + data[i].id + "</td><td>" + data[i].departmentName + "</td><td><a style='margin-right: 50px' type='button' >删除</a>&nbsp&nbsp<a type='button'>查看所属下级科室</a></td></tr>" + tr;
                }
                $("#department1Table").append(tr);
            }
        });
        $("table").on("click", "a", function () {
            var a = $(this).text();
            var tr = $(this).parent().parent();
            var departmentId = $(this).parent().parent().children().eq(0).text();
            //删除
            if (a === "删除") {
                $.ajax({
                    url: "${pageContext.request.contextPath}/department/deleteDepartment",
                    datatype: "json",
                    type: "post",
                    data: {departmentId: departmentId},
                    success: function (data) {
                        if (data.ok === "ok") {
                            tr.remove();
                        }
                        $("#msg").text(data.msg);
                    }
                })

            } else {  //查看所属下级科室
                $.ajax({
                    url: "${pageContext.request.contextPath}/department/findDepartment2ByDepartment1",
                    datatype: "json",
                    type: "post",
                    data: {departmentId: departmentId},
                    success: function (data) {
                        console.log(data);
                        var department1Name = data.department1Name;
                        var department2 = data.department2;
                        var tr;
                        for (i = 0; i < department2.length; i++) {
                            tr = "<tr><td>" + department2[i].id + "</td><td>" + department2[i].departmentName + "</td><td><a  type='button'  " + department2[i].id + ">删除</td></tr>" + tr;
                        }
                        console.log(department1Name);
                        $("#department1Name").text(department1Name);
                        $("#department1TableDiv").css("display", "none");
                        $("#findTableDiv").css("display", "none");
                        $("#department2TableDiv").css("display", "block");
                        $("#department2Table").append(tr);
                    }
                })

            }
        });
        //查询
        $("#findDepartmentButton").click(function () {
            var departmentName = $("#findDepartmentInput").val();
            console.log(departmentName);
            $.ajax({
                url: "${pageContext.request.contextPath}/department/findByDepartmentName",
                datatype: "json",
                type: "post",
                data: {departmentName: departmentName},
                success: function (data) {
                    var tr;
                    if (data.levels === 1) {
                        tr = "<tr><td>" + data.id + "</td><td>" + data.departmentName + "</td><td>一级科室</td><td><a style='margin-right: 50px' type='button'  " + data.id + ">删除</a>&nbsp&nbsp<a type='button'>查看所属科室下级</a></td></tr>";
                    } else {
                        tr = "<tr><td>" + data.id + "</td><td>" + data.departmentName + "</td><td>二级科室</td><td><a  type='button'  " + data.id + ">删除</td></tr>";
                    }

                    $("#findTbody").children().eq(1).remove();
                    $("#findTable").append(tr);
                }
            });
            $("#department1TableDiv").css("display", "none");
            $("#department2TableDiv").css("display", "none");
            $("#findTableDiv").css("display", "block");
        });
        //返回
        $(".back").click(function () {
            $("#department1TableDiv").css("display", "block");
            $("#department2TableDiv").css("display", "none");
            $("#findTableDiv").css("display", "none");

        });
    })

</script>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class=" glyphicon glyphicon-search"></span></div>
                        <input type="text" class="form-control" id="findDepartmentInput" placeholder="输入科室名">
                    </div>
                </div>
                <button type="button" id="findDepartmentButton" class="btn btn-primary">查询</button>
            </form>

        </div>
    </div>
</nav>
<div>
    <span id="msg" style="color: red;margin-left: 20px"></span>
</div>
<div id="department1TableDiv" style="display: block">
    <table id="department1Table" style="table-layout: fixed;margin: auto" type="button" class="table  table-bordered">
        <tr>
            <td align="center" colspan="3"><span id="title" style="size: A5;font-weight: bold"> 一级科室列表</span></td>
        </tr>
        <tr>
            <td>科室编号</td>
            <td>科室名</td>
            <td>操作</td>
        </tr>
    </table>
</div>