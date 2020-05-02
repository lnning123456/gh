<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <script src="../boot/js/jquery-2.2.1.min.js"></script>
    <script src="../boot/js/jquery.validate.min.js"></script>
    <script src="../boot/js/jQuerysession.js"></script>
    <script src="../boot/js/bootstrap.min.js"></script>
</head>
<script src="../boot/js/jquery-2.2.1.min.js"></script>
<script>
    $(function () {
        $("#delete").click(function () {
            alert("deldtde");
            $("table tr ").eq(2).empty();
            // $("#select").find("option[text='1']").prop("selected",true);
            //   $("#select").selectedIndex=2;
            // $("#select option:eq(1)").attr("selected","selected");
            //console.log($("#select :selected").text());
        });
        $("#select").change(function () {

            console.log($("#select2 :eq(0)").append("101"));
        });
        /* $("#select option").each(function () {
             var i=1;
             console.log(i+1);
             /!*if ($(this).text() == '3') {
                 $(this).attr("selected", true);
             }*!/
         })*/
        /*for (var i = 0; i < document.getElementById("select").options.length; i++) {

            if (document.getElementById("select").options[i].text === '3') {
                document.getElementById("select").options[i].selected = true;

            }
        }*/

    })
</script>
<select id="select">
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
</select>
<select id="select2">
    <option>3</option>
    <option>5</option>
    <option>7</option>
    <option>9</option>
</select>

<table class="table table-bordered" id="deleteTr">
    <tr>
        <td>可预约人数：12<br>
            预约人数：1<br>
            价格：20.5
        </td>
        <td><button class="btn btn-success">添加</button></td>
        <td>12</td>
    </tr>
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
    <tr>
        <td>1</td>
        <td>13</td>
        <td>12</td>
    </tr>
</table>
<button id="delete">删除</button>
</html>