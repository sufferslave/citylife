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

        /* 页眉 */
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

        /* 整体布局 */
        .container{
            width:1600px;
            margin:20px auto;
            display:flex;
        }

        /* 左侧 */
        .left{
            width:260px;
        }

        /* 右侧 */
        .right{
            flex:1;
            margin-left:20px;
        }

        /* 卡片 */
        .card{
            background:white;
            border-radius:8px;
            padding:20px;
            margin-bottom:20px;
            box-shadow:0 2px 8px rgba(0,0,0,.08);
        }

        /* 搜索框 */
        .search-box{
            display: flex;
            align-items: center;
            gap: 10px;   /* 输入框和按钮之间的间距 */
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

        /* 分类 */
        .category a{
            display:block;
            padding:8px 0;
            text-decoration:none;
            color:#333;
        }

        .category a:hover{
            color:#2f6fad;
        }

        /* 信息卡片 */
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
        <a href="${pageContext.request.contextPath}/admin/login">后台管理</a>
    </div>
    <hr>
</div>

<div class="container">

    <!-- 左侧 -->
    <div class="left">

        <!-- 搜索 -->
        <div class="card">

            <h2>信息搜索</h2>

            <form class="search-box"
                  action="${pageContext.request.contextPath}/search"
                  method="get">

                <input type="text"
                       name="keyword"
                       placeholder="请输入关键词">

                <button type="submit">
                    搜索
                </button>

            </form>

        </div>

        <!-- 分类 -->
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

                List<LifeInfo> infoList=(List<LifeInfo>)request.getAttribute("infoList");

                if(infoList==null||infoList.size()==0){

            %>

            <p>暂无信息</p>

            <%

            }else{

                for(LifeInfo info:infoList){

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