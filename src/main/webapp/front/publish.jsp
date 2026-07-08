<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>

<div class="header">
    <h1>都市生活网站</h1>
    <div class="nav">
        <a href="${pageContext.request.contextPath}/index">首页</a>
        <a href="${pageContext.request.contextPath}/category">分类信息</a>
        <a href="${pageContext.request.contextPath}/publish">发布信息</a>
        <a href="${pageContext.request.contextPath}/admin/index">后台管理</a>
    </div>
</div>

<div class="container">
    <h2>发布生活信息</h2>

    <form action="${pageContext.request.contextPath}/publish" method="post">
        <p>
            <label>信息分类：</label>
            <select name="infoType" required>
                <option value="">请选择分类</option>
                <option value="1">招聘信息</option>
                <option value="2">培训信息</option>
                <option value="3">房屋信息</option>
                <option value="4">求购信息</option>
                <option value="5">招商引资</option>
                <option value="6">公寓信息</option>
                <option value="7">求职信息</option>
                <option value="8">家教信息</option>
                <option value="9">车辆信息</option>
                <option value="10">出售信息</option>
                <option value="11">寻找启示</option>
            </select>
        </p>

        <p>
            <label>标题：</label>
            <input type="text" name="infoTitle" required>
        </p>

        <p>
            <label>联系人：</label>
            <input type="text" name="infoLinkman" required>
        </p>

        <p>
            <label>联系电话：</label>
            <input type="text" name="infoPhone" maxlength="11" required>
        </p>

        <p>
            <label>邮箱：</label>
            <input type="email" name="infoEmail">
        </p>

        <p>
            <label>信息内容：</label>
            <textarea name="infoContent" rows="8" cols="60" required></textarea>
        </p>

        <p>
            <button type="submit">提交发布</button>
            <a href="${pageContext.request.contextPath}/index">返回首页</a>
        </p>
    </form>
</div>

</body>
</html>