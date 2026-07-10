<%--
  Created by IntelliJ IDEA.
  User: x'x'x
  Date: 2026/7/9
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="admin-left">

  <div class="admin-summary">

    <h3>系统概览</h3>

    <div class="summary-item">
      <span>⏳ 待审核信息</span>
      <p>${pendingCount}</p>
    </div>

    <div class="summary-item">
      <span>👥 注册用户</span>
      <p>${userCount}</p>
    </div>

    <div class="summary-item">
      <span>📄 已发布信息</span>
      <p>${publishCount}</p>
    </div>

  </div>

  <div class="admin-menu">

    <h3>功能菜单</h3>

    <a href="${pageContext.request.contextPath}/admin/audit">
      信息审核
    </a>

    <a href="${pageContext.request.contextPath}/admin/user-list">
      用户管理
    </a>

    <a href="${pageContext.request.contextPath}/admin/info-list">
      信息管理
    </a>

    <a href="${pageContext.request.contextPath}/admin/pay">
      收费设置
    </a>

    <a href="${pageContext.request.contextPath}/index">
      返回首页
    </a>

  </div>

</div>
</body>
</html>
