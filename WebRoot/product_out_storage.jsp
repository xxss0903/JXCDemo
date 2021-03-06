<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.friday.model.Shop" %>
<%@ page import="com.friday.service.impl.StockQueryServiceImpl" %>
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

        var addedProductId = [];

        function initDatas() {
            // 初始化全国的库存
            var selectShop = document.getElementById("select_shop");
            var selectedIndex = selectShop.selectedIndex;
            var shopId = selectShop.options[selectedIndex].value;
            changeShopId(shopId)
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

        var orderCount = 0;

        function addProduct() {
            // 获取选中商品
            var productSelect = document.getElementById("select_product_list");
            var selectedIndex = productSelect.selectedIndex;
            var product = productSelect.options[selectedIndex].value;
            console.log("select product = " + product.replace("=", ":"));
            var productObj = product.parseJSON();
            console.log(productObj);

            var name = product.name;
            var price = product.price;
            var num = product.num;
            var pid = product.pid;

            if (addedProductId.indexOf(pid) >= 0) {
                alert("已经添加商品");
                return;
            } else {
                addedProductId.push(pid);
            }


            var newCount = orderCount + 1;
            var trObj = document.createElement("tr");
            var new_tr_id = "tr_product_" + newCount;
            var new_tr_name = "tr_product_" + newCount;
            var old_tr_id = "tr_product_" + orderCount;
            trObj.id = new_tr_id;


            var innerHtmlString = '<td align="center"><input type="text" size="10" value=\'' + name + '\' readonly/></td>\n' +
                '                        <td align="center"><input type="text" size="10" value=\'' + num + '\' readonly/></td>\n' +
                '                        <td align="center"><input type="text" size="10" value=\'' + price + '\' readonly/></td>\n' +
                '                        <td align="center"><input type="number"\n' +
                '                                                  oninput="if(value > \'' + num + '\'){ value = \'' + num + '\'}if (value<0){value=1} "\n' +
                '                                                  size="10"\n' +
                '                                                  name="\'' + pid + '\'" value="1"\n' +
                '                                                  onKeyUp="this.value=this.value.replace(/\\D/g,\'\')"/></td>\n' +
                '                        <td>\n' +
                '                            <button type="button" onclick="deleteProductRow(\'' + new_tr_id + '\', ' + pid + '${""})">' +
                '                                <img\n' +
                '                                        src="images/trash.png"\n' +
                '                                        alt="" title=""\n' +
                '                                        border="0"/></button>\n' +
                '                        </td>'

            trObj.innerHTML = innerHtmlString;
            var oldTr = document.getElementById(old_tr_id);
            oldTr.after(trObj);
            orderCount = newCount;

        }

        function deleteProductRow(rowId, pid) {
            console.log("delete tr " + rowId)
            var deleteTr = document.getElementById(rowId);
            deleteTr.parentNode.removeChild(deleteTr);
        }
    </script>

    <script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>

</head>
<body bgcolor="transparent" style='background:transparent'>

<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
    <tr>
        <td colspan="5" align="left"><strong>产品出库</strong></td>
    </tr>
    <tr>
        <%--<td align="left">出库网点</td>--%>
        <td colspan="5" align="left">
            出库网点
            <select id="select_shop" name="shopid"
                    onchange="changeShopId(this.options[this.options.selectedIndex].value)">
                <c:forEach items="${shops }" var="shop">
                    <c:if test="${shop.sId != 0}">
                        <option value="${shop.sId}">${shop.sName }</option>
                    </c:if>
                </c:forEach>
            </select>
        </td>

    </tr>
</table>

<div id="result"></div>

</body>
</html>