<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<style type="text/css">
    .red {
        color: red;
    }
</style>

<script>

    $(function () {

        $.ajax({
            url: "${pageContext.request.contextPath}/department/findAllDepartment1",
            success: function (data) {
                var tr;
                console.log(data);
                for (i = 0; i < data.length; i++) {
                    tr = "<tr><td>" + data[i].id + "</td><td>" + data[i].departmentName + "</td><td><a style='margin-right: 50px' type='button'  " + data[i].id + ">删除</a>&nbsp&nbsp<a type='button'>查看所属科室下级</a></td></tr>" + tr;
                }
                $("#department1Table").append(tr);
            }
        });
        $("#department1Table ").on("click", "a", function () {

            var a= $(this).text();

            var  departmentId = $(this).parent().parent().children().eq(0).text();
            if (a === "删除") {
                console.log(a+"  " +departmentId);
                // $("#department2TableDiv").css("display", "block")
                $.ajax({
                    url: "${pageContext.request.contextPath}/department/deleteDepartment",
                    datatype: "json",
                    type: "post",
                    data: {departmentId:departmentId},
                    success: function (data) {
                        console.log(data);
                        window.location.reload();
                        $("#msg").text(data);
                    }
                })
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/department/findDepartment2ByDepartment1",
                    datatype: "json",
                    type: "post",
                    data: {departmentId:departmentId},
                    success: function (data) {
                        var tr;
                        console.log(data);
                        for (i = 0; i < data.length; i++) {
                            tr = "<tr><td>" + data[i].id + "</td><td>" + data[i].departmentName + "</td><td><a  type='button'  " + data[i].id + ">删除</td></tr>" + tr;
                        }
                        $("#department1TableDiv").css("display", "none");
                        $("#department2TableDiv").css("display", "block");
                        $("#department2Table").append(tr);
                    }
                })

            }
        });
        $("#department2Table ").on("click", "a", function () {
            var a= $(this).text();
            var  departmentId = $(this).parent().parent().children().eq(0).text();
            console.log(a+"  " +departmentId);
            $.ajax({
                url: "${pageContext.request.contextPath}/department/deleteDepartment",
                datatype: "json",
                type: "post",
                data: {departmentId:departmentId},
                success: function (data) {
                    console.log(data);
                    $("#msg").text(data);
                }
            })
        });
        $("#red").on("click", "td", function () {
            console.log($(this).text());
            $(".red").removeClass("red");
            $(this).addClass("red");
            // $("#red").style.display="none"
        })
    })

</script>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class=" glyphicon glyphicon-search"></span></div>
                        <input type="text" class="form-control" id="exampleInputAmount" placeholder="输入科室名">
                    </div>
                </div>
                <button type="button" id="findDepartment" class="btn btn-primary">查询</button>
            </form>

        </div>
    </div>
</nav>
<div>
    <span id ="msg" style="color: red;margin-left: 20px"></span>
</div>
<div id="department1TableDiv" style="display: block">
<table id="department1Table" style="table-layout: fixed;margin: auto" type="button" class="table  table-bordered">
    <tr>
        <td align="center" colspan="3"><span style="size: A5;font-weight: bold"> 一级科室列表</span></td>
    </tr>
    <tr>
        <td>科室编号</td>
        <td>科室名</td>
        <td>操作</td>

    </tr>
</table>
</div>
<div id="department2TableDiv" style="display: none">
    <table id="department2Table" type="button" class="table  table-bordered">
        <tr>
            <td align="center" colspan="3"><span id="department1Name" style="size: A5;font-weight: bold"> </span></td>
        </tr>
        <tr>
            <td>科室编号</td>
            <td>科室名</td>
            <td>操作</td>
        </tr>
    </table>
</div>

<div id="findTableDiv">
    <table id="findTable" class="table  table-bordered">

    </table>

</div>
