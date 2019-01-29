<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.friday.service.impl.SendpageServiceImpl" %>
<%@ page import="com.friday.model.sendpage.SendpageCompany" %>
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

    <script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>
    <script language="javascript" type="text/javascript" src="JS/commonutils.js"></script>

    <script type="text/javascript">

        window.onload = initDatas;

        var selectedAddRowIndex = -1;
        var addedProductId = [];

        function initDatas() {
            console.log("初始化时间")
            document.getElementById("testfield1").value = getNowDate();
            var table = document.getElementById("rounded-corner");
            var rows = table.rows;
            var trCount = 0;
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].id.indexOf("tr_") === 0) {
                    var pid = rows[i].className;

                    addedProductId.push(Number(pid));
                    trCount++;
                    console.log("是商品行 " + pid);
                } else {
                    console.log("不是商品行");
                }
            }
            selectedAddRowIndex = trCount;
        }

        // function addProduct() {
        //     // 获取选中商品
        //     var productSelect = document.getElementById("select_product_list");
        //     var selectedIndex = productSelect.selectedIndex;
        //     var productId = productSelect.options[selectedIndex].value;
        //     console.log("select productId = " + productId);
        //
        // }
        //
        // function deleteProductRow(rowId, pid) {
        //     console.log("delete tr " + rowId)
        //     var deleteTr = document.getElementById(rowId);
        //     deleteTr.parentNode.removeChild(deleteTr);
        // }

    </script>

</head>
<body bgcolor="transparent" style='background:transparent'>

<%
    int currentIndex1 = 0;
    System.out.println("jsp 刷新页面");

    // 获取送货公司
    SendpageServiceImpl sendpageService = new SendpageServiceImpl();
    // 送货公司列表
    List<SendpageCompany> sendpageCompany1 = sendpageService.getAllCompany();

%>

<form action="stockout.do" method="post">
    <input type="text" name="shopid" value="${shopid}" style="display: none;"/>
    <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
        <tr>
            <td colspan="1">
                选择商品
                <select name="select_product_list" id="select_product_list">
                    <c:forEach items="${result}" var="product">
                        <option value="${product}">${product.name}</option>
                    </c:forEach>
                </select>
            </td>
            <td colspan="4" align="left"><button type="button" onclick="addProduct()">添加出库商品</button></td>
        </tr>

        <tr id="tr_product_0"></tr>


        <c:choose>
            <c:when test="${result.size() > 0}">
                <tr id="tr_title_row">
                    <td align="center">产品名称</td>
                    <td align="center">产品数量</td>
                    <td align="center">产品价格</td>
                    <td align="center">出库数量</td>
                    <td align="center">操作</td>
                </tr>
                <c:forEach begin="0" end="${result.size()}" items="${result}" var="product" varStatus="status">
                    <tr id="tr_<%=currentIndex1%>" class="${product.pid}">
                        <td align="center"><input type="text" size="10" value="${product.name }" readonly/></td>
                        <td align="center"><input type="text" size="10" value="${product.num }" readonly/></td>
                        <td align="center"><input type="text" size="10" value="${product.price }" readonly/></td>
                        <td align="center"><input type="number"
                                                  oninput="if(value > ${product.num}){ value = ${product.num}}if (value<0){value=1} "
                                                  size="10"
                                                  name="${product.pid }" value="1"
                                                  onKeyUp="this.value=this.value.replace(/\D/g,'')"/></td>
                        <td>
                            <button type="button" onclick="deleteProductRow('tr_<%=currentIndex1%>', ${product.pid})">
                                <img
                                        src="images/trash.png"
                                        alt="" title=""
                                        border="0"/></button>
                        </td>
                    </tr>
                    <%
                        currentIndex1++;
                    %>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr style="height: 100px">
                    <td colspan="5"><strong>此地区没有库存，请选择其他地区</strong></td>
                </tr>
            </c:otherwise>
        </c:choose>

        <tr>
            <td align="right" colspan="2">出库时间</td>
            <td><input name="outtime" id="testfield1" type="text" size="20" onclick="WdatePicker()" autocomplete="off"/>
            </td>
            <td align="left" colspan="2">＊点击文本框获取时间</td>
        </tr>
        <tr>
            <td align="right" colspan="2">备注</td>
            <td colspan="3"><input name="remark" type="text" size="20"/></td>
        </tr>
        <tr>
            <td align="right" colspan="2">送货公司</td>

            <td colspan="3">
                <select name="select_company" id="select_company">
                    <c:forEach items="<%=sendpageCompany1%>" var="company">
                        <option value="${company.tId}">${company.tCompany}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <input type="submit" value="确认出库"/>
                <input type="reset" value="重新填写"/>
                <input type="checkbox" checked/>生成送货单
            </td>
        </tr>
    </table>
</form>
</body>
</html>