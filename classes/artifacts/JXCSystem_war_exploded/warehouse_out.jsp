<%@page import="com.friday.model.Order" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>
    <title>IN ADMIN PANEL | Powered by INDEZINER</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <script type="text/javascript" src="JS/jquery.min.js"></script>
    <script type="text/javascript" src="JS/ddaccordion.js"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        ddaccordion.init({
            headerclass: "submenuheader", //Shared CSS class name of headers group
            contentclass: "submenu", //Shared CSS class name of contents group
            revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
            mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
            collapseprev: true, //Collapse previous content (so only one open at any time)? true/false
            defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
            onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
            animatedefault: false, //Should contents open by default be animated into view?
            persiststate: true, //persist state of opened contents within browser session?
            toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
            togglehtml: ["suffix", "<img src='images/plus.gif' class='statusicon' />", "<img src='images/minus.gif' class='statusicon' />"], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
            animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
            oninit: function (headers, expandedindices) { //custom code to run when headers have initalized
                //do nothing
            },
            onopenclose: function (header, index, state, isuseractivated) { //custom code to run whenever a header is opened or closed
                //do nothing
            }
        });
    </script>
    <script src="JS/jquery.jclock-1.2.0.js.txt" type="text/javascript"></script>
    <script type="text/javascript" src="JS/jconfirmaction.jquery.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('.ask').jConfirmAction();
        });

    </script>
    <script type="text/javascript">
        $(function ($) {
            $('.jclock').jclock();
        });
    </script>
    <script language="JavaScript">

        function queryDetail(did) {
            // 發起一個新的請求獲取詳情
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", "querydetail.do?did=" + did + "&table=out", true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState === 4)
                // 將查詢返回的view添加到這個result裏面
                    result.innerHTML = xmlHttp.responseText;
                else
                    result.innerHTML = "正在查询，请稍等";
            };
            xmlHttp.send();
        }

        // 出库商品退回
        function goodsback(oid) {
            console.log("出库商品退回 " + oid)
            // 發起一個新的請求獲取詳情
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", "stockback.do?outid=" + oid, true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState === 4)
                // 將查詢返回的view添加到這個result裏面
                    result.innerHTML = xmlHttp.responseText;
                else
                    result.innerHTML = "正在查询，请稍等";
            };
            xmlHttp.send();
        }



        window.onload = initDatas;

        var selectedAddRowIndex = -1;
        var addedProductId = [];

        function initDatas() {
            console.log("初始化时间")
            // document.getElementById("testfield1").value = getNowDate();
            // var table = document.getElementById("rounded-corner");
            // var rows = table.rows;
            // var trCount = 0;
            // for (var i = 0; i < rows.length; i++) {
            //     if (rows[i].id.indexOf("tr_") === 0) {
            //         var pid = rows[i].className;
            //
            //         addedProductId.push(Number(pid));
            //         trCount++;
            //         console.log("是商品行 " + pid);
            //     } else {
            //         console.log("不是商品行");
            //     }
            // }
            // selectedAddRowIndex = trCount;
        }


    </script>
    <script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>
    <link rel="stylesheet" type="text/css" media="all" href="CSS/niceforms-default.css"/>

</head>
<body bgcolor="transparent" style='background:transparent'>
<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <thead>
    <tr>
        <td colspan="6" align="left"><strong>出库记录查询</strong></td>
    </tr>
    <tr>
        <td colspan="6" align="left">
            <form action="querystockout.do" method="post">
                <label>开始时间：</label>
                <input name="starttime" type="text" id="textfield" size="5" onclick="WdatePicker()"/>
                <label>结束时间:</label>
                <input name="endtime" type="text" id="textfield2" size="5" onclick="WdatePicker()"/>
                <label>订单编号:</label>
                <input name="orderid" type="text" id="textfield3" size="5"/>
                <label>网点:</label>
                <select name="outshop">
                    <c:forEach items="${shops }" var="shopname">
                        <option value="${shopname.sId }">${shopname.sName }</option>
                    </c:forEach>
                </select>
                <input type="submit" value="查询"/>
            </form>
        </td>
    </tr>
    <tr>
        <td width="50" align="center"><strong>出库编号</strong></td>
        <td width="50" align="center"><strong>出库网点</strong></td>
        <td width="50" align="center"><strong>出库时间</strong></td>
        <td width="50" align="center"><strong>经办人 </strong></td>
        <td width="50" align="center"><strong>合计金额</strong></td>
        <td width="50" align="center"><strong>操作</strong></td>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <td colspan="6" align="left">
            <div class="pagination">
                <form action="querystockout.do" method="post" style="display:none" name="hideform">
                    <input name="starttime" type="text" id="textfield" size="8" onclick="WdatePicker()"
                           value="${starttime }"/>
                    <input name="endtime" type="text" id="textfield2" size="8" onclick="WdatePicker()"
                           value="${endtime }"/>
                    <input name="orderid" type="text" id="textfield3" size="8" value="${orderid }"/>
                    <input name="outshop" value="${outshop }"/>
                    <input type="submit" value="查询"/>
                </form>
                <%
                    int pagecount = request.getAttribute("pagecount") == null ? 1 : (Integer) request.getAttribute("pagecount");
                    int pagecurrent = request.getAttribute("pagecurrent") == null ? 0 : (Integer) request.getAttribute("pagecurrent");

                    if (pagecurrent == 0) out.print("<span class=\"disabled\">prev</span>");
                    else
                        out.print("<a href=\"javascript:hideform.action='queryorder.do?page=" + String.format("%d", pagecurrent - 1) + "';hideform.submit()\">prev</a>");
                    for (int i = 0; i < pagecount; i++) {
                        if (i == pagecurrent)
                            out.print("<span class=\"current\">" + String.format("%d", i + 1) + "</span>");
                        else
                            out.print("<a href=\"javascript:hideform.action='queryorder.do?page=" + String.format("%d", i) + "';hideform.submit()\">" + String.format("%d", i + 1) + "</a>");
                    }
                    if (pagecurrent == pagecount - 1) out.print("<span class=\"disabled\">next</span>");
                    else
                        out.print("<a href=\"javascript:hideform.action='queryorder.do?page=" + String.format("%d", pagecurrent + 1) + "';hideform.submit()\">next</a>");
                %>
            </div>
        </td>
    </tr>
    </tfoot>
    <tbody>
    <%--${参数}获取页面传递过来的参数的数据--%>
    <c:forEach items="${result}" var="order">
        <tr>
            <td align="center"><a href="javascript:queryDetail('${order.oId}')">${order.oId }</a></td>
            <td align="center">${order.shop }</td>
            <td align="center">${order.date }</td>
            <td align="center">${order.user }</td>
            <td align="center">${order.price }</td>
            <c:choose>
                <c:when test="${order.oSt == 2}">
                    <td align="center"><a href="product_sale.jsp?oid=${order.oId}">
                        <button type="button" onclick="deleteProductRow('tr_0', ${order.pid})">退回</button>
                    </a></td>
                </c:when>
                <c:when test="${order.oSt == 1}">
                    <td>已退回</td>

                </c:when>
                <c:otherwise>
                    <td>已出库</td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="result"></div>
</body>
</html>