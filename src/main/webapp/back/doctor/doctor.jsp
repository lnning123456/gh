<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<script>
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

        //查询医生
        function queryDoctor(formData) {
            $.ajax({
                url: "${pageContext.request.contextPath}/doctor/queryDoctor",
                datatype: "json",
                type: "post",
                processData: false,
                contentType: false,
                data: formData,
                success: function (data) {
                    var tr = null;
                    var doctor = data.doctor;
                    var department;
                    for (i = 0; i < doctor.length; i++) {
                        console.log(doctor[i]);
                        tr = tr + "<tr><td>" + doctor[i].doctorId + "</td><td>" + doctor[i].doctorName
                            + "</td><td><img style='height: 80px;width: 70px' src='${pageContext.request.contextPath}/img/" + doctor[i].src + "'</td><td>"
                            + doctor[i].department.departmentName + "</td><td>" + doctor[i].position + "</td><td>" + doctor[i].status
                            + "</td><td ><a  >详情</a>" +
                            "<a style=\"margin-left: 50px\" >值班</a><a  onclick='deleteDoctor(this)' style=\"margin-left: 30px\" >删除</a></td></tr>"
                    }
                    $("#doctorTable tr  ").eq(0).after(tr);
                    $("#sum").empty().append(data.sum);
                    $("#total").empty().append(data.total);
                    $("#page").empty();
                    for (i = 1; i <=data.total; i++) {
                        $("#page").append("<option>" + i + "</option>");
                    }
                }
            });
        }

        //调用查询医生
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
            } else if ($("#department2 :selected").val() != "") {
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

        });

        //分页
        $("#page").change(function () {
            var forData = new FormData();
            forData = queryDoctorMsg();
            forData.append("page", parseInt($("#page :selected").text()));
            queryDoctor(forData);
            console.log(typeof page);
        });
        //模态框关闭
        $('#deleteDoctorModal').on('hide.bs.modal', function () {
            console.log('模态框关闭了');
            $(".deleteTr").removeClass("deleteTr")
        });
        //确定删除
        $('#sure').click(function () {
            console.log($(".deleteTr"));
            var doctorId = $(".deleteTr").children().eq(0).text();
            console.log(doctorId);
            $.ajax({
                url: "${pageContext.request.contextPath}/doctor/deleteDoctor",
                datatype: "json",
                type: "post",
                data: {doctorId: doctorId},
                success: function (data) {
                    alert(data);
                    if (data.endsWith("删除成功")) {
                        $(".deleteTr").remove();
                    }

                }
            })
        })
    });

    //删除
    function deleteDoctor(a) {
        var id = $(a).parent().parent().children().eq(0).text();
        console.log($(a).parent().parent().addClass("deleteTr"));
        console.log(id);
        var name = $(a).parent().parent().children().eq(1).text();
        $("#deleteDoctorMsg").empty().append(name);
        $('#deleteDoctorModal').modal('show');
        //  $('#sure').attr('onclick','sureDelete()');
    }


    //修改
</script>
<style type="text/css">
    td {
        text-align: center;
       vertical-align: middle;

    }
</style>
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

<div id="doctorDiv">
    <table id="doctorTable" class="table table-bordered">
        <tr>
            <td >医生编号</td>
            <td>医生姓名</td>
            <td>医生头像</td>
            <td>所在部门</td>
            <td>职位</td>
            <td>状态</td>
            <td>操作</td>
        </tr>

        <tr>
            <td colspan="7" style="text-align: center">
                <span>第&nbsp&nbsp
                <select style="width: 35px" id="page"></select>&nbsp&nbsp页</span>
                总页数: <span id="total"></span> &nbsp&nbsp总条数：<span id="sum"></span></td>
        </tr>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="deleteDoctorModal" tabindex="-1" role="dialog" aria-labelledby="deleteDoctorModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 style="text-align: center;color: red" class="modal-title" id="deleteDoctorModalLabel">删除医生</h4>
            </div>
            <div class="modal-body">
                确定删除<span id="deleteDoctorMsg"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="sure" class="btn btn-danger">确定</button>
            </div>
        </div>
    </div>
</div>