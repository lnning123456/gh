<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<!doctype html>
    <script>
    //字符串转换时间
    function getDate(strDate) {
        var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,
            function (a) {
                return parseInt(a, 10) - 1;
            }).match(/\d+/g) + ')');
        return date;
    }

    //时间格式
    function Format(now, mask) {
        var d = now;
        var zeroize = function (value, length) {
            if (!length) length = 2;
            value = String(value);
            for (var i = 0, zeros = ''; i < (length - value.length); i++) {
                zeros += '0';
            }
            return zeros + value;
        };

        return mask.replace(/"[^"]*"|'[^']*'|\b(?:d{1,4}|m{1,4}|yy(?:yy)?|([hHMstTa])\1?|[lLZ])\b/g, function ($0) {
            switch ($0) {
                case 'd':
                    return d.getDate();
                case 'dd':
                    return zeroize(d.getDate());
                case 'ddd':
                    return ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'][d.getDay()];
                case 'dddd':
                    return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][d.getDay()];
                case 'M':
                    return d.getMonth() + 1;
                case 'MM':
                    return zeroize(d.getMonth() + 1);
                case 'MMM':
                    return ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][d.getMonth()];
                case 'MMMM':
                    return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][d.getMonth()];
                case 'yy':
                    return String(d.getFullYear()).substr(2);
                case 'yyyy':
                    return d.getFullYear();
                case 'h':
                    return d.getHours() % 12 || 12;
                case 'hh':
                    return zeroize(d.getHours() % 12 || 12);
                case 'H':
                    return d.getHours();
                case 'HH':
                    return zeroize(d.getHours());
                case 'm':
                    return d.getMinutes();
                case 'mm':
                    return zeroize(d.getMinutes());
                case 's':
                    return d.getSeconds();
                case 'ss':
                    return zeroize(d.getSeconds());
                case 'l':
                    return zeroize(d.getMilliseconds(), 3);
                case 'L':
                    var m = d.getMilliseconds();
                    if (m > 99) m = Math.round(m / 10);
                    return zeroize(m);
                case 'tt':
                    return d.getHours() < 12 ? 'am' : 'pm';
                case 'TT':
                    return d.getHours() < 12 ? 'AM' : 'PM';
                case 'a':
                    return d.getHours() < 12 ? '上午' : '下午';
                case 'Z':
                    return d.toUTCString().match(/[A-Z]+$/);
                // Return quoted strings with the surrounding quotes removed
                default:
                    return $0.substr(1, $0.length - 2);
            }
        });
    }


    var userId = $("#userId").text();
    //


    //查询订单
    function query(formData) {
        $.ajax({
            url: "${pageContext.request.contextPath}/order/queryOrder",
            datatype: "json",
            type: "post",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                var tr = null;
                var td = null;
                var option = null;
                var order = data.orders;

                for (var i = 0; i < order.length; i++) {
                    var date = getDate(order[i].work.time);
                    var time = Format(date, "yyyy-MM-dd  a");
                    td = "<td>" + order[i].orderId + "</td><td>" + order[i].work.doctor.doctorName + "</td>" +
                        "<td>" + time + "</td><td>" + order[i].createTime + "</td><td>" + order[i].work.price + "</td>" +
                        "<td>" + order[i].status + "</td>";
                    if (order[i].status === "已预约") {
                        td = td + "<td><a type='button' onclick='updateOrder(this,\""+order[i].workId+"\")' >取消</a></td>"

                    } else {
                        td = td + "<td><a type='button' onclick='deleteOrder(this)' >删除</a></td>";
                    }

                    tr = tr + "<tr>" + td + "</tr>";
                }

                $("#orderTable tr ").not(":first").not(":last").empty("");
                $("#orderTable tr  ").eq(0).after(tr);
                $("#sum").empty().append("总条数：" + data.sum);
                $("#total").empty().append("总页数：" + data.total);
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
    var formData = new FormData();
    formData.append("userId", userId);
    formData.append("page", 1);
    query(formData);
    //修改
    function updateOrder(t,workId) {
        var orderId = $(t).parent().parent().children().eq(0).text();
        var workId = workId;
        console.log(orderId);
        $.ajax({
            url: "${pageContext.request.contextPath}/order/updateOrder",
            datatype: "json",
            type: "post",
            data: {orderId: orderId, status: '已取消',workId:workId},
            success: function (data) {
                $(t).parent().parent().children().eq(5).text("已取消");
                $(t).parent().parent().children().eq(6).html("<a type='button' onclick='deleteOrder(this)' >删除</a>");
                alert(data);
            }
        })
    }
    function deleteOrder(t) {
        var orderId = $(t).parent().parent().children().eq(0).text();
        $.ajax({
            url: "${pageContext.request.contextPath}/order/deleteOrder",
            datatype: "json",
            type: "post",
            data: {orderId: orderId},
            success: function (data) {
                $(t).parent().parent().remove();
                alert(data);
            }
        })
    }
    function previousPage() {
        var formData = new FormData();
        var page = parseInt($("#page :selected").text());
        if (page === 1) {
            alert("已经是首页")
        } else {
            page = page - 1;

            formData.append("page", page);
            formData.append("userId", userId);
            query(formData);
        }
    }
    function nextPage() {
        var formData = new FormData();
        var page = parseInt($("#page :selected").text());
        var total = $("#total").text();
        total = parseInt(total.substr(total.length - 1, 1));
        if (page === total) {
            alert("已经是尾页");
        } else {
            page = page + 1;
            formData.append("page", page);
            formData.append("userId", userId);
            query(formData);
        }
    }
    function page() {
        var page = parseInt($("#page :selected").text());
        var formData = new FormData();
        formData.append("page", page);
        formData.append("userId", userId);
        query(formData);
    }
    $(function () {
        $("#compare").change(function () {
            var compare=$("#compare :selected").val();
            var formData = new FormData();
            formData.append("userId", userId);
            formData.append("page", 1);
            formData.append("compare", compare);
            query(formData);
        });
    })

</script>


<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <form class="navbar-form  " id="queryWorkFrom">
                <div class="form-group">
                    <div class="form-inline">
                        <label for="compare" class="control-label">选择时间：</label>
                        <select style="width: 170px" id="compare" name="compare" class="form-control">
                            <option value="">全部</option>
                            <option value="1">已完成</option>
                            <option value="2">已预约</option>
                        </select>

                    </div>
                </div>
            </form>

        </div>
    </div>
</nav>
<table id="orderTable" class="table table-bordered">
    <tr>
        <td>订单编号</td>
        <td>预约医生</td>
        <td>就诊时间</td>
        <td>预约时间</td>
        <td>价格</td>
        <td>预约状态</td>
        <td>操作</td>
    </tr>

    <tr>
        <td colspan="7" style="text-align: center">
            <span style="float: left;margin-right: 50px" id="total"></span>
            <span style="float: left" id="sum"></span>
            <a onclick="previousPage()">上 一页</a><span>&nbsp&nbsp
                第&nbsp&nbsp
                <select style="width: 35px" id="page" onchange="page()" ></select>
                &nbsp&nbsp页</span>
            <a onclick="nextPage()">下一页</a>

        </td>
    </tr>
</table>