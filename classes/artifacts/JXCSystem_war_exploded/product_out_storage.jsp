<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.friday.model.Product" %>
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
    <script type="text/javascript">
        function docheck() {
            alert("产品已出库!");
        }
    </script>
    <script src="JS/jquery.jclock-1.2.0.js.txt" type="text/javascript"></script>
    <script type="text/javascript" src="JS/jconfirmaction.jquery.js"></script>
    <script type="text/javascript" src="JS/commonutils.js"></script>
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

    <%--添加出货商品--%>
    <script type="text/javascript">

        window.onload = initDatas;

        var selectedAddRowIndex = -1;
        var selectedValues = [];
        var addedProductId = [];

        function initDatas() {
            // document.getElementById("testfield1").value = getNowDate();
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

            // 初始化全国的库存
            var selectShop = document.getElementById("select_shop");
            var selectedIndex = selectShop.selectedIndex;
            var shopId = selectShop.options[selectedIndex].value;
            changeShopId(shopId)
        }

        function addProductRow(productsIndex, currentIndex) {
            if (!selectedValues || selectedValues.length < 4) {
                console.log("选中商品为空")
                alert("请选择正确得商品");
                return
            }
            console.log(productsIndex)
            console.log("currentIndex = " + selectedAddRowIndex);

            var trObj = document.createElement("tr");
            var tr_id = "tr_" + selectedAddRowIndex;

            trObj.id = tr_id;
            var name = selectedValues[0].trim();
            var num = selectedValues[1].trim();
            var price = selectedValues[2].trim();
            var pid = selectedValues[3].trim();

            if (addedProductId.indexOf(pid) > -1) {
                alert("已经包含商品 " + name);
                return
            } else {
                addedProductId.push(pid)
                console.log("添加商品id " + pid);
            }

            var insertTr = ' <td align="center"><input type="text" size="10" value=\'' + name + '\' readonly/></td>\n' +
                '                <td align="center"><input type="text" size="10" value=\'' + num + '\' readonly/></td>\n' +
                '                <td align="center"><input type="text" size="10" value=\'' + price + '\' readonly/></td>\n' +
                '                <td align="center"><input type="text" size="10" name=\'' + pid + '\'\n' +
                '                                          onKeyUp="this.value=this.value.replace(/\\D/g,\'\')"/></td>\n' +
                '                <td><button type="button" onclick="deleteProductRow(\'' + tr_id + '\', ' + pid + '${""})"><img src="images/trash.png"\n' +
                '                                                                                                alt="" title=""\n' +
                '                                                                                                border="0"/></button></td>';

            console.log(insertTr);
            trObj.innerHTML = insertTr;
            var lastProductTr = document.getElementById("tr_" + (selectedAddRowIndex - 1))
            if (!lastProductTr) {
                lastProductTr = document.getElementById("tr_title_row");
            }

            lastProductTr.after(trObj)

            selectedAddRowIndex++;
        }

        function selectedAddRow(selectedValue) {
            console.log("选中 " + selectedValue);
            selectedValues = selectedValue.split(' ');
        }

        function deleteProductRow(rowId, pid) {
            var deleteTr = document.getElementById(rowId);
            var deleteIndex = addedProductId.indexOf(Number(pid));
            addedProductId = addedProductId.splice(deleteIndex, 1);
            deleteTr.parentNode.removeChild(deleteTr);
        }

        // 更改当前选中的地区，将查询结果添加到div中
        function changeShopId(shopId) {
            console.log("shopid " + shopId);
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("GET", "queryproductlist.do?shopid=" + shopId, true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState === 4)
                    result.innerHTML = xmlHttp.responseText;
                else
                    result.innerHTML = "正在查询，请稍等";
            };
            xmlHttp.send();
        }

    </script>

    <script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>

</head>
<body bgcolor="transparent" style='background:transparent'>

<%--<%--%>
<%--int currentIndex1 = 0;--%>
<%--int selectProductIndex = 1;--%>
<%--%>--%>

<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <tr>
        <td colspan="5" align="left"><strong>产品出库</strong></td>
    </tr>
    <tr>
        <%--<td align="left">出库网点</td>--%>
        <td colspan="5" align="left">
            出库网点
            <select id="select_shop" name="shopid" onchange="changeShopId(this.options[this.options.selectedIndex].value)">
                <c:forEach items="${shops }" var="shop">
                    <c:if test="${shop.sId != 0}">
                        <option value="${shop.sId}">${shop.sName }</option>
                    </c:if>
                </c:forEach>
            </select>
        </td>

        <%--<td align="left" colspan="1">--%>
        <%--<select name="add_product_id" onchange="selectedAddRow(this.options[this.options.selectedIndex].value)">--%>
        <%--<option value="" selected>请选择商品</option>--%>
        <%--<c:forEach items="${products}" var="product" varStatus="status">--%>
        <%--<option value="${product.name} ${product.num} ${product.price} ${product.pid}">${product.name}</option>--%>
        <%--</c:forEach>--%>
        <%--</select>--%>

        <%--</td>--%>
        <%--<td colspan="1" align="left">--%>
        <%--<button type="button" onclick="addProductRow(<%=selectProductIndex%>, <%=currentIndex1%>)">添加Product--%>
        <%--</button>--%>
        <%--</td>--%>
    </tr>
    <%--<tr id="tr_title_row">--%>
    <%--<td align="center">产品名称</td>--%>
    <%--<td align="center">产品数量</td>--%>
    <%--<td align="center">产品价格</td>--%>
    <%--<td align="center">出库数量</td>--%>
    <%--<td align="center">操作</td>--%>
    <%--</tr>--%>


    <%--<c:forEach begin="0" end="${products.size()}" items="${products}" var="product" varStatus="status">--%>
    <%--<tr id="tr_<%=currentIndex1%>" class="${product.pid}">--%>
    <%--<td align="center"><input type="text" size="10" value="${product.name }" readonly/></td>--%>
    <%--<td align="center"><input type="text" size="10" value="${product.num }" readonly/></td>--%>
    <%--<td align="center"><input type="text" size="10" value="${product.price }" readonly/></td>--%>
    <%--<td align="center"><input type="text" size="10" name="${product.pid }"--%>
    <%--onKeyUp="this.value=this.value.replace(/\D/g,'')"/></td>--%>
    <%--<td>--%>
    <%--<button type="button" onclick="deleteProductRow('tr_<%=currentIndex1%>', ${product.pid})"><img--%>
    <%--src="images/trash.png"--%>
    <%--alt="" title=""--%>
    <%--border="0"/></button>--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--<%--%>
    <%--currentIndex1++;--%>
    <%--%>--%>
    <%--</c:forEach>--%>
    <%--<tr>--%>
    <%--<td align="right">出库时间</td>--%>
    <%--<td><input name="outtime" id="testfield1" type="text" size="20" onclick="WdatePicker()"/></td>--%>
    <%--<td align="left" colspan="2">＊点击文本框获取时间</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    <%--<td align="right">备注</td>--%>
    <%--<td colspan="3"><input name="remark" type="text" size="20"/></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    <%--<td colspan="5" align="center">--%>
    <%--<input type="submit" value="确认出库"/>--%>
    <%--<input type="reset" value="重新填写"/>--%>
    <%--</td>--%>
    <%--</tr>--%>
</table>

<div id="result"></div>

</body>
</html>