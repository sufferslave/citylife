<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.citylife.entity.LifeInfo" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息详情</title>
    <style>
        * {
            margin: 0 !important;
            padding: 0 !important;
            box-sizing: border-box !important;
            font-family: "Microsoft Yahei", sans-serif !important;
        }
        body {
            background-color: #f5f7fa !important;
            padding: 24px 40px !important;
            line-height: 1.8 !important;
        }
        /* 顶部导航 */
        .header {
            background: linear-gradient(135deg, #165DFF, #4080FF) !important;
            padding: 20px 30px !important;
            border-radius: 12px !important;
            margin-bottom: 30px !important;
            box-shadow: 0 2px 10px rgba(22, 93, 255, 0.15) !important;
        }
        .header h1 {
            color: #ffffff !important;
            font-size: 28px !important;
            letter-spacing: 2px !important;
            margin-bottom: 12px !important;
        }
        .header div a {
            color: #e8f3ff !important;
            text-decoration: none !important;
            font-size: 16px !important;
            padding: 0 12px !important;
            transition: 0.2s !important;
        }
        .header div a:hover {
            color: #fff !important;
            text-decoration: underline !important;
        }
        .header hr {
            display: none !important;
        }
        /* 主体左右布局 */
        .main-wrap {
            display: flex !important;
            gap: 24px !important;
        }
        /* 左侧栏容器 */
        .left-sidebar {
            width: 220px !important;
        }
        /* 左侧卡片通用：日历、搜索 */
        .side-block {
            background: #fff !important;
            border-radius: 12px !important;
            padding: 16px !important;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08) !important;
            margin-bottom: 20px !important;
        }
        .side-block h4 {
            font-size: 16px !important;
            margin-bottom: 12px !important;
            color: #1f2937 !important;
            border-left: 4px solid #165DFF !important;
            padding-left: 8px !important;
        }
        /* 日历表格样式 */
        .calendar-table {
            width: 100% !important;
            border-collapse: collapse !important;
            text-align: center !important;
        }
        .calendar-table td, .calendar-table th {
            width: 30px !important;
            height: 30px !important;
            font-size: 13px !important;
            border-radius: 4px !important;
        }
        .calendar-table td.today {
            background: #165DFF !important;
            color: #fff !important;
        }
        /* 搜索模块 */
        input, select {
            border: 1px solid #ddd !important;
            border-radius: 6px !important;
            padding: 6px 8px !important;
            margin: 4px 0 !important;
            width: 160px !important;
        }
        button {
            background: #165DFF !important;
            color: #fff !important;
            border: none !important;
            padding: 6px 16px !important;
            border-radius: 6px !important;
            cursor: pointer !important;
        }
        button:hover {
            background: #0E4BDB !important;
        }
        /* 右侧详情卡片 */
        .detail-card {
            flex: 1 !important;
            background: #ffffff !important;
            border-radius: 12px !important;
            padding: 32px !important;
            box-shadow: 0 2px 14px rgba(0, 0, 0, 0.07) !important;
            max-width: 900px !important;
        }
        .detail-card h2 {
            font-size: 24px !important;
            color: #1f2937 !important;
            margin-bottom: 24px !important;
            padding-bottom: 12px !important;
            border-bottom: 1px solid #eee !important;
        }
        .detail-card p {
            font-size: 16px !important;
            color: #374151 !important;
            margin-bottom: 12px !important;
        }
        .detail-card p label {
            font-weight: bold !important;
            width: 110px !important;
            display: inline-block !important;
            color: #1f2937 !important;
        }
        .content-box {
            border: 1px solid #e5e7eb !important;
            padding: 18px !important;
            border-radius: 8px !important;
            background-color: #f9fafc !important;
            margin: 16px 0 28px !important;
            color: #4b5563 !important;
        }
        .back-link {
            display: inline-block !important;
            padding: 9px 24px !important;
            background-color: #165DFF !important;
            color: #fff !important;
            text-decoration: none !important;
            border-radius: 8px !important;
            transition: 0.2s !important;
        }
        .back-link:hover {
            background-color: #0E4BDB !important;
        }
        .empty-tip {
            text-align: center !important;
            padding: 60px 0 !important;
            font-size: 18px !important;
            color: #6b7280 !important;
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

<div class="main-wrap">
    <!-- 左侧栏：日历 + 搜索 -->
    <div class="left-sidebar">
        <!-- 动态日历模块 -->
        <div class="side-block">
            <h4>日历</h4>
            <%
                Calendar cal = Calendar.getInstance();
                int year = cal.get(Calendar.YEAR);
                int month = cal.get(Calendar.MONTH);
                int today = cal.get(Calendar.DAY_OF_MONTH);
                cal.set(year, month, 1);
                int firstWeek = cal.get(Calendar.DAY_OF_WEEK);
                int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            %>
            <p style="text-align:center;margin-bottom:8px"><%=year%>年<%=month+1%>月</p>
            <table class="calendar-table">
                <tr>
                    <th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th>
                </tr>
                <tr>
                    <%
                        // 填充月初空白
                        for(int i=1;i<firstWeek;i++){
                    %>
                    <td></td>
                    <%
                        }
                        // 填充当月日期
                        int dayCount = firstWeek - 1;
                        for(int d=1;d<=maxDay;d++){
                            dayCount++;
                            String cls = "";
                            if(d == today) cls = "today";
                    %>
                    <td class="<%=cls%>"><%=d%></td>
                    <%
                        if(dayCount %7 ==0){
                    %>
                </tr><tr>
                <%
                        }
                    }
                %>
            </tr>
            </table>
        </div>

        <!-- 简易搜索模块 -->
        <div class="side-block">
            <h4>信息快速搜索</h4>
            <form action="${pageContext.request.contextPath}/search" method="get">
                <div>关键词：<input type="text" name="keyword"></div>
                <div>分类：
                    <select name="type">
                        <option value="">全部</option>
                        <option value="1">招聘</option>
                        <option value="3">房屋</option>
                        <option value="8">家教</option>
                    </select>
                </div>
                <div>
                    <input type="radio" name="searchType" value="all" checked>全文匹配
                    <input type="radio" name="searchType" value="title">标题检索
                </div>
                <button type="submit">搜索</button>
            </form>
        </div>
    </div>

    <!-- 右侧详情卡片（组长原始业务代码完全保留） -->
    <div class="detail-card">
        <%
            LifeInfo info = (LifeInfo) request.getAttribute("info");
            if (info == null) {
        %>
        <div class="empty-tip">
            <h2>信息不存在</h2>
            <p><a href="${pageContext.request.contextPath}/index" class="back-link">返回首页</a></p>
        </div>
        <%
        } else {
        %>
        <h2><%= info.getInfoTitle() %></h2>
        <p><label>分类编号：</label><%= info.getInfoType() %></p>
        <p><label>联系人：</label><%= info.getInfoLinkman() %></p>
        <p><label>联系电话：</label><%= info.getInfoPhone() %></p>
        <p><label>邮箱：</label><%= info.getInfoEmail() %></p>
        <p><label>发布时间：</label><%= info.getInfoDate() %></p>
        <p><label>信息内容：</label></p>
        <div class="content-box">
            <%= info.getInfoContent() %>
        </div>

        <p>
            <a href="${pageContext.request.contextPath}/index" class="back-link">返回首页</a>
        </p>
        <%
            }
        %>
    </div>
</div>

</body>
</html>