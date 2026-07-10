<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2026/7/8
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.citylife.entity.LifeInfo"%>

<%
    LifeInfo info =
            (LifeInfo)request.getAttribute("info");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>信息详情</title>




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

            <h2>信息详情</h2>

            <table class="detail-table">

                <tr>

                    <th>标题</th>

                    <td><%=info.getInfoTitle()%></td>

                </tr>

                <tr>

                    <th>分类</th>

                    <td>
                        <%
                            switch (info.getInfoType()) {
                                case 1:
                                    out.print("招聘信息");
                                    break;
                                case 2:
                                    out.print("培训信息");
                                    break;
                                case 3:
                                    out.print("房屋信息");
                                    break;
                                case 4:
                                    out.print("求购信息");
                                    break;
                                case 5:
                                    out.print("招商引资");
                                    break;
                                case 6:
                                    out.print("公寓信息");
                                    break;
                                case 7:
                                    out.print("求职信息");
                                    break;
                                case 8:
                                    out.print("家教信息");
                                    break;
                                case 9:
                                    out.print("车辆信息");
                                    break;
                                case 10:
                                    out.print("出售信息");
                                    break;
                                case 11:
                                    out.print("寻找启事");
                                    break;
                                default:
                                    out.print("未知分类");
                            }
                        %>
                    </td>

                </tr>

                <tr>

                    <th>联系人</th>

                    <td><%=info.getInfoLinkman()%></td>

                </tr>

                <tr>

                    <th>联系电话</th>

                    <td><%=info.getInfoPhone()%></td>

                </tr>

                <tr>

                    <th>邮箱</th>

                    <td><%=info.getInfoEmail()%></td>

                </tr>

                <tr>

                    <th>发布时间</th>

                    <td><%=info.getInfoDate()%></td>

                </tr>

                <tr>

                    <th>内容</th>

                    <td>

                        <%=info.getInfoContent()%>

                    </td>

                </tr>

            </table>



        </div>

    </div>

</div>

</body>

</html>
