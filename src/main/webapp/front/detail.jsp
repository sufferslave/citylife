<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.citylife.entity.LifeInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息详情</title>
</head>
<body>

<div class="header">
    <h1>都市生活信息网</h1>
    <div>
        <a href="${pageContext.request.contextPath}/index">首页</a>
        |
        <a href="${pageContext.request.contextPath}/category">分类信息</a>
        |
        <a href="${pageContext.request.contextPath}/publish">发布信息</a>
        |
        <a href="${pageContext.request.contextPath}/admin/index">后台管理</a>
    </div>
    <hr>
</div>

<%
    LifeInfo info = (LifeInfo) request.getAttribute("info");
    if (info == null) {
%>
<h2>信息不存在</h2>
<p><a href="${pageContext.request.contextPath}/index">返回首页</a></p>
<%
} else {
%>
<h2><%= info.getInfoTitle() %></h2>
<p>分类编号：<%= info.getInfoType() %></p>
<p>联系人：<%= info.getInfoLinkman() %></p>
<p>联系电话：<%= info.getInfoPhone() %></p>
<p>邮箱：<%= info.getInfoEmail() %></p>
<p>发布时间：<%= info.getInfoDate() %></p>
<p>信息内容：</p>
<div style="border:1px solid #ccc; padding:10px;">
    <%= info.getInfoContent() %>
</div>

<p>
    <a href="${pageContext.request.contextPath}/index">返回首页</a>
</p>
<%
    }
%>

</body>
</html>