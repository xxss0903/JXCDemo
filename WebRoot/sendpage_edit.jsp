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
    <script type="text/javascript" src="JS/formcheck.js"></script>

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
    <style>
        table, table tr th, table tr td {
            border: 1px solid #0094ff;
        }

        table {
            width: 400px;
            min-height: 25px;
            line-height: 25px;
            text-align: center;
            border-collapse: collapse;
            padding: 0px;
        }
    </style>
</head>
<body bgcolor="transparent" style='background:transparent'>
<h1>编辑送货单</h1>

<%--根据送货单id搜索送货单--%>
<form name="myform" action="sendpage_print.do" onsubmit="return sendpageidcheck()" method="post">
    <input type="text" name="sendpageid" id="sendpageid" size="5"/>
    <input type="submit" value="搜索送货单"/>
</form>

<table class="sendpage_table">
    <!-- 标题 -->
    <tr class="title">
        <th colspan="8">${sendpage.sTitle}</th>
    </tr>
    <!-- 送货内容 -->
    <tr class="content">
    <tr>
        <th class="content_title" width="80">编号</th>
        <th class="content_title" width="80">日期</th>
        <th class="content_title" width="80">类别</th>
        <th class="content_title" width="80">品名</th>
        <th class="content_title" width="80">数量</th>
        <th class="content_title" width="80">单价</th>
        <th class="content_title" width="80">金额</th>
        <th class="content_title" width="80">备注</th>
    </tr>
    <tr class="content_items">
        <td class="content_title">${sendpage.sContent.cNumber}</td>
        <td class="content_title">${sendpage.sDate}</td>
        <td class="content_title">${sendpage.sContent.cCategory}</td>

        <%--子item的表格--%>
        <td colspan="5">
            <table>
                <c:forEach items="${sendpage.sContent.cItemsObj}" var="item">
                    <tr>
                        <td class="content_title" width="80">${item.sendpageItem.iName}</td>
                        <td class="content_title" width="80">${item.iAmount}</td>
                        <td class="content_title" width="80">${item.sendpageItem.iPrice}</td>
                        <td class="content_title" width="80">${item.iPriceTotal}</td>
                        <td class="content_title" width="80">${item.iComment}</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    </tr>
    <!-- 开票信息 -->
    <tr class="kaipiao">
        <td colspan="8" align="center">
            <ul style="list-style: none">
                <li class="kaipiao_content">开票日期:${sendpage.sKp.kDate} 开票金额:${sendpage.sKp.kAmount}</li>
                <li class="kaipiao_content">收款日期:${sendpage.sKp.kSkDate} 收款方式:${sendpage.sKp.kSkTypeName}</li>
            </ul>
        </td>
    </tr>
    <!-- 送货公司信息 -->
    <tr class="company">
        <td colspan="8" align="center">
            <ul style="list-style: none">
                <li class="kaipiao_content">统一社会信用代码:${sendpage.sCompany.tXy}</li>
                <li class="kaipiao_content">开户行:${sendpage.sCompany.tKhBank}</li>
                <li class="kaipiao_content">账号:${sendpage.sCompany.tBaccount}</li>
                <li class="kaipiao_content">地址:${sendpage.sCompany.tBaccount}</li>
                <li class="kaipiao_content">电话:${sendpage.sCompany.tPhone} 传真:${sendpage.sCompany.tFaxPhone}</li>
                <li class="kaipiao_content">邮编:${sendpage.sCompany.tMail}</li>
            </ul>
        </td>
    </tr>
    <!-- 快递信息 -->
    <tr class="express">
        <td colspan="8" align="center">
            <ul style="list-style: none">
                <li class="express_content">快递信息:${sendpage.sExpress.eAddress}</li>
                <li class="express_content">联系人:${sendpage.sExpress.ePerson} ${sendpage.sExpress.ePhone}</li>
            </ul>
        </td>
    </tr>
    <!-- 生产商信息 -->
    <tr class="producer">
        <td colspan="8" align="center">
            <ul style="list-style: none">
                <li class="producer_content">生产制作单位信息</li>
                <li class="producer_content">单位:${sendpage.sProducer.pCompany}</li>
                <li class="producer_content">地址:${sendpage.sProducer.pAddress}</li>
                <li class="producer_content">税号:${sendpage.sProducer.pTaxNumber}</li>
                <li class="producer_content">开户行:${sendpage.sProducer.pKhBank}</li>
                <li class="producer_content">账号:${sendpage.sProducer.pBankCard}</li>
                <li class="producer_content">联系电话:${sendpage.sProducer.pContactPhone}</li>
                <li class="producer_content">业务联系人:${sendpage.sProducer.pContactPerson}</li>
            </ul>
        </td>
    </tr>
</table>
</body>
</html>