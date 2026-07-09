<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>后台管理</title>

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

            <h2>欢迎进入后台管理系统</h2>

            <hr>

            <p>请选择左侧菜单开始管理网站信息。</p>

            <p>这里以后可以显示公告、系统状态等内容。</p>

        </div>

    </div>

</div>

</body>

</html>