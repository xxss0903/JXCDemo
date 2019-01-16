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

        function initData() {
            var typeNodes = document.getElementById("product_datas").childNodes;

            for (var i = 0; i < typeNodes.length; i++) {
                var typeDiv = typeNodes[i];
                var typeId = typeDiv.id;
                console.log(typeId);
                var productNodes = typeDiv.childNodes;
                var productList = [];
                for (var j = 0; j < productNodes.length; j++) {
                    var productDiv = productNodes[j];
                    var fieldNodes = productDiv.childNodes;

                    console.log(productDiv);
                    console.log(fieldNodes);

                    var pname = fieldNodes[0].innerHTML;
                    var pstyle = fieldNodes[1].innerHTML;
                    var pprice =fieldNodes[2].innerHTML;
                    var pid = fieldNodes[3].innerHTML;

                    var productObj = {};
                    productObj.name = pname;
                    productObj.style = pstyle;
                    productObj.price = pprice;
                    productObj.id = pid;

                    productList.push(productObj);
                    console.log(productObj);
                    // var pname = productDiv.getElementById("product_name").innerText;
                    // var pstyle = productDiv.getElementById("product_style").innerText;
                    // var pprice = productDiv.getElementById("product_price").innerText;
                    // var pid = productDiv.getElementById("product_id").innerText;

                }
                typeMap.set(typeId, productList);
            }
        }


        function changeProductByTypeId(typeId) {
            var area = document.getElementById("area");
            var countrys = document.getElementById("country");
            var index = area.value;
            var selects = data[index - 1];			//通过选中下拉的选单value值获取数据

            var oldOptions = countrys.children;		//用children，数组内不会有多余属性(换行符)
            var length = oldOptions.length;			//！！注意，提前记录length原因：
            //如果在遍历删除过程中记录length，则length值会改变，删除会出错。
            for (var i = 0; i < length; i++) {				//删除原先选项的过程，若不删除，选项会一直堆积。
                countrys.removeChild(oldOptions[0]);//一直第一个元素，因为清除第一个以后，后面的元素会前移。如果按正常的i遍历，会出错！
            }

            if (index == 0) return;					//如果选中的是"请选择"，就不再添加数据，避免报错（因为脚标是-1）

            for (var i = 0; i < selects.length; i++) {		//增加选项过程
                var option = document.createElement("option");
                option.innerHTML = selects[i];
                country.appendChild(option);
            }
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
        <div id="${productType.key}">
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
<form action="orderproduct.do" method="post">
    <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
        <tr>
            <td colspan="4" align="left"><strong>订购产品</strong></td>
        </tr>
        <tr>
            <c:forEach items="${products }" var="productType">
        <tr>
            <td colspan="4" align="center"><strong></strong>${productType.key }</td>
        </tr>
        <tr>
            <td width="26" align="ceter">名称</td>
            <td width="61" align="center">规格</td>
            <td width="61" align="center">单价</td>
            <td width="104" align="center">订购数量</td>
        </tr>
        <c:forEach items="${productType.value }" var="product">
            <tr>
                <td width="102" align="center"><input type="text" size="10" value="${product.pName }" readonly/>
                </td>
                <td width="104" align="center"><input type="text" size="6" value="${product.pStyle }" readonly/>
                </td>
                <td width="104" align="center"><input type="text" size="6" value="${product.pPrice }" readonly/>
                </td>
                <td width="106" align="center"><input name="${product.pId }" type="text" size="9"
                                                      onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
            </tr>
        </c:forEach>
        </c:forEach>
        </tr>
        <tr>
            <td>
                类别
                <select name="select_category_id">
                    <option value="" selected>请选择类别</option>
                    <c:forEach items="${products}" var="productType">
                        <option value="${productType.key}"></option>
                    </c:forEach>
                </select>
            </td>
            <td>
                商品
                <select name="select_product_id">
                    <option value="" selected>请选择商品</option>
                    <c:forEach items="${products}" var="productType">
                        <option value="${productType.value}"></option>
                    </c:forEach>
                </select>
            </td>
            <td>
                <button type="button">添加商品</button>
            </td>

        </tr>
        <c:forEach items="${products }" var="productType">
            <tr>
                <td colspan="4" align="center"><strong></strong>${productType.key }</td>
            </tr>
            <tr>
                <td width="26" align="ceter">名称</td>
                <td width="61" align="center">规格</td>
                <td width="61" align="center">单价</td>
                <td width="104" align="center">订购数量</td>
            </tr>
            <c:forEach items="${productType.value }" var="product">
                <tr>
                    <td width="102" align="center"><input type="text" size="10" value="${product.pName }" readonly/>
                    </td>
                    <td width="104" align="center"><input type="text" size="6" value="${product.pStyle }" readonly/>
                    </td>
                    <td width="104" align="center"><input type="text" size="6" value="${product.pPrice }" readonly/>
                    </td>
                    <td width="106" align="center"><input name="${product.pId }" type="text" size="9"
                                                          onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
                </tr>
            </c:forEach>
        </c:forEach>
        <tr>
            <td align="right"><strong>订购时间</strong></td>
            <td colspan="4"><input name="orderTime" type="text" id="textfield21" size="27" onclick="WdatePicker()"/>
                &nbsp;&nbsp;＊点击文本框获取时间
            </td>
        </tr>
        <tr>
            <td align="right"><strong>备注</strong></td>
            <td colspan="3"><textarea name="remark" cols="60" id="textfield23"></textarea></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <input type="submit" id="button" value="确认提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" id="button2" value="重新填写"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>