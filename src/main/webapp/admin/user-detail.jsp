<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.citylife.entity.User" %>

<%
  User user = (User)request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">

  <title>用户详情</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/static/css/style.css">

</head>

<body>

<div class="header">

  <h1>都市生活网站后台管理系统</h1>

</div>

<div class="admin-container">

  <jsp:include page="left.jsp"/>

  <div class="admin-right">

    <div class="admin-card">

      <h2>用户详情</h2>

      <table class="detail-table">

        <tr>

          <th>ID</th>

          <td><%=user.getId()%></td>

        </tr>

        <tr>

          <th>用户名</th>

          <td><%=user.getUsername()%></td>

        </tr>

        <tr>

          <th>用户类型</th>

          <td><%=user.isAdmin() ? "管理员" : "普通用户"%></td>

        </tr>

        <tr>

          <th>状态</th>

          <td><%=user.getStatus()==0 ? "正常" : "禁用"%></td>

        </tr>

        <tr>

          <th>城市ID</th>

          <td><%=user.getCityId()==null ? "-" : user.getCityId()%></td>

        </tr>

      </table>

      <div class="button-group">

        <a class="back-btn"
           href="${pageContext.request.contextPath}/admin/user-list">

          返回用户管理

        </a>

      </div>

    </div>

  </div>

</div>

</body>
</html>