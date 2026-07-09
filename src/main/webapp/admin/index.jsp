<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.citylife.entity.LifeInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>都市生活信息网</title>
    <style>
        body{
            margin:0;
            background:#f2f4f7;
            font-family:"Microsoft YaHei";
        }
        .header{
            background:#2f6fad;
            color:white;
            padding:20px;
        }
        .header h1{
            margin:0;
        }
        .nav{
            margin-top:15px;
        }
        .nav a{
            color:white;
            text-decoration:none;
            margin-right:25px;
        }
        .nav a:hover{
            color:yellow;
        }
        .container{
            width:1600px;
            margin:20px auto;
            display:flex;
        }
        .left{
            width:260px;
        }
        .right{
            flex:1;
            margin-left:20px;
        }
        .card{
            background:white;
            border-radius:8px;
            padding:20px;
            margin-bottom:20px;
            box-shadow:0 2px 8px rgba(0,0,0,.08);
        }
        .search-box{
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .search-box input{
            width:160px;
            height:35px;
            padding-left:10px;
        }
        .search-box button{
            height:39px;
            width:30px;
            background:#2f6fad;
            color:white;
            border:none;
            cursor:pointer;
        }
        .category a{
            display:block;
            padding:8px 0;
            text-decoration:none;
            color:#333;
        }
        .category a:hover{
            color:#2f6fad;
        }
        .info-item{
            border:1px solid #ddd;
            border-radius:6px;
            padding:15px;
            margin-bottom:15px;
        }
        .info-item h3{
            margin-top:0;
        }
        .info-item a{
            color:#2f6fad;
            text-decoration:none;
        }
        .info-item a:hover{
            color:red;
        }
    </style>
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

<div class="container">

    <!-- 左侧 -->
    <div class="left">
        <div class="card">
            <h2>信息搜索</h2>
            <form class="search-box" action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" name="keyword" placeholder="请输入关键词">
                <button type="submit">搜索</button>
            </form>
        </div>
        <div class="card">
            <h2>信息分类</h2>
            <div class="category">
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
            </div>
        </div>
    </div>

    <!-- 右侧 -->
    <div class="right">
        <div class="card">
            <h2>最新信息</h2>

            <%
                List<LifeInfo> allList = (List<LifeInfo>) request.getAttribute("infoList");
                if (allList == null || allList.isEmpty()) {
            %>
            <p>暂无信息</p>
            <%
            } else {
                // 按 info_type 分组，每组取 info_date 最大的一条
                java.util.Map<Integer, LifeInfo> latestMap = new java.util.HashMap<>();
                for (LifeInfo info : allList) {
                    Integer type = info.getInfoType();
                    LifeInfo existing = latestMap.get(type);
                    if (existing == null || info.getInfoDate().compareTo(existing.getInfoDate()) > 0) {
                        latestMap.put(type, info);
                    }
                }
                // 将分组结果转为列表，并按时间降序排序（最新在前）
                List<LifeInfo> infoList = new java.util.ArrayList<>(latestMap.values());
                infoList.sort((a, b) -> b.getInfoDate().compareTo(a.getInfoDate()));
                for (LifeInfo info : infoList) {
            %>
            <div class="info-item">
                <h3>
                    <a href="${pageContext.request.contextPath}/detail?id=<%=info.getId()%>">
                        <%=info.getInfoTitle()%>
                    </a>
                </h3>
                <p>联系人：<%=info.getInfoLinkman()%></p>
                <p>联系电话：<%=info.getInfoPhone()%></p>
                <p>发布时间：<%=info.getInfoDate()%></p>
            </div>
            <%
                    }
                }
            %>

        </div>
    </div>

</div>

</body>
</html>