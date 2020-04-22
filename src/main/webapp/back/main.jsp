<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<!doctype html>
<html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script src="../boot/js/jQuerysession.js"></script>
    <script src="../boot/js/bootstrap.min.js"></script>
    <title>挂号后台</title>
    <style type="text/css">
        body { padding-top: 70px; }
    </style>
    <script type="text/javascript" language="JavaScript">
        $(function () {
            $("#logout").click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/logout",
                    success: function () {
                        location.href = "${pageContext.request.contextPath}/back/login.jsp"
                    }
                })
            })
        })

    </script>
</head>
<br/>
<nav class="navbar navbar-default navbar-fixed-top" style="height: 60px">
    <div class="container">
        <h3 class="navbar-text">线上挂号后台管理系统</h3>
        <div class="navbar-text navbar-right" >
               管理员：<span class="text-primary">${sessionScope.admin.name} </span>
                <a id="logout" type="button">退出登录 <span class="glyphicon glyphicon-log-out"></span></a>
    </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                               aria-expanded="true" aria-controls="collapseOne">
                                科室管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <li><a href="javascript:$('#changeContent').load('department/department.jsp')">科室列表</a></li>
                        </div>
                        <div class="panel-body">
                            <li><a href="javascript:$('#changeContent').load('department/addDepartment.jsp')">科室添加</a>
                            </li>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                医生管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <li><a href="javascript:$('#changeContent').load('doctor/doctor.jsp')">医生列表</a></li>
                        </div>
                        <div class="panel-body">
                            <li><a href="javascript:$('#changeContent').load('doctor/addDoctor.jsp')">添加医生</a></li>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            <li><a href="javascript:$('#changeContent').load('user.jsp')">用户列表</a></li>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingF">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseF" aria-expanded="false" aria-controls="collapseF">
                                预约管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseF" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingF">
                        <div class="panel-body">
                            <li><a href="javascript:$('#changeContent').load('order.jsp')">预约列表</a></li>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="changeContent" class="col-xs-10">
            <div class="jumbotron" style="height: 175px">
                <h3>欢迎来到线上挂号后台管理系统,选择左侧项目进行管理</h3>
            </div>

        </div>
    </div>
</div>

</html>