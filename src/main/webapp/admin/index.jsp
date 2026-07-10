<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.citylife.entity.Admin" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
</head>
<body>

<%
    Admin admin = (Admin) session.getAttribute("admin");
%>

<h1>后台管理</h1>

<% if (admin != null) { %>
<p>当前管理员：<%=admin.getUsername()%></p>
<% } %>

<p>这里是后台首页，当前先做简单跳转。</p>

<ul>
    <li><a href="${pageContext.request.contextPath}/index">返回前台首页</a></li>
    <li><a href="${pageContext.request.contextPath}/publish">发布信息</a></li>
    <li><a href="${pageContext.request.contextPath}/category">查看分类信息</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/logout">退出登录</a></li>
</ul>

</body>
</html>