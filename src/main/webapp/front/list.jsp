<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.citylife.entity.LifeInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分类信息</title>
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

<h2>分类信息</h2>

<%
    List<LifeInfo> infoList = (List<LifeInfo>) request.getAttribute("infoList");
    if (infoList == null || infoList.size() == 0) {
%>
<p>暂无信息</p>
<%
} else {
    for (LifeInfo info : infoList) {
%>
<div style="border:1px solid #ccc; padding:10px; margin:10px 0;">
    <h3>
        <a href="${pageContext.request.contextPath}/detail?id=<%= info.getId() %>">
            <%= info.getInfoTitle() %>
        </a>
    </h3>
    <p>联系人：<%= info.getInfoLinkman() %></p>
    <p>电话：<%= info.getInfoPhone() %></p>
    <p>日期：<%= info.getInfoDate() %></p>
</div>
<%
        }
    }
%>

<p><a href="${pageContext.request.contextPath}/index">返回首页</a></p>

</body>
</html>