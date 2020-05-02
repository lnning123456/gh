<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<style>
    .queryDepartment {
        color: red;
    }
    .location {
        color: red;
    }
</style>
<script>
    function queryDepartment1() {
        //查询部门1
        $.ajax({
            url: "${pageContext.request.contextPath}/department/queryAllDepartment1",
            success: function (data) {
                $("#departmentDiv").empty().append("科室名：");
                for (var i = 0; i < data.length; i++) {
                    $("#departmentDiv").append("<a style='font-size:15px;margin-left: 30px' onclick='department1(this,\"" + data[i].departmentId + "\")'>" + data[i].departmentName + "<a>");
                }
            }
        });
    }

    queryDepartment1();

    //查询医生
    function query(formData) {
        $.ajax({
            url: "${pageContext.request.contextPath}/doctor/queryDoctor",
            datatype: "json",
            type: "post",
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
                var tr = null;
                var option= null;
                var doctor = data.doctor;
                for (var i = 0; i < doctor.length; i++) {
                    tr = tr + "<tr><td  style='width: 120px'>  <img onclick='work(\"" + doctor[i].doctorId + "\")' class='img-responsiv'   style='width: 80px;height: 100px'   src=${pageContext.request.contextPath}/img/" + doctor[i].src + " </td>" +
                        "<td><h4> <a onclick='work(\"" + doctor[i].doctorId + "\")'>医生姓名</a>：" + doctor[i].doctorName + "</h4>" +
                        " <br>医生职位：" + doctor[i].position + "<br>医生简介:" + doctor[i].presentation+ "</td></tr>";
                }
                $("#doctorTable ").empty().append(tr);
                $("#sum").empty().append("查到医生数：" + data.sum);
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

    $(function () {
        var forData = new FormData();
        forData.append("page", 1);
        query(forData);
        //查询
        $("#queryDoctorButton").click(function () {
            var forData = new FormData();
            forData.append("page", 1);
            forData.append("doctorName", $("#queryDoctorName").val());
            query(forData);

        });

    });

    function department1(t, departmentId) {
        $.ajax({
            url: "${pageContext.request.contextPath}/department/queryDepartment2ByDepartment1",
            datatype: "json",
            type: "post",
            data: {departmentId: departmentId},
            success: function (data) {
                var forData = new FormData();
                forData.append("page", 1);
                forData.append("departmentId", departmentId);
                forData.append("levels", 1);
                query(forData);
                var department = data.department2;
                $("#departmentDiv").empty().append("科室名:");
                for (i = 0; i < department.length; i++) {
                    $("#departmentDiv").append("<a style='font-size:15px;margin-left: 30px' onclick='department2(this,\"" + department[i].departmentId + "\")'>" + department[i].departmentName + "<a>");
                }

            }
        })
    }

    function department2(t, departmentId) {
        var forData = new FormData();
        forData.append("page", 1);
        forData.append("departmentId", departmentId);
        forData.append("levels", 2);
        query(forData);
    }

    //上一页
    function previousPage() {
        var forData = new FormData();
        var page = parseInt($("#page :selected").text());
        if (page === 1) {
            alert("已经是首页")
        } else {
            page = page - 1;
            formData.append("page", page);
            query(formData);
        }
    }

    //下一页
    function nextPage() {
        var formData = new FormData();
        var page = parseInt($("#page :selected").text());
        var total = $("#page option").last().text();
       total = parseInt(total);
        if (page === total) {
            alert("已经是尾页");
        } else {
            page = page + 1;
          //  forData = queryDoctorMsg();
            formData.append("page", page);
            query(formData);
        }
    }
    //点击
    function page() {
        var page = parseInt($("#page :selected").text());
        var formData = new FormData();
      //  forData = queryDoctorMsg();
        formData.append("page", page);
        query(formData);
    }

    function work(doctorId) {
        $('#changeContent').load('work.jsp?doctorId=' + doctorId);
    }
</script>
<br>

<br>
<div id="departmentDiv">
</div>
<br>
<span style="color: red" id="sum"></span>
<br>
<table id="doctorTable" class="table table-bordered">
</table>
<div style="text-align: center">
    <a onclick="previousPage()">上 一页</a><span>&nbsp&nbsp
                第&nbsp&nbsp
                <select style="width: 35px" id="page" onchange="page()"></select>
                &nbsp&nbsp页</span>
            </span><a onclick="nextPage()">下一页</a>
</div>

