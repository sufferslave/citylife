<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.citylife.entity.LifeInfo" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分类信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <style>
        *{
            margin: 0 !important;
            padding: 0 !important;
            box-sizing: border-box !important;
            font-family: "Microsoft Yahei", sans-serif !important;
        }
        body{
            background-color: #f5f7fa !important;
            padding: 20px 40px !important;
            line-height: 1.8 !important;
        }
        /* 顶部导航栏优化 */
        .header-bar{
            background: linear-gradient(135deg,#165DFF,#4080FF) !important;
            padding:18px 32px !important;
            border-radius:14px !important;
            margin-bottom:26px !important;
            box-shadow: 0 3px 12px rgba(22, 93, 255, 0.12) !important;
        }
        .header-bar h1{
            color:#fff !important;
            font-size:28px !important;
            letter-spacing:2px !important;
            margin-bottom:12px !important;
        }
        .nav-links a{
            color:#e8f3ff !important;
            text-decoration:none !important;
            margin-right:24px !important;
            font-size:17px !important;
            padding:6px 10px !important;
            border-radius:6px !important;
            transition:0.25s ease all !important;
        }
        .nav-links a:hover{
            color:#fff !important;
            background:rgba(255,255,255,0.15) !important;
        }
        /* 主体左右布局 */
        .main-wrap{
            display: flex !important;
            gap:26px !important;
        }
        .left-col{
            width:200px !important;
        }
        /* 左侧通用卡片统一美化 */
        .small-block{
            background:#fff !important;
            border-radius:14px !important;
            padding:18px !important;
            box-shadow:0 2px 14px rgba(0,0,0,0.06) !important;
            margin-bottom:22px !important;
        }
        .small-block h4{
            font-size:17px !important;
            margin-bottom:14px !important;
            color:#1f2937 !important;
            border-left:5px solid #165DFF !important;
            padding-left:10px !important;
        }
        /* 日历美化 */
        .calendar-table{
            width:100% !important;
            border-collapse: collapse !important;
            text-align:center !important;
        }
        .calendar-table th{
            background:#f0f5ff !important;
            font-size:13px !important;
            color:#165DFF !important;
            height:32px !important;
        }
        .calendar-table td{
            width:30px !important;
            height:32px !important;
            font-size:13px !important;
            border-radius:6px !important;
        }
        .calendar-table td.today{
            background:#165DFF !important;
            color:#fff !important;
            font-weight:bold !important;
        }
        /* 搜索表单优化 */
        input,select{
            border:1px solid #d1d5db !important;
            border-radius:8px !important;
            padding:8px 10px !important;
            margin:6px 0 !important;
            width:160px !important;
            font-size:14px !important;
        }
        button{
            background:#165DFF !important;
            color:#fff !important;
            border:none !important;
            padding:8px 18px !important;
            border-radius:8px !important;
            cursor:pointer !important;
            transition:0.2s !important;
            font-size:14px !important;
        }
        button:hover{
            background:#0E4BDB !important;
            transform: scale(1.03) !important;
        }
        /* 右侧主卡片 */
        .right-card{
            flex:1 !important;
            background:#ffffff !important;
            border-radius:14px !important;
            padding:32px !important;
            padding-bottom:40px !important;
            box-shadow: 0 2px 14px rgba(0, 0, 0, 0.06) !important;
        }
        /* 面包屑导航样式 */
        .bread{
            font-size:14px !important;
            color:#6b7280 !important;
            margin-bottom:20px !important;
        }
        .bread a{
            color:#165DFF !important;
            text-decoration:none !important;
        }
        .bread a:hover{
            text-decoration:underline !important;
        }
        .right-card h2{
            font-size:24px !important;
            color:#111827 !important;
            margin-bottom:22px !important;
            padding-bottom:12px !important;
            border-bottom:2px solid #e2e8f0 !important;
        }
        /* 顶部横向分类标签优化 */
        .type-wrap{
            margin-bottom:28px !important;
            overflow-x: auto !important;
            overflow-y: hidden !important;
            padding:10px 0 !important;
        }
        .type-row{
            display:flex !important;
            gap:8px !important;
            width: max-content !important;
            flex-wrap: nowrap !important;
        }
        .type-row a{
            white-space: nowrap !important;
            text-decoration:none !important;
            color:#4b5563 !important;
            padding:6px 12px !important;
            font-size:14px !important;
            border:1px solid #d1d5db !important;
            border-radius:8px !important;
            transition:0.2s ease all !important;
        }
        .type-row a:hover{
            background:#e8f3ff !important;
            color:#165DFF !important;
            border-color:#165DFF !important;
            transform: scale(1.04) !important;
        }
        .type-row a.active{
            background:#e8f3ff !important;
            color:#165DFF !important;
            border:1px solid #165DFF !important;
            font-weight:500 !important;
        }
        /* 详情信息条目排版优化 */
        .info-row{
            display:flex !important;
            margin-bottom:16px !important;
            align-items:center !important;
        }
        .info-row label{
            width:100px !important;
            font-weight:bold !important;
            color:#1f2937 !important;
            font-size:15px !important;
        }
        .info-row span{
            flex:1 !important;
            color:#374151 !important;
            font-size:15px !important;
        }
        .info-tag{
            background:#e8f3ff !important;
            color:#165DFF !important;
            padding:5px 12px !important;
            border-radius:8px !important;
            display:inline-block !important;
        }
        /* 内容文本框美化 */
        .content-box{
            margin:22px 0 !important;
            padding:20px !important;
            background:#f9fafc !important;
            border-radius:10px !important;
            color:#374151 !important;
            line-height:1.9 !important;
            border:1px solid #e5e7eb !important;
        }
        /* 联系人信息行 */
        .contact-row{
            display:flex !important;
            gap:48px !important;
            margin-top:18px !important;
            font-size:15px !important;
            align-items:center !important;
        }
        /* 复制按钮小样式 */
        .copy-btn{
            margin-left:10px !important;
            padding:3px 8px !important;
            font-size:12px !important;
            background:#e8f3ff !important;
            color:#165DFF !important;
        }
        /* 底部按钮统一容器：同行、居右 */
        .bottom-btn-group{
            margin-top:30px !important;
            display:flex !important;
            gap:16px !important;
            justify-content: flex-end !important;
            align-items:center !important;
        }
        /* 统一三个按钮尺寸样式 */
        .switch-btn, .back-btn{
            padding:9px 22px !important;
            border-radius:8px !important;
            text-decoration:none !important;
            transition:0.2s !important;
            font-size:15px !important;
            min-width:130px !important;
            text-align:center !important;
        }
        .switch-btn{
            background:#fff !important;
            color:#165DFF !important;
            border:1px solid #165DFF !important;
        }
        .switch-btn:hover{
            background:#165DFF !important;
            color:#fff !important;
        }
        .back-btn{
            background-color: #165DFF !important;
            color: #fff !important;
            border:none !important;
        }
        .back-btn:hover{
            background-color: #0E4BDB !important;
            transform: scale(1.04) !important;
        }
        .empty-tip{
            font-size:18px !important;
            color:#6b7280 !important;
            text-align:center !important;
            padding:60px 0 !important;
        }
        .title-link{
            color:#165DFF !important;
            text-decoration:none !important;
        }
        .title-link:hover{
            text-decoration:underline !important;
        }
        /* 美化横向滚动条 */
        .type-wrap::-webkit-scrollbar{
            height:5px !important;
        }
        .type-wrap::-webkit-scrollbar-thumb{
            background:#c9d8ff !important;
            border-radius:4px !important;
        }
    </style>
</head>
<body>
<div class="header-bar">
    <h1>都市供求信息网</h1>
    <div class="nav-links">
        <a href="index.jsp">首页</a>
        <a href="category">分类信息</a>
        <a href="publishing.jsp">发布信息</a>
        <a href="admin/index.jsp">后台管理</a>
    </div>
</div>

<div class="main-wrap">
    <div class="left-col">
        <div class="small-block">
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
                        for(int i=1;i<firstWeek;i++){
                    %>
                    <td></td>
                    <%
                        }
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
        <div class="small-block">
            <h4>信息快速搜索</h4>
            <form action="search" method="get">
                <div>关键词：<input type="text" name="keyword"></div>
                <div>分类：
                    <select name="type">
                        <option value="">全部</option>
                        <option value="1">招聘</option>
                        <option value="2">培训</option>
                        <option value="3">房屋</option>
                        <option value="4">求购</option>
                        <option value="5">招商引资</option>
                        <option value="6">公寓</option>
                        <option value="7">求职</option>
                        <option value="8">家教</option>
                        <option value="9">车辆</option>
                        <option value="10">出售</option>
                        <option value="11">寻找启示</option>
                    </select>
                </div>
                <button type="submit">搜索</button>
            </form>
        </div>
    </div>

    <div class="right-card">
        <%
            // 定义分类参数
            String typeStr = request.getParameter("type");
            String typeName = "未知分类";
            if("1".equals(typeStr)) typeName="招聘信息";
            if("2".equals(typeStr)) typeName="培训信息";
            if("3".equals(typeStr)) typeName="房屋信息";
            if("4".equals(typeStr)) typeName="求购信息";
            if("5".equals(typeStr)) typeName="招商引资";
            if("6".equals(typeStr)) typeName="公寓信息";
            if("7".equals(typeStr)) typeName="求职信息";
            if("8".equals(typeStr)) typeName="家教信息";
            if("9".equals(typeStr)) typeName="车辆信息";
            if("10".equals(typeStr)) typeName="出售信息";
            if("11".equals(typeStr)) typeName="寻找启示";

            // 接收Servlet传递的列表、当前数据、当前下标
            List<LifeInfo> infoList = (List<LifeInfo>) request.getAttribute("infoList");
            LifeInfo currInfo = (LifeInfo) request.getAttribute("currInfo");
            Integer currIndex = (Integer) request.getAttribute("currIndex");
        %>
        <div class="bread">
            当前位置：<a href="index.jsp">首页</a> &gt; <a href="category">分类信息</a> &gt; <%=typeName%>
        </div>

        <div class="type-wrap">
            <div class="type-row">
                <a href="category?type=1" class="<%="1".equals(typeStr)?"active":""%>">招聘信息</a>
                <a href="category?type=2" class="<%="2".equals(typeStr)?"active":""%>">培训信息</a>
                <a href="category?type=3" class="<%="3".equals(typeStr)?"active":""%>">房屋信息</a>
                <a href="category?type=4" class="<%="4".equals(typeStr)?"active":""%>">求购信息</a>
                <a href="category?type=5" class="<%="5".equals(typeStr)?"active":""%>">招商引资</a>
                <a href="category?type=6" class="<%="6".equals(typeStr)?"active":""%>">公寓信息</a>
                <a href="category?type=7" class="<%="7".equals(typeStr)?"active":""%>">求职信息</a>
                <a href="category?type=8" class="<%="8".equals(typeStr)?"active":""%>">家教信息</a>
                <a href="category?type=9" class="<%="9".equals(typeStr)?"active":""%>">车辆信息</a>
                <a href="category?type=10" class="<%="10".equals(typeStr)?"active":""%>">出售信息</a>
                <a href="category?type=11" class="<%="11".equals(typeStr)?"active":""%>">寻找启示</a>
            </div>
        </div>

        <h2><%=typeName%></h2>
        <%
            if(infoList == null || infoList.size() == 0 || currInfo == null){
        %>
        <p class="empty-tip">暂无信息</p>
        <%
        }else{
        %>
        <div class="info-row">
            <label>信息类别：</label>
            <span class="info-tag"><%=typeName%></span>
        </div>
        <div class="info-row">
            <label>发布时间：</label>
            <span><%=currInfo.getInfoDate()%></span>
        </div>
        <div class="info-row">
            <label>信息标题：</label>
            <span><%=currInfo.getInfoTitle()%></span>
        </div>
        <div class="content-box">
            <%=currInfo.getInfoContent()%>
        </div>
        <div class="contact-row">
            <div>
                <label>联系人：</label>
                <span><%=currInfo.getInfoLinkman()%></span>
            </div>
            <div>
                <label>联系电话：</label>
                <span id="telText"><%=currInfo.getInfoPhone()%></span>
                <button class="copy-btn" onclick="copyTel()">复制</button>
            </div>
            <div>
                <label>邮箱：</label>
                <span id="mailText"><%=currInfo.getInfoEmail()%></span>
                <button class="copy-btn" onclick="copyMail()">复制</button>
            </div>
        </div>
        <%
            }
        %>

        <div class="bottom-btn-group">
            <% if(infoList != null && infoList.size() > 0 && currInfo != null){ %>
            <%-- 下标>0 才有上一条 --%>
            <% if(currIndex > 0){ %>
            <% LifeInfo prev = infoList.get(currIndex - 1); %>
            <a class="switch-btn" href="category?type=<%=typeStr%>&id=<%=prev.getId()%>">上一条信息</a>
            <% } %>
            <%-- 下标不是最后一位 才有下一条 --%>
            <% if(currIndex < infoList.size() - 1){ %>
            <% LifeInfo next = infoList.get(currIndex + 1); %>
            <a class="switch-btn" href="category?type=<%=typeStr%>&id=<%=next.getId()%>">下一条信息</a>
            <% } %>
            <% } %>
            <a href="index.jsp" class="back-btn">返回首页</a>
        </div>
    </div>
</div>

<script>
    function copyTel(){
        const text = document.getElementById('telText').innerText;
        navigator.clipboard.writeText(text).then(()=>{
            alert("电话号码复制成功！");
        })
    }
    function copyMail(){
        const text = document.getElementById('mailText').innerText;
        navigator.clipboard.writeText(text).then(()=>{
            alert("邮箱复制成功！");
        })
    }
</script>
</body>
</html>