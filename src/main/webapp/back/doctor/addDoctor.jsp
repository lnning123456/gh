<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; utf-8" %>

<head>
    <style type="text/css">
        label.error {
            color: red;
            margin-left: 50px;
        }

        img[src=""], img:not([src]) {
            opacity: 0;
        }

    </style>
    <script type="text/javascript">
        $(function () {


            $("#addDoctorForm").validate({
                //规定验证规则
                rules: {
                    doctorName: {required: true},
                    presentation: {required: true}
                },
                messages: {
                    doctorName: {required: "医生姓名不能为空！"},
                    presentation: {required: "医生简介不能为空！"}

                }
            });
            $("#selectButton").click(function () {
                $("#img").click();
            });
            $("#img").change(function () {
                $("#src").attr("src", URL.createObjectURL($(this)[0].files[0]));
                console.log($("#src").attr("src"));
            });
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
            $("#department1").click(function () {
                var departmentId = $("#department1 :selected").val();
                if (departmentId!=="") {
                    $("#departmentId :gt(0)").remove();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/department/queryDepartment2ByDepartment1",
                        datatype: "json",
                        type: "post",
                        data: {departmentId: departmentId},
                        success: function (data) {
                            var department = data.department2;
                            console.log(department);
                            var option;
                            for (i = 0; i <  department.length; i++) {
                                option = option + "<option value=" +  department[i].departmentId + ">" +  department[i].departmentName + "</option>";
                            }
                            $("#departmentId").append(option);
                        }
                    })

                }else {
                    $("#departmentId :gt(0)").remove();
                }


            });
            $("#addDoctorButton").click(function () {
                var formData = new FormData($("#addDoctorForm")[0]);
                var flag = $("#addDoctorForm").valid();
                if (flag) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/doctor/addDoctor",
                        datatype: "json",
                        type: "post",
                        processData: false,
                        contentType: false,
                        data: formData,
                        cache: false,
                        async: false,
                        success: function (data) {
                           // window.location.reload()
                            document.getElementById("addDoctorForm").reset();
                           alert(data)
                        }
                    });
                }

            })
        })

    </script>
</head>
<div class="row">
    <div class="col-md-12" style="margin: auto">
        <h1 style="color: #0f0f0f;text-align: center">添加医生</h1>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <br>

        <br>
        <form class="form-horizontal" id="addDoctorForm" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="doctorName" class="col-sm-2 control-label">医生名字</label>
                <div class="col-sm-10 form-inline">
                    <input type="text" style="width: 170px" class="form-control" id="doctorName"
                           name="doctorName" placeholder="输入医生名字">
                </div>

            </div>
            <div class="form-group" style="">
                <label for="src" class=" col-sm-2 control-label">医生头像</label>
                <div class="col-sm-10 form-inline">
                    <div class="panel panel-default" style="width: 150px;height: 165px">

                        <div class="panel-body" style="margin-left: auto;margin-right: auto;display: block">
                            <img class="img-responsive" style="width: 120px;height: 130px" name="src" id="src" src=""
                                 alt="">

                        </div>
                    </div>


                    <button type="button" id="selectButton">选择医生头像</button>
                    <input style="display: none" type="file" name="img" id="img" accept="image/*">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">选择科室</label>
                <div class="col-sm-10 form-inline">
                    <select style="width: 170px" id="department1" name="department1"
                            title="请选择一级科室" class="form-control">
                        <option value="">请选择一级科室</option>
                    </select>
                    <br>
                    <br>
                    <select style="width: 170px" id="departmentId" name="departmentId"
                            title="请选择二级科室" class="form-control">
                        <option value="" <%--disabled selected hidden--%>>请选择二级科室</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="position" class="col-sm-2 control-label">医生职位</label>
                <div class="col-sm-10 form-inline">
                    <select style="width: 170px" id="position" name="position" class="form-control">
                        <option value="">请选择医生职位</option>
                        <option value="主治医师">主治医师</option>
                        <option value="副主任医师">副主任医师</option>
                        <option value="主任医师">主任医师</option>
                    </select>
                </div>

            </div>
            <div class="form-group">
                <label for="presentation" class="col-sm-2 control-label">医生简介</label>
                <div class="col-sm-10 form-inline">
                    <textarea style="width: 300px;height: 200px" class="form-control"
                              id="presentation" name="presentation" placeholder="医生简介"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 form-inline"></div>
                <div class="col-sm-10 form-inline">
                    <button id="addDoctorButton" type="button" class="btn btn-primary">确定添加</button>
                </div>
            </div>
        </form>

    </div>

</div>



