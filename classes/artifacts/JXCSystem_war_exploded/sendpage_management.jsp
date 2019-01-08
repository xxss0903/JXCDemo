<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>IN ADMIN PANEL | Powered by INDEZINER</title>
<link rel="stylesheet" type="text/css" href="style.css" />
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
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
});
</script>
<script src="JS/jquery.jclock-1.2.0.js.txt" type="text/javascript"></script>
<script type="text/javascript" src="JS/jconfirmaction.jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('.ask').jConfirmAction();
	});
	
</script>
<script type="text/javascript">
$(function($) {
    $('.jclock').jclock();
});
</script>

<script language="javascript" type="text/javascript" src="JS/niceforms.js"></script>

</head>
<body bgcolor="transparent" style='background:transparent'>
   <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
   <tr>
		<td colspan="6" align="left"><strong>送货单管理</strong></td>
	</tr>
  <tr>
    <td colspan="6" align="right"><a href="add_send_page.jsp">新增送货单</a></td>
  </tr>
       <%--送货单列表，显示单号，标题，公司，生产商。简略的送货单消息，点击这一栏就进入详细的送货单信息界面--%>
  <tr align="center">
    <td align="center">标题</td>
    <td align="center">编号</td>
    <td align="center">类别</td>
    <td align="center">公司</td>
    <td align="center">生产商</td>
    <td align="center">日期</td>
  </tr>
 <c:forEach items="${result}" var="sendpage">
  <tr>
    <td align="center">${sendpage.sTitle}</td>
    <td align="center">${sendpage.sNumber}</td>
    <td align="center">${sendpage.sContent.cCategory}</td>
    <td align="center">${sendpage.sCompanyId}</td>
    <td align="center">${sendpage.sProducerId}</td>
    <td align="center">${sendpage.sDate.toLocaleString()}</td>
    <%--<td align="center"><a href="modifycustomerload.do?cid=${customer.cId }" ><img src="images/user_edit.png" title="" border="0" /></a></td>--%>
    <%--<td align="center"><a href="deletecustomer.do?cid=${customer.cId }" class="ask"><img src="images/trash.png" title="" border="0" /></a></td>--%>
  </tr>
 </c:forEach>
</table>
</body>
</html>