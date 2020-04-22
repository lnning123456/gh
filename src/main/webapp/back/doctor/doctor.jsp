<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<script type="text/javascript">
    $(function () {
//查询部门1
        $.ajax({
            url: "${pageContext.request.contextPath}/department/queryAllDepartment1",
            success: function (data) {
                var option;
                for (i = 0; i < data.length; i++) {
                    option = option + "<option value=" + data[i].departmentId + ">" + data[i].departmentName + "</option>";
                }
                $("#department1").append(option);
            }
        });
        //查询部门2
        $("#department1").change(function () {
            var departmentId = $("#department1 :selected").val();
            if (departmentId !== "") {
                $("#department2 :gt(0)").remove();
                $.ajax({
                    url: "${pageContext.request.contextPath}/department/queryDepartment2ByDepartment1",
                    datatype: "json",
                    type: "post",
                    data: {departmentId: departmentId},
                    success: function (data) {
                        var department = data.department2;
                        console.log(department);
                        var option;
                        for (i = 0; i < department.length; i++) {
                            option = option + "<option value=" + department[i].departmentId + ">" + department[i].departmentName + "</option>";
                        }
                        $("#department2").append(option);
                    }
                })

            } else {
                $("#department2 :gt(0)").remove();
            }
        });

        //查询全部医生
        function queryDoctor(formData) {
            $.ajax({
                url: "${pageContext.request.contextPath}/doctor/queryDoctor",
                datatype: "json",
                type: "post",
                processData: false,
                contentType: false,
                data: formData,
                success: function (data) {
                    var option;
                    var tr = null;
                    var doctor = data.doctor;
                    var department;
                    for (i = 0; i < doctor.length; i++) {
                        src = doctor[i].src;
                        console.log(src);
                        tr = tr + "<tr><td>" + doctor[i].doctorId + "</td><td>" + doctor[i].doctorName
                            + "</td><td><img style=\"height: 80px;width: 70px\" src='${pageContext.request.contextPath}/img/" + doctor[i].src + "'</td><td>"
                            + doctor[i].department.departmentName + "</td><td>" + doctor[i].position + "</td><td>" + doctor[i].status
                            + "</td><td></tr></tr>"
                    }
                    $("#doctorTable tr  ").eq(0).after(tr);
                    console.log(data);
                }
            });
        }

        //调用查询全部医生
        var forData = new FormData();
        forData.append("page", 1);
        queryDoctor(forData);

        //获取查询信息
        function queryDoctorMsg() {
            var forData = new FormData();
            var departmentName = $("#department1 :selected").text();
            var department2Name = $("#department2 :selected").text();
            if ($("#department2 :selected").val() != "") {
                forData.append("departmentName", department2Name);
                forData.append("levels", 2);
            } else {
                forData.append("levels", 1);
                forData.append("departmentName", departmentName);
            }
            return forData;
        }

        //查询
        $("#queryDoctorButton").click(function () {
            $("#doctorTable tr:not(:last ):not(:first)").remove();
            var forData = new FormData();
            forData = queryDoctorMsg();
            forData.append("page", 1);
            queryDoctor(forData);
            /*
             $("#doctorTable tr  ").eq(0).after("");
             $("#page").append(8);*/

        });
        //分页
        $("#page").change(function () {
            var forData = new FormData();
            forData = queryDoctorMsg();
            forData.append("page", parseInt($("#page :selected").text()));
            queryDoctor(forData);
            console.log(typeof page);
        })
    });

</script>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <form class="navbar-form " id="queryDoctorFrom">
                <div class="form-group">
                    <div class="form-inline">
                        <select style="width: 170px" id="department1" name="department1" class="form-control">
                            <option value="">请选择一级科室</option>
                        </select>
                        <select style="width: 170px" id="department2" name="department2" class="form-control">
                            <option value="">请选择二级科室</option>
                        </select>
                        <input type="text" class="form-control" id="queryDoctorInput" placeholder="输入医生名字">

                    </div>


                </div>
                <button type="button" id="queryDoctorButton" class="btn btn-primary">查询</button>
            </form>

        </div>
    </div>
</nav>

<div>
    <table id="doctorTable" class="table table-bordered">
        <tr>
            <td>医生编号</td>
            <td>医生姓名</td>
            <td>医生头像</td>
            <td>所在部门</td>
            <td>职位</td>
            <td>状态</td>
            <td>操作</td>
        </tr>

        <tr>
            <td colspan="7" style="text-align: center">
                <span></span> <span>第&nbsp&nbsp
                <select style="width: 35px" id="page"><option>1</option><option>2</option></select>&nbsp&nbsp页</span>
                <span id="sum">总条数：</span>&nbsp&nbsp<span id="total">总页数</span></td>
        </tr>
    </table>


</div>