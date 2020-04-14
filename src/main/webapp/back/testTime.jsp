<%--
  Created by IntelliJ IDEA.
  User: 李宁
  Date: 2020/3/18
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" pageEncoding="utf-8" %>

<script src="../boot/js/jquery-2.2.1.min.js"></script>
<title>Title</title>

<script>
    var d = new Date();
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    var table;
    var td1 = null;
    var td2 = null;
    for (i = 0; i < 7; i++) {
        // var time=d.getTime()+i*24*60*60*1000;

        //d=d.setTime(time);
        var d2 = (d.getMonth() + 1) + "月" + "/" + d.getDate() + "日" + "/" + arr_week[d.getDay()];
        //  console.log(d2);
        //  console.log(d);
        d.setTime(d.getTime() + 24 * 60 * 60 * 1000);
        td1 = td1 + "<td>" + d2 + "</td>";
        if (i % 2 == 0) {
            td2 = td2 + "<td>无预约</td>";
        } else {
            td2 = td2 + "<td  bgcolor='blue'>有预约</td>";
        }

        //console.log(td1);
        //  console.log(arr_week[1]);
        // console.log(d.Format);
    }
    table = "<tr>" + td1 + "</tr><tr>" + td2 + "</tr>";
    //  console.log(table);

    $(function () {
        $("#table").append(table);
        console.log($("div"));
   });

</script>
hvghv
${requestScope.test}
ffdeffer
<div id="time">
    <table border="1px" id="table" cellpadding="0" cellspacing="0">

        <tr>
            <td>3月/19日/星期四</td>
            <td>3月/20日/星期五</td>
            <td>3月/21日/星期六</td>
            <td>3月/22日/星期日</td>
            <td>3月/23日/星期一</td>
            <td>3月/24日/星期二</td>
            <td>3月/25日/星期三</td>
        </tr>
        <tr>
            <td>无预约</td>
            <td>无预约</td>
            <td>无预约</td>
            <td>无预约</td>
            <td>无预约</td>
            <td>无预约</td>
            <td>无预约</td>
        </tr>
        ﻿

    </table>
</div>


