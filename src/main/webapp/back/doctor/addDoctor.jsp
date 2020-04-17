<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>

<script>
    $(function () {
        $("#selectButton").click(function () {
            $("#img").click();
        });
        $("#img").change(function () {
            $("#src").attr("src", URL.createObjectURL($(this)[0].files[0]));
        });
        $("#addDoctorButton").click(function () {
            var doctorName = $("#doctorName").val();
            var file = $("#img")[0].files[0];
            var formData = new FormData()
            formData.append("img", file);
            $.ajax({
                url: "${pageContext.request.contextPath}/doctor/addDoctor",
                datatype: "json",
                type: "post",
                processData: false,// 不加会报错
                contentType: false,// 不加会报错
                data: formData,
                success: function (data) {


                }
            });
            // console.log(  $("#addDoctorFrom").serialize());
        })
    })

</script>
<div class="row">
    <div class="col-md-12" style="margin: auto">
        <h1 style="color: #0f0f0f;text-align: center">添加科室</h1>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <br>
        <span id="msg" style="color: red;font-size: 20px "></span>
        <br>
        <from class="form-horizontal" id="addDoctorFrom" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="doctorName" class="col-sm-2 control-label">医生名字</label>
                <div class="col-sm-10 form-inline">
                    <input type="text" style="width: 170px" class="form-control" id="doctorName"
                           name="doctorName" placeholder="输入医生名字">
                </div>

            </div>
            <div class="form-group">
                <label for="src" class="col-sm-2 control-label">医生头像</label>
                <div class="col-sm-10 form-inline">
                    <img class="img-thumbnail" style="width: 120px;height: 150px" name="src" id="src" src="" alt="">
                    <br>
                    <br>
                    <button id="selectButton">选择医生头像</button>
                    <input style="display: none" type="file" name="img" id="img" accept="image/*">
                </div>

            </div>
            <div class="form-group">

                <label for="department1" class="col-sm-2 control-label">选择科室</label>
                <div class="col-sm-10 form-inline">
                    <select style="width: 170px" id="department1" name="department1"
                            title="请选择一级科室" class="form-control">
                        <option disabled selected hidden>请选择一级科室</option>
                    </select>
                    <br>
                    <br>
                    <select style="width: 170px" id="department2" name="departmentId"
                            title="请选择二级科室" class="form-control">
                        <option disabled selected hidden>请选择二级科室</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="position" class="col-sm-2 control-label">医生职位</label>
                <div class="col-sm-10 form-inline">
                    <input type="text" style="width: 170px" class="form-control" id="position"
                           name="position" placeholder="输入医生职位">
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
        </from>
    </div>
</div>



