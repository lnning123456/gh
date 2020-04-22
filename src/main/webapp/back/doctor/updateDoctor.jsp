<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<script>
    function getQueryString(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    var id = $("#id").text();

    console.log(id);
/*$(function () {

    $.ajax({
        url: "{pageContext.request.contextPath}/doctor/gotoUpdateDoctor",
        datatype: "json",
        type: "post",
        data: {id:id},
        success: function (data) {
            console.log(data);

        }
    });
})*/

</script>


<span id="id" style="display: none"><%=
request.getParameter("id")
%></span>