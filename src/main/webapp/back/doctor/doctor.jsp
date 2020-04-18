<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<script>
    $(function () {

    });
    /*$.ajax(function () {

    })*/
</script>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class=" glyphicon glyphicon-search"></span></div>
                        <input type="text" class="form-control" id="findDoctorInput" placeholder="输入科室名/医生名字">
                    </div>
                </div>
                <button type="button" id="findDoctorButton" class="btn btn-primary">查询</button>
            </form>

        </div>
    </div>
</nav>

<div>
    <table id="doctorTable" class="table table-bordered">
        <tbody id="doctorTbody">
           <tr>
               <td>医生编号</td>
               <td>医生姓名</td>
               <td>医生头像</td>
               <td>所在部门</td>
               <td>职位</td>
               <td>状态</td>
               <td>操作</td>
           </tr>
        </tbody>
    </table>
</div>