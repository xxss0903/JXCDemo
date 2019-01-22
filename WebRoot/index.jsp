<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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

</head>
<body>
<div id="main_container">

    <div class="header">
        <%--<div class="logo"><a href="#"><img src="images/logo.gif" alt="" title="" border="0"/></a></div>--%>
        <div class="logo"><a href="#" style="size: 20px;">世清缘分标签管理系统</a></div>

        <div class="right_header">Welcome <%=session.getAttribute("name") %> | <a href="logout.do"
                                                                                  class="logout">Logout</a></div>
        <div class="jclock"></div>
    </div>

    <div class="main_content">

        <div class="menu">
            <ul>
                <%--<li><a onclick="clickA(this);" alt="order_record_query.jsp">订单记录查询</a></li>--%>
                <%--<li><a onclick="clickA(this);" alt="product_storage.jsp">产品入库</a></li>--%>
                <%--<li><a onclick="clickA(this);" alt="stockload.do">库存查询</a></li>--%>
                <%--<li><a onclick="clickA(this);" alt="sellload.do">产品销售</a></li>--%>
                <%--<li><a onclick="clickA(this);" alt="stockwarn.do">库存报警</a></li>--%>

                <li><a onclick="clickA(this);" alt="sendpage_history.do">送货单管理</a></li>
                <li><a onclick="clickA(this);" alt="sendpage_company.do">客户管理</a></li>
                <li><a onclick="clickA(this);" alt="modify_password.jsp">修改密码</a></li>
            </ul>
        </div>

        <div class="center_content">

            <div class="left_content">
                <div class="sidebarmenu">

                    <a class="menuitem submenuheader" href="">采购与入库管理</a>
                    <div class="submenu">
                        <ul>
                            <li><a onclick="clickA(this);" alt="getproduct.do">采购产品并入库</a></li>
                            <li><a onclick="clickA(this);" alt="order_record_query.jsp">采购记录查询</a></li>
                            <li><a onclick="clickA(this);" alt="product_return.jsp">采购退回</a></li>
                            <li><a onclick="clickA(this);" alt="Returns_records_query.jsp">退货记录查询</a></li>
                            <%--<li><a onclick="clickA(this);" alt="product_storage.jsp">产品入库</a></li>--%>
                            <%--<li><a onclick="clickA(this);" alt="storage_record_query.jsp">入库记录查询</a></li>--%>
                        </ul>
                    </div>
                    <a class="menuitem submenuheader" href="">库存管理</a>
                    <div class="submenu">
                        <ul>
                            <li><a onclick="clickA(this);" alt="stockload.do">库存查询</a></li>
                            <%--<li><a onclick="clickA(this);" alt="stockwarn.do">库存报警</a></li>--%>
                            <li><a onclick="clickA(this);" alt="shopmanagement.do">网点管理</a></li>
                        </ul>
                    </div>

                    <a class="menuitem submenuheader" href="">出库管理</a>
                    <div class="submenu">
                        <ul>
                            <li><a onclick="clickA(this);" alt="getoutproduct.do">产品出库</a></li>
                            <li><a onclick="clickA(this);" alt="stockoutqueryload.do">出库记录查询</a></li>
                            <li><a onclick="clickA(this);" alt="sellload.do">出库退回</a></li>
                            <li><a onclick="clickA(this);" alt="sellqueryload.do">出库退回记录</a></li>
                        </ul>
                    </div>

                    <a class="menuitem submenuheader" href="">送货单管理</a>
                    <div class="submenu">
                        <ul>
                            <li><a onclick="clickA(this)" alt="sendpage_history.do">查看送货单</a></li>
                            <li><a onclick="clickA(this)" alt="sendpage_add.do">添加送货单</a></li>
                            <li><a onclick="clickA(this)" alt="sendpage_edit.do">编辑送货单</a></li>
                            <li><a onclick="clickA(this)" alt="sendpage_print.do">打印送货单</a></li>
                        </ul>
                    </div>
                    <a class="menuitem submenuheader" href="">送货信息管理</a>
                    <div class="submenu">
                        <ul>
                            <li><a onclick="clickA(this)" alt="sendpage_express.do">快递管理</a></li>
                            <li><a onclick="clickA(this)" alt="sendpage_producer.do">生产商管理</a></li>
                            <li><a onclick="clickA(this)" alt="sendpage_company.do">送货公司管理</a></li>
                            <li><a onclick="clickA(this)" alt="sendpage_kaipiao.do">开票管理</a></li>
                        </ul>
                    </div>
                    <a class="menuitem submenuheader" href="">采购产品管理</a>
                    <div class="submenu">
                        <ul>
                            <%--<li><a onclick="clickA(this)" alt="sendpage_category.do">分类管理</a></li>--%>
                            <%--<li><a onclick="clickA(this)" alt="querycategoryitem.do?cid=1">商品管理</a></li>--%>
                            <li><a onclick="clickA(this);" alt="queryproducts.do">产品管理</a></li>
                            <li><a onclick="clickA(this);" alt="queryalltype.do">类别管理</a></li>
                        </ul>
                    </div>
                    <%--<a class="menuitem submenuheader" href="">入库管理</a>--%>
                    <%--<div class="submenu">--%>
                    <%--<ul>--%>
                    <%--<li><a onclick="clickA(this);" alt="product_storage.jsp">产品入库</a></li>--%>
                    <%--<li><a onclick="clickA(this);" alt="storage_record_query.jsp">入库记录查询</a></li>--%>
                    <%--<li><a onclick="clickA(this);" alt="product_return.jsp">产品退回</a></li>--%>
                    <%--<li><a onclick="clickA(this);" alt="Returns_records_query.jsp">退货记录查询</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>
                    <%--<a class="menuitem submenuheader" href="">员工信息</a>--%>
                    <%--<div class="submenu">--%>
                    <%--<ul>--%>
                    <%--<li><a onclick="clickA(this);" alt="querystaffs.do">员工管理</a></li>--%>
                    <%--<li><a onclick="clickA(this);" alt="add_staff.jsp">添加员工</a></li>--%>
                    <%--<li><a onclick="clickA(this);" alt="remindbirthday.do">员工生日提醒</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--<a class="menuitem submenuheader" href="">生产商管理</a>--%>
                    <%--<div class="submenu">--%>
                    <%--<ul>--%>
                    <%--<li><a onclick="clickA(this)" alt="sendpage_producer.do">生产商管理</a></li>--%>
                    <%--<li></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--<a class="menuitem submenuheader" href="">快递管理</a>--%>
                    <%--<div class="submenu">--%>
                    <%--<ul>--%>
                    <%--<li><a onclick="clickA(this)" alt="sendpage_express.do">快递管理</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--<a class="menuitem submenuheader" href="">客户管理</a>--%>
                    <%--<div class="submenu">--%>
                    <%--<ul>--%>
                    <%--<li><a onclick="clickA(this)" alt="sendpage_company.do">送货公司管理</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>

                    <%--<a class="menuitem submenuheader" href="">发票管理</a>--%>
                    <%--<div class="submenu">--%>
                    <%--<ul>--%>
                    <%--<li><a onclick="clickA(this)" alt="sendpage_kaipiao.do">开票管理</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <a class="menuitem submenuheader" href="">统计信息</a>
                    <div class="submenu">
                    <ul>
                        <li><a onclick="clickA(this);" alt="customerquery.do">成本核算</a></li>
                        <li><a onclick="clickA(this);" alt="customerquery.do">销售统计</a></li>
                    </ul>
                    </div>
                    <a class="menuitem submenuheader" href="">系统设置</a>
                    <div class="submenu">
                        <ul>
                            <li><a onclick="clickA(this);" alt="add_manager.jsp">添加管理员</a></li>
                            <li><a onclick="clickA(this);" alt="modify_password.jsp">修改密码</a></li>
                            <li><a onclick="clickA(this);" alt="modify_password.jsp">默认地址</a></li>
                        </ul>
                    </div>

                </div>
                <div class="sidebar_box">
                    <div class="sidebar_box_bottom"></div>
                </div>
            </div>

            <div class="right_content">
                <iframe id='mainiFrame' src="getproduct.do" width="100%" height=1000 frameborder="0"
                        scrolling="no"></iframe>
            </div><!-- end of right content-->
        </div>   <!--end of center content -->

        <div class="clear"></div>
    </div> <!--end of main content-->


    <div class="footer">

        <div class="left_footer">世清缘标签管理系统</div>
    </div>

</div>
</body>
<!-- 在mainFrame显示页面 -->
<script>
    function clickA(a) {
        $('#mainiFrame').attr('src', $(a).attr('alt'));
    }
</script>
</html>