<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>线上挂号</title>
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="../jqgrid/css/jquery-ui.css">
    <link rel="stylesheet" href="../jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script src="../boot/js/jQuerysession.js"></script>
    <script src="../boot/js/bootstrap.min.js"></script>
    <script type="text/javascript" language="JavaScript"></script>
</head>
<br>
<nav class="navbar navbar-default" style="background: #79c9ec;">
    <div class="container">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                <h3 class="navbar-text">线上挂号</h3>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon"><span class=" glyphicon glyphicon-search"></span></div>
                            <input type="text"  class="form-control" id="queryDoctorInput" placeholder="输入科室名/医生名">
                        </div>
                    </div>
                    <button type="button" id="queryDoctorButton" class="btn btn-primary">查询</button>
                </form>
                    <div class="navbar-text navbar-right" >
                        <c:if test="${sessionScope.username==null}">
                            您好,请选择  <a href="javascript:$('#changeContent').load('index.jsp')"> 登录</a>&nbsp|&nbsp<a href="javascript:$('#changeContent').load('register.jsp')" >注册</a>
                        </c:if>
                        <c:if test="${sessionScope.username!=null}">
                            <span class="text-primary">您好,用户${sessionScope.username} </span>
                            <a  href="">退出登录 <span class="glyphicon glyphicon-log-out"></span></a>
                        </c:if>

                </div>

            </div>
        </div>

    </div>
</nav>
<br>
<div class="row">
    <div class="col-sm-2" ></div>
    <div class="col-sm-8" id="changeContent" >

    </div>
</div>
</html>