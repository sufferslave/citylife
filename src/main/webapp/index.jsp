<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.citylife.entity.LifeInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>都市生活信息网</title>
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

<h2>信息搜索</h2>
<form action="${pageContext.request.contextPath}/search" method="get">
    <input type="text" name="keyword" placeholder="请输入关键词">
    <button type="submit">搜索</button>
</form>

<h2>信息分类</h2>
<p>
    <a href="${pageContext.request.contextPath}/category?type=1">招聘信息</a>
    <a href="${pageContext.request.contextPath}/category?type=2">培训信息</a>
    <a href="${pageContext.request.contextPath}/category?type=3">房屋信息</a>
    <a href="${pageContext.request.contextPath}/category?type=4">求购信息</a>
    <a href="${pageContext.request.contextPath}/category?type=5">招商引资</a>
    <a href="${pageContext.request.contextPath}/category?type=6">公寓信息</a>
    <a href="${pageContext.request.contextPath}/category?type=7">求职信息</a>
    <a href="${pageContext.request.contextPath}/category?type=8">家教信息</a>
    <a href="${pageContext.request.contextPath}/category?type=9">车辆信息</a>
    <a href="${pageContext.request.contextPath}/category?type=10">出售信息</a>
    <a href="${pageContext.request.contextPath}/category?type=11">寻找启示</a>
</p>

<h2>最新信息</h2>

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
    <p>联系电话：<%= info.getInfoPhone() %></p>
    <p>发布时间：<%= info.getInfoDate() %></p>
</div>
<%
        }
    }
%>

</body>
</html>