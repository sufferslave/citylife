<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.citylife.entity.LifeInfo"%>


<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>信息审核</title>

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

            <h2>信息审核</h2>

            <div class="search-bar">

                <input type="text"
                       placeholder="请输入标题关键字">

                <button>查询</button>

            </div>

            <table class="admin-table">

                <tr>

                    <th>标题</th>

                    <th>分类</th>

                    <th>发布人</th>

                    <th>发布时间</th>

                    <th>状态</th>

                    <th>操作</th>

                </tr>

                <%
                    List<LifeInfo> auditList =
                            (List<LifeInfo>)request.getAttribute("auditList");

                    if(auditList!=null){

                        for(LifeInfo info:auditList){
                %>

                <tr>

                    <td><%=info.getInfoTitle()%></td>

                    <td><%=info.getInfoType()%></td>

                    <td><%=info.getInfoLinkman()%></td>

                    <td><%=info.getInfoDate()%></td>

                    <td>

                        <a href="#">查看</a>

                        <button>通过</button>

                        <button>驳回</button>

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