<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<style type="text/css">
    label.error {
        color: red;
        margin-left: 20px;
    }

    td {
        text-align: center;
        vertical-align: middle;
    }
</style>
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

//查找值班
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
//初始化界面
    var now = new Date();
    var nowFullYear = now.getFullYear();
    var nowMonth = now.getMonth();
    var nowDate = now.getDate();
    var amDate = new Date(nowFullYear, nowMonth, nowDate, 8);
    var pmDate = new Date(nowFullYear, nowMonth, nowDate, 14);
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
                addTd2 = "<td>已有值班</td>";

            }
            if (Format(pmDate, "yyyy/MM/dd a") === Format(time, "yyyy/MM/dd a")) {
                addTd3 = "<td>已有值班</td>";
            }
        }
        if (addTd2 != null) {
            td2 = td2 + addTd2;
        } else {
            td2 = td2 + "<td><a onclick='addWork(this,\"" + Format(amDate, "yyyy/MM/dd  HH") + "\")'>添加</a></td>";

        }
        if (addTd3 != null) {
            td3 = td3 + addTd3;
        } else {
            td3 = td3 + "<td><a onclick='addWork(this,\"" + Format(pmDate, "yyyy/MM/dd  HH") + "\")'>添加</a></td>";

        }
        addTd2 = null;
        addTd3 = null;
        amDate = new Date(nowFullYear, nowMonth, nowDate + i, 8);
        pmDate = new Date(nowFullYear, nowMonth, nowDate + i, 14);
    }
    $("#addWorkTable").append("<tr>" + td1 + "</tr><tr>" + td2 + "</tr><tr>" + td3 + "</tr>")


    function addWork(t,time) {
        $(t).parent().addClass("addWork");
        time = getDate(time);
        var showTime = new Date(time.getFullYear(), time.getMonth() - 1, time.getDate(), time.getHours());
        $("#showTime").val(Format(showTime, "yyyy/MM/dd a"));
        $("#time").val(Format(showTime, "yyyy/MM/dd HH"));
        $('#addWorkModal').modal('show');
    }

    function sureAddWork() {

        $("#addWorkForm").validate({
            rules: {
                remain: {required: true, digits: true},
                price: {required: true, number: true}
            },
            //提示信息
            messages: {
                remain: {required: "请输入放号数量！", digits: "请输入合法放号数量！"},
                price: {required: "请输入挂号价格！", number: "请输入合法价格！"}
            }
        });
        var time = getDate($("#time").val());
        time = new Date(time.getFullYear(), time.getMonth() - 1, time.getDate(), time.getHours());
        $("#doctorId").val(followingDoctorId);
        var flag = $("#addWorkForm").valid();
        var formData = new FormData($("#addWorkForm")[0]);
        formData.set("time", time);
        if (flag) {
            $.ajax({
                url: "${pageContext.request.contextPath}/work/addWork",
                datatype: "json",
                type: "post",
                processData: false,
                contentType: false,
                data: formData,
                success: function (data) {
                    alert(data);
                    document.getElementById("addWorkForm").reset();
                    $(".addWork").text("已有值班");
                    $('#addWorkModal').modal('hide');
                    //
                }
            });
        }
    }
$(function () {
    $('#addWorkModal').on('hide.bs.modal', function () {
        $(".addWork").removeClass("addWork")
    });
})
</script>
<span id="followingDoctorId" style="display: none"><%=request.getParameter("doctorId") %></span>
<table id="addWorkTable" class="table table-bordered">
</table>
<div style="text-align: center">
    <a href="javascript:$('#changeContent').load('doctor/work.jsp?doctorId='+$('#queryDoctorId').text())">返回医生值班</a>
</div>

<div class="modal fade" id="addWorkModal" tabindex="-1" role="dialog" aria-labelledby="addWorkModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 style="text-align: center" class="modal-title" id="addWorkLabel">添加值班</h4>
            </div>
            <div class="modal-body">

                <form id="addWorkForm" class="form-horizontal">
                    <input style="display: none" type="text" id="doctorId" name="doctorId">
                    <div class="form-group">
                        <label for="time" class="col-sm-3 control-label">值班时间：</label>
                        <div class="col-sm-9 form-inline">
                            <input type="text" style="width: 150px" class="form-control" id="showTime" name="showTime"
                                   readonly>
                            <input type="text" style="width: 150px;display: none " class="form-control" id="time"
                                   name="time">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="remain" class="col-sm-3 control-label">放号数量：</label>
                        <div class="col-sm-9 form-inline">
                            <input type="text" style="width: 150px" class="form-control" id="remain" name="remain"
                                   placeholder="放号数">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-sm-3 control-label">挂号价格：</label>
                        <div class="col-sm-9 form-inline">
                            <input type="text" style="width: 150px" class="form-control" id="price" name="price"
                                   placeholder="价格">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="sure" onclick="sureAddWork()" class="btn btn-info">确定</button>
            </div>
        </div>
    </div>
</div>