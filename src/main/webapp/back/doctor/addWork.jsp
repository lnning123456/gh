<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<script>

    function getDate(strDate) {
        var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,
            function (a) {
                return parseInt(a, 10) - 1;
            }).match(/\d+/g) + ')');
        return date;
    }

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
                    return ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'][d.getDay()];
                case 'dddd':
                    return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][d.getDay()];
                case 'M':
                    return d.getMonth() + 1;
                case 'MM':
                    return zeroize(d.getMonth() + 1);
                case 'MMM':
                    return ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'][d.getMonth()];
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

    var works = null;
    var followingDoctorId = $("#followingDoctorId").text();
    $.ajax({
        url: "${pageContext.request.contextPath}/work/followingWork",
        datatype: "json",
        type: "post",
        data: {doctorId: followingDoctorId},
        async: false,
        success: function (data) {
            works = data;
        }
    });

    console.log(works);
    var now = new Date();
    var nowFullYear = now.getFullYear();
    var nowMonth = now.getMonth();
    var nowDate = now.getDate();
   var  amDate= new Date(nowFullYear, nowMonth, nowDate , 8);
   var  pmDate= new Date(nowFullYear, nowMonth, nowDate , 2);
    var td1 = "<td></td>";
    var addTd2 = null;
    var addTd3 = null;
    var td2 = "<td>上午</td>";
    var td3 = "<td>下午</td>";
    for (var i = 1; i <= 7; i++) {
        td1 = td1 + "<td>" + Format(amDate, "yyyy/MM/dd  ddd") + "</td>";
        for (var j = 0; j < works.length; j++) {
            var time = getDate(works[j].time);
            if (Format(amDate, "yyyy/MM/dd a") === Format(time, "yyyy/MM/dd a")) {
                addTd2 = "<td>" + works[j].price + "</td>";
            }
            if (Format(pmDate, "yyyy/MM/dd a") === Format(time, "yyyy/MM/dd a")) {
                addTd3 = "<td>可预约人数：" + works[j].remain + "</td>";
            }
        }
        if(addTd2!=null){
            td2 = td2 +addTd2;
        }else {
            td2 = td2 +"<td></td>";
        } if(addTd3!=null){
            td3 = td3 +addTd3;
        }else {
            td3 = td3 +"<td></td>";
        }
       addTd2=null;
        addTd3=null;
        amDate = new Date(nowFullYear, nowMonth, nowDate + i, 8);
        pmDate = new Date(nowFullYear, nowMonth, nowDate + i, 2);
    }
    $("#addWorkTable").append("<tr>" + td1 + "</tr><tr>" + td2 + "</tr><tr>" + td3 + "</tr>")

function addWork(time) {

}
</script>
<span id="followingDoctorId" style="display: none"><%=request.getParameter("doctorId") %></span>
<table id="addWorkTable" class="table table-bordered">
</table>
<a href="javascript:$('#changeContent').load('doctor/work.jsp?doctorId='+$('#queryDoctorId').text())">返回医生首页</a>

<div class="modal fade" id="addWorkModal" tabindex="-1" role="dialog" aria-labelledby="addWorkModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 style="text-align: center;color: red" class="modal-title" id="addWorkLabel">添加值班</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="sure" class="btn btn-danger">确定</button>
            </div>
        </div>
    </div>
</div>