<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<!doctype html>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-2">
            <h3>选择操作</h3>
            <br>
            <div class="panel-body">
                <li> <a href="javascript:$('#myContent').load('${pageContext.request.contextPath}/front/order')">挂号记录</a></li>
               <br>
                <li><a href="javascript:$('#myContent').load('${pageContext.request.contextPath}/front/updatePassword')">修改密码</a></li>

        </div>
        </div>
        <div id="myContent" class="col-xs-10">
    </div>
    </div>
</div>