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

            <form class="search-bar"
                  action="${pageContext.request.contextPath}/admin/audit"
                  method="get">

                <input
                        type="text"

                        name="keyword"

                        placeholder="请输入标题关键字">

                <button>

                    搜索

                </button>

            </form>

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

                    <td>
                        <%
                            switch(info.getInfoType()){
                                case 1: out.print("招聘信息"); break;
                                case 2: out.print("培训信息"); break;
                                case 3: out.print("房屋信息"); break;
                                case 4: out.print("求购信息"); break;
                                case 5: out.print("招商引资"); break;
                                case 6: out.print("公寓信息"); break;
                                case 7: out.print("求职信息"); break;
                                case 8: out.print("家教信息"); break;
                                case 9: out.print("车辆信息"); break;
                                case 10: out.print("出售信息"); break;
                                case 11: out.print("寻物启事"); break;
                            }
                        %>
                    </td>

                    <td><%=info.getInfoLinkman()%></td>

                    <td><%=info.getInfoDate()%></td>
                    <td>待审核</td>
                    <td>

                        <a href="${pageContext.request.contextPath}/admin/info-detail?id=<%=info.getId()%>">
                            查看
                        </a>

                        <form action="${pageContext.request.contextPath}/admin/audit"
                              method="post"
                              style="display:inline;">

                            <input type="hidden"
                                   name="id"
                                   value="<%=info.getId()%>">

                            <input type="hidden"
                                   name="action"
                                   value="pass">

                            <button class="pass-btn">

                                通过

                            </button>

                        </form>

                        <form action="${pageContext.request.contextPath}/admin/audit"
                              method="post"
                              style="display:inline;">

                            <input type="hidden"
                                   name="id"
                                   value="<%=info.getId()%>">

                            <input type="hidden"
                                   name="action"
                                   value="reject">

                            <button class="reject-btn">

                                驳回

                            </button>

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