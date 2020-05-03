<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<style type="text/css">
    label.error {
        color: red;
        margin-left: 50px;
    }
</style>
<script>
    $(function () {
        $("#addDepartmentFrom").validate({
            errorPlacement: function (error, element) {
                if (element.is(":radio")) {
                    console.log(error);
                    console.log(element);
                    error.appendTo(element.parent().next().parent());
                } else {
                    error.appendTo(element.parent());
                }
            },
            rules: {
                departmentName: {required: true}
            },
            messages: {
                departmentName: {required: "请输入科室名"}
            }
        });
        $(":radio").click(function () {
            var levels = parseInt($(":radio:checked").val());
            var option;
            if (levels === 1) {
                $("#parentId").empty().attr("disabled", "disabled");
                option = "<option >二级科室才可选择</option>";
                $("#parentId").append(option);

            } else {
                $("#parentId").removeAttr("disabled").empty();
                $.ajax({ //一级科室
                    url: "${pageContext.request.contextPath}/department/queryAllDepartment1",
                    success: function (data) {
                        option = "<option disabled selected hidden>请选择上级科室</option>"
                        for (i = 0; i < data.length; i++) {
                            option = option + "<option value=" + data[i].departmentId + ">" + data[i].departmentName + "</option>";
                        }
                        $("#parentId").append(option);
                    }
                });
            }


        });
        $("#addDepartment").click(function () {
            var formData = new FormData($("#addDepartmentFrom")[0]);
            var flag = $("#addDepartmentFrom").valid();

            if (flag) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/department/addDepartment",
                    datatype: "json",
                    type: "post",
                    processData: false,
                    contentType: false,
                    data: formData,
                    success: function (data) {
                        //   console.log(data);//972128
                        document.getElementById("addDepartmentFrom").reset();
                        $("#parentId").empty().attr("disabled", "disabled").append("<option >二级科室才可选择</option>");
                        /*$("#parentId").;*/
                        alert(data)
                    }
                })
            }
        });
    })
</script>
<div class="row">
    <div class="col-md-12" style="margin: auto">
        <h1 style="color: #0f0f0f;text-align: center">科室添加</h1>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <br>
        <span id="msg" style="color: red;font-size: 20px "></span>
        <br>
        <form class="form-horizontal" id="addDepartmentFrom">
            <div class="form-group">
                <label class="col-sm-2 control-label">科室级别</label>
                <div class="col-sm-10 form-inline">
                    <label class="radio-inline">
                        <input type="radio" name="levels" id="levels1" value="1" title="请选择科室级别" required> 一级科室
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="levels" id="levels2" value="2"> 二级科室
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="parentId" class="col-sm-2 control-label">上级科室</label>
                <div class="col-sm-10 form-inline">
                    <select disabled="disabled" style="width: 170px" id="parentId" name="parentId"
                            class="form-control">
                        <option>二级科室才可选择</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="departmentName" class="col-sm-2 control-label">科室名称</label>
                <div class="col-sm-10 form-inline">
                    <input type="text" style="width: 170px" class="form-control" id="departmentName"
                           name="departmentName" placeholder="输入科室名称">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <button type="button" id="addDepartment" class="btn btn-primary">确定添加</button>
                   <%-- <input id="departmentSubmit"  type="" />--%>
                </div>
            </div>

        </form>
    </div>

</div>
