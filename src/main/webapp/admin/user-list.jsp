<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2026/7/8
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2026/7/8
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.citylife.entity.User"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>用户管理</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/style.css">

</head>

<body>

<div class="header">

    <h1>都市生活网站后台管理系统</h1>

</div>

<div class="admin-container">

    <!-- 左侧菜单 -->
    <jsp:include page="left.jsp"/>

    <!-- 右侧 -->
    <div class="admin-right">

        <div class="admin-card">

            <h2>用户管理</h2>
            <form class="search-bar"
                  action="${pageContext.request.contextPath}/admin/user-list"
                  method="get">

                <input type="text"
                       name="keyword"
                       placeholder="请输入用户名">

                <button type="submit">

                    查询

                </button>

            </form>
            <table class="admin-table">

                <tr>

                    <th>ID</th>

                    <th>用户名</th>

                    <th>用户类型</th>

                    <th>用户状态</th>

                    <th>城市ID</th>

                    <th>操作</th>

                </tr>
                <%
                    List<User> userList =
                            (List<User>)request.getAttribute("userList");

                    if(userList!=null){

                        for(User user:userList){
                %>

                <tr>

                    <td><%=user.getId()%></td>

                    <td><%=user.getUsername()%></td>

                    <td>

                        <%=user.isAdmin() ? "管理员" : "普通用户"%>

                    </td>

                    <td>

                        <%=user.getStatus()==0 ? "正常" : "禁用"%>

                    </td>

                    <td>

                        <%=user.getCityId()==null ? "-" : user.getCityId()%>

                    </td>

                    <td>

                        <a href="${pageContext.request.contextPath}/admin/user-detail?id=<%=user.getId()%>">

                            查看

                        </a>

                        <% if(user.getStatus()==0){ %>

                        <form action="${pageContext.request.contextPath}/admin/user-list"
                              method="post"
                              style="display:inline;"
                              onsubmit="return confirm('确定禁用该用户吗？');">

                            <input type="hidden" name="action" value="disable">
                            <input type="hidden" name="id" value="<%=user.getId()%>">

                            <button class="reject-btn">禁用</button>

                        </form>

                        <% }else{ %>

                        <form action="${pageContext.request.contextPath}/admin/user-list"
                              method="post"
                              style="display:inline;"
                              onsubmit="return confirm('确定解除该用户的禁用状态吗？');">

                            <input type="hidden" name="action" value="enable">
                            <input type="hidden" name="id" value="<%=user.getId()%>">

                            <button class="pass-btn">解禁</button>

                        </form>

                        <% } %>

                        <form action="${pageContext.request.contextPath}/admin/user-list"
                              method="post"
                              style="display:inline;"
                              onsubmit="return confirm('确定删除该用户吗？');">

                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%=user.getId()%>">

                            <button class="delete-btn">删除</button>

                        </form>

                    </td>

                </tr>

                <%
                        }
                    }
                %>

            </table>
        </div>

    </div>

</div>

</body>
</html>