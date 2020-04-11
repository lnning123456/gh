<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $("#file").change(function () {

        var r = new FileReader();
        var f = document.getElementById('file').files[0];
        console.log(f);

        r.readAsDataURL(f);
        console.log(f);
        console.log(r);
        r.onload = function (e) {
            document.getElementById('src').src = this.result;

        };
    })
</script>
<body>
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
                <label for="doctorName" class="col-sm-2 control-label">医生头像</label>
                <div class="col-sm-10 form-inline">
                    <img style="width: 120px;height: 150px" id="src" src="" class="img-thumbnail">
                    <br>
                    <br>
                    <label for="file">
                        <input type="file" id="file" accept="image/*" hidden>
                    </label>
                </div>

            </div>
            <div class="form-group">

                <label for="department1" class="col-sm-2 control-label">选择科室</label>
                <div class="col-sm-10 form-inline">
                    <select  style="width: 170px" id="department1" name="department1"
                            title="请选择一级科室" class="form-control">
                        <option>请选择一级科室</option>
                    </select>
                    <br>
                    <br>
                    <select  style="width: 170px" id="department2" name="department2"
                            title="请选择二级科室" class="form-control">
                        <option>请选择二级科室</option>
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
                    <textarea  style="width: 300px;height: 200px" class="form-control"
                               id="presentation" name="presentation" placeholder="医生简介"></textarea>
                </div>

            </div>

        </from>
    </div>
</div>

</body>


