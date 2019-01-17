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
        })
    </script>
    <script type="text/javascript" src="JS/formcheck.js"></script>
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
    <script>

        window.onload = initData;
        var typeMap = new Map();
        var typeList = [];
        var orderCount = 0;
        var addedProductId = [];

        function initData() {
            var typeNodes = document.getElementById("product_datas").childNodes;
            var typeDivs = [];
            for (var l = 0; l < typeNodes.length; l++) {
                var typeNode = typeNodes[l];
                if (typeNode.nodeName == "DIV") {
                    typeDivs.push(typeNode);
                }
            }

            for (var i = 0; i < typeDivs.length; i++) {
                var typeDiv = typeDivs[i];
                var typeId = typeDiv.id;
                var productNodes = typeDiv.childNodes;
                var productList = [];
                for (var j = 0; j < productNodes.length; j++) {
                    var productDiv = productNodes[j];
                    if (productDiv.nodeName == "DIV") {
                        var fieldNodes = productDiv.childNodes;

                        var pname = fieldNodes[1].innerHTML;
                        var pstyle = fieldNodes[3].innerHTML;
                        var pprice = fieldNodes[5].innerHTML;
                        var pid = fieldNodes[7].innerHTML;

                        var productObj = {};
                        productObj.name = pname;
                        productObj.style = pstyle;
                        productObj.price = pprice;
                        productObj.id = pid;
                        productObj.tid = typeId;

                        productList.push(productObj);
                    }
                }
                typeMap.set(typeId, productList);
                typeList.push(typeId)
            }
        }

        function changeProductByTypeId(selectIndex) {
            var productSelect = document.getElementById("select_product_id");
            productSelect.options.length = 0;

            if (selectIndex === 0) {
                var firstOption = document.createElement("option");
                firstOption.innerHTML = "请选择商品";
                productSelect.appendChild(firstOption);
                return;
            }

            var typeId = typeList[selectIndex - 1];
            var products = typeMap.get(typeId);

            for (var j = 0; j < products.length; j++) {
                var newOption = document.createElement("option");
                newOption.id = products[j].id;
                newOption.innerHTML = products[j].name;
                productSelect.appendChild(newOption);
            }

        }

        // 添加订购商品行
        function addOrderProductRow() {
            // 获取到要添加得商品数据
            var typeIndex = document.getElementById("select_type_id").selectedIndex;
            var productIndex = document.getElementById("select_product_id").selectedIndex;
            if (typeIndex === 0) {
                return
            } else {
                typeIndex = typeIndex - 1;
            }

            var typeId = typeList[typeIndex];
            var type = typeMap.get(typeId)
            // add product to order product row
            var product = type[productIndex];

            var name = product.name;
            var price = product.price;
            var style = product.style;
            var pid = product.id;
            var tid = product.tid;

            console.log(addedProductId);
            if (addedProductId.indexOf(pid) >= 0) {
                alert("已经添加商品");
                return;
            } else {
                addedProductId.push(pid);
            }


            var newCount = orderCount + 1;
            var trObj = document.createElement("tr");
            var new_tr_id = "tr_order_product_" + newCount;
            var old_tr_id = "tr_order_product_" + orderCount;
            trObj.id = new_tr_id;

            var innerHtmlString = ' <td align="center"><input type="text" size="10" value=\'' + name + '\' readonly/></td>\n' +
                '                <td align="center"><input type="text" size="10" value=\'' + style + '\' readonly/></td>\n' +
                '                <td align="center"><input type="text" size="10" value=\'' + price + '\' readonly/></td>\n' +
                '                <td align="center"><input type="text" value="1" size="10" name=\'' + pid + '\'\n' +
                '                                          onKeyUp="this.value=this.value.replace(/\\D/g,\'\')"/></td>\n' +
                '                <td><button type="button" onclick="deleteOrderProductRow(\'' + new_tr_id + '\', ' + pid + '${""})"><img src="images/trash.png"\n' +
                '                                                                                                alt="" title=""\n' +
                '                                                                                                border="0"/></button></td>';

            trObj.innerHTML = innerHtmlString;
            var oldTr = document.getElementById(old_tr_id);
            oldTr.after(trObj);
            orderCount = newCount;
        }

        function deleteOrderProductRow(tr_id, pid) {
            var pidIndex = addedProductId.indexOf(pid);
            if (pidIndex > 0) {
                addedProductId = addedProductId.splice(pidIndex, 1);
            }
            var deleteRow = document.getElementById(tr_id);
            deleteRow.parentNode.removeChild(deleteRow);
        }

    </script>

    <script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>

</head>
<body bgcolor="transparent" style='background:transparent'>
<div align="center" style="color:  red">
    ${success}
</div>
<div style="display: none;" id="product_datas">
    <c:forEach items="${products }" var="productType">
        <div id="${productType.key.split("_")[0]}">
            <c:forEach items="${productType.value }" var="product">
                <div id="${product.pId}">
                    <div id="product_name">${product.pName}</div>
                    <div id="product_style">${product.pStyle}</div>
                    <div id="product_price">${product.pPrice}</div>
                    <div id="product_id">${product.pId}</div>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>
<form name="myform" action="orderproduct.do" method="post">
    <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
        <tr>
            <td colspan="5" align="left"><strong>采购产品</strong></td>
        </tr>
        <tr>
            <td>
                <select id="select_type_id" onchange="changeProductByTypeId(this.options.selectedIndex)">
                    <option value="" selected>请选择类别</option>
                    <c:forEach items="${products}" var="productType">
                        <option value="${productType.key.split("_")[0]}">${productType.key.split("_")[1]}</option>
                    </c:forEach>
                </select>
            </td>
            <td>
                <select id="select_product_id">
                    <option value="" selected>请选择商品</option>
                </select>
            </td>
            <td colspan="3">
                <button type="button" onclick="addOrderProductRow()">添加商品</button>
            </td>

        </tr>
        <tr>
            <td width="26" align="ceter"  >名称</td>
            <td width="61" align="center" >规格</td>
            <td width="61" align="center" >单价</td>
            <td width="61" align="center" >订购数量</td>
            <td width="61" align="center" >删除</td>
        </tr>

        <tr id="tr_order_product_0">

        </tr>

        <%--<c:forEach items="${products }" var="productType">--%>
        <%--<tr>--%>
        <%--<td colspan="4" align="center"><strong></strong>${productType.key }</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
        <%--<td width="26" align="ceter">名称</td>--%>
        <%--<td width="61" align="center">规格</td>--%>
        <%--<td width="61" align="center">单价</td>--%>
        <%--<td width="104" align="center">订购数量</td>--%>
        <%--</tr>--%>
        <%--<c:forEach items="${productType.value }" var="product">--%>
        <%--<tr>--%>
        <%--<td width="102" align="center"><input type="text" size="10" value="${product.pName }" readonly/>--%>
        <%--</td>--%>
        <%--<td width="104" align="center"><input type="text" size="6" value="${product.pStyle }" readonly/>--%>
        <%--</td>--%>
        <%--<td width="104" align="center"><input type="text" size="6" value="${product.pPrice }" readonly/>--%>
        <%--</td>--%>
        <%--<td width="106" align="center"><input name="${product.pId }" type="text" size="9"--%>
        <%--onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>--%>
        <%--</tr>--%>
        <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <tr>
            <td align="right"><strong>订购时间</strong></td>
            <td colspan="4"><input name="orderTime" type="text" id="textfield21" size="27" onclick="WdatePicker()"/>
                &nbsp;&nbsp;＊点击文本框获取时间
            </td>
        </tr>
        <tr>
            <td align="right"><strong>备注</strong></td>
            <td colspan="4"><textarea name="remark" style="height: 100px;" cols="60" id="textfield23"></textarea></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <input type="submit" id="button"  onsubmit="return orderCheck()"value="确认提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" id="button2" value="重新填写"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>