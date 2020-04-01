<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<script>

    $(function () {
        var tr;
        var table;
        $.ajax({
            url: "${pageContext.request.contextPath}/department/findAllDepartment",
            success: function (data) {
                console.log(data);
                for (i = 0; i < data.length; i++) {

                     if (data[i].levels==1) {
                         var count=3;
                         for (j = 0; j< data.length; j++) {
                             if (data[j].levels===2&&data[j].parentId===data[i].id) {
                                 count++;
                                 tr="<tr><td>"+data[i].departmentName+"</td><td>添加</td><td>"+data[j].departmentName+"</td></tr>"+tr;
                             }
                         }
                         console.log(count);
                        // tr="<tr><th rowspan="+count+">"+data[i].departmentName+"</th><th rowspan="+count+">添加删除</th></tr>"+tr

                     }


                }
                $("#departmentTable").append(tr)
            }

        });
    })

</script>


<form class="form-inline">
    <div class="form-group">
        <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
        <div class="input-group">
            <div class="input-group-addon"><span class=" glyphicon glyphicon-search"></span></div>
            <input type="text" class="form-control" id="exampleInputAmount" placeholder="输入科室名">
        </div>
    </div>
    <button type="button" id="findDepartment" class="btn btn-primary">查询</button>
</form>
<br>
<table id="departmentTable" class="table  table-striped" >
    <tr>
        <th>科室名</th>
        <th>科室级别</th>
        <th>操作</th>

    </tr>

</table>
