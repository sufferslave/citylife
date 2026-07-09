<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.citylife.entity.LifeInfo" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息搜索 - 都市供求信息网</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft Yahei", sans-serif;
        }
        body {
            background-color: #f5f7fa;
        }
        /* 顶部蓝色导航栏 */
        .top-nav {
            background-color: #2578f7;
            padding: 20px 40px;
            border-radius: 0 0 10px 10px;
        }
        .top-nav h1 {
            color: white;
            font-size: 30px;
            margin-bottom: 12px;
        }
        .top-nav a {
            color: white;
            text-decoration: none;
            font-size: 17px;
            margin-right: 32px;
        }
        .top-nav a:hover {
            text-decoration: underline;
        }
        /* 整体左右分栏容器 */
        .container {
            width: 96%;
            margin: 20px auto;
            display: flex;
            gap: 20px;
        }
        /* 左侧边栏宽度 */
        .left-side {
            width: 200px;
        }
        /* 日历 完全匹配截图样式 */
        .calendar {
            background: #ffffff;
            border-radius: 16px;
            padding: 18px 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .calendar .calendar-header {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 16px;
        }
        .calendar .calendar-header .line {
            width: 4px;
            height: 24px;
            background-color: #2578f7;
            margin-right: 8px;
            border-radius: 2px;
        }
        .calendar .calendar-title {
            font-size: 20px;
            font-weight: bold;
            color: #222;
        }
        .calendar .year-month {
            font-size: 18px;
            color: #222;
            text-align: center;
            margin-bottom: 12px;
        }
        .calendar .week-title {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            color: #2578f7;
            font-weight: bold;
            text-align: center;
            margin-bottom: 8px;
            background-color: #eaf4ff;
            border-radius: 8px;
            padding: 6px 0;
        }
        .calendar .days {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 4px 0;
            text-align: center;
            font-size: 16px;
            line-height: 32px;
        }
        .calendar .days span {
            color: #333;
        }
        .calendar .today {
            background-color: #2578f7;
            color: #ffffff;
            border-radius: 8px;
            width: 32px;
            height: 32px;
            line-height: 32px;
            display: inline-block;
            font-weight: bold;
        }
        /* 右侧主内容区 */
        .main-content {
            flex: 1;
            background: white;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 1px 4px #e2e8f0;
        }
        .location-path {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .location-path a {
            color: #2578f7;
            text-decoration: none;
        }
        .search-title {
            font-size: 24px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            margin-bottom: 24px;
        }
        /* 顶部搜索输入框 */
        .search-input-area {
            margin-bottom: 30px;
        }
        .search-input-area input {
            width: 400px;
            padding: 10px 14px;
            border: 1px solid #dde2eb;
            border-radius: 5px;
            font-size: 16px;
        }
        .search-input-area button {
            padding: 10px 24px;
            background: #2578f7;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            margin-left: 10px;
            cursor: pointer;
        }
        .search-input-area button:hover {
            background: #1b68e0;
        }
        /* 信息卡片 */
        .info-card {
            border: 1px solid #e8ecf3;
            border-radius: 6px;
            padding: 20px;
            margin-bottom: 16px;
        }
        .info-card h3 {
            font-size: 20px;
            color: #111;
            margin-bottom: 12px;
        }
        .info-card p {
            line-height: 1.8;
            font-size: 15px;
            margin: 6px 0;
            color: #444;
        }
        .info-card p span {
            color: #666;
            width: 80px;
            display: inline-block;
        }
        /* 空数据提示 */
        .empty-tip {
            font-size: 17px;
            color: #888;
            text-align: center;
            margin: 60px 0;
        }
    </style>
</head>
<body>
<!-- 顶部蓝色导航 -->
<div class="top-nav">
    <h1>都市供求信息网</h1>
    <div>
        <a href="${pageContext.request.contextPath}/index">首页</a>
        <a href="${pageContext.request.contextPath}/category">分类信息</a>
        <a href="${pageContext.request.contextPath}/publish">发布信息</a>
        <a href="${pageContext.request.contextPath}/admin/index">后台管理</a>
    </div>
</div>

<div class="container">
    <!-- 左侧边栏：仅日历，样式完全匹配截图 -->
    <div class="left-side">
        <div class="calendar">
            <div class="calendar-header">
                <div class="line"></div>
                <div class="calendar-title">日历</div>
            </div>
            <div class="year-month">2026年7月</div>
            <div class="week-title">
                <span>日</span>
                <span>一</span>
                <span>二</span>
                <span>三</span>
                <span>四</span>
                <span>五</span>
                <span>六</span>
            </div>
            <div class="days">
                <span></span>
                <span></span>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>

                <span>6</span>
                <span>7</span>
                <span>8</span>
                <span class="today">9</span>
                <span>10</span>
                <span>11</span>
                <span>12</span>

                <span>13</span>
                <span>14</span>
                <span>15</span>
                <span>16</span>
                <span>17</span>
                <span>18</span>
                <span>19</span>

                <span>20</span>
                <span>21</span>
                <span>22</span>
                <span>23</span>
                <span>24</span>
                <span>25</span>
                <span>26</span>

                <span>27</span>
                <span>28</span>
                <span>29</span>
                <span>30</span>
                <span>31</span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <!-- 右侧主内容区 -->
    <div class="main-content">
        <div class="location-path">
            当前位置：<a href="${pageContext.request.contextPath}/index">首页</a> > 搜索结果
        </div>

        <h2 class="search-title">搜索结果</h2>

        <!-- 页面顶部搜索框 -->
        <div class="search-input-area">
            <form action="${pageContext.request.contextPath}/infoSearch" method="get">
                <input type="text" name="keyword"
                       value="<%=request.getAttribute("keyword")==null?"":request.getAttribute("keyword")%>"
                       placeholder="请输入标题、联系人、内容进行搜索">
                <button type="submit">搜索</button>
            </form>
        </div>

        <%
            List<LifeInfo> infoList = (List<LifeInfo>) request.getAttribute("infoList");
            if(infoList == null || infoList.isEmpty()){
        %>
        <div class="empty-tip">没有找到相关信息，请更换关键词重新搜索</div>
        <%
        }else{
            for(LifeInfo info : infoList){
        %>
        <div class="info-card">
            <h3><%=info.getTitle()%></h3>
            <p><span>联系人：</span><%=info.getLinkman()%></p>
            <p><span>联系电话：</span><%=info.getPhone()%></p>
            <p><span>邮箱：</span><%=info.getEmail()%></p>
            <p><span>内容简介：</span><%=info.getContent()%></p>
            <p><span>发布时间：</span><%=info.getCreateTime()%></p>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>