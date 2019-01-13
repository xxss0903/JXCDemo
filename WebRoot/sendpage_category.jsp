<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <title>IN ADMIN PANEL | Powered by INDEZINER</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <script type="text/javascript" src="JS/jquery.min.js"></script>
    <script type="text/javascript" src="JS/ddaccordion.js"></script>
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

    <script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>
    <script language="JavaScript">
        function queryCategoryItem(cId) {
            console.log("查询item " + cId)
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", "querycategoryitem.do?cid=" + cId, true);
            xmlHttp.onreadystatechange = function () {
                console.log("ready state = " + xmlHttp.readyState)
                if (xmlHttp.readyState == 4)
                    result.innerHTML = xmlHttp.responseText;
                else
                    result.innerHTML = "正在查询，请稍等...";
            };
            xmlHttp.send()
        }
    </script>
</head>
<body bgcolor="transparent" style='background:transparent'>
<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <tr>
        <td colspan="6" align="left"><strong>类别管理</strong></td>
    </tr>
    <tr>
        <td colspan="6" align="right"><a href="sendpage_add.jsp">新增类别</a></td>
    </tr>
    <tr align="center">
        <td align="center">ID</td>
        <td align="center">类别</td>
        <td align="center">新增子类</td>
        <td align="center">删除类别</td>
    </tr>
    <c:forEach items="${result}" var="category">
        <tr>
            <td align="center"><a href="javascript:queryCategoryItem('${category.cId}')">${category.cId}</a></td>
            <td align="center">${category.cName}</td>
            <td align="center">${category.cName}</td>
            <td align="center">${category.cName}</td>
        </tr>
    </c:forEach>
</table>
<div id="result"></div>
</body>
</html>