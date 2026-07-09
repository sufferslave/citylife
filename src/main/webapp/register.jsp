<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: #f3f6f9;
            font-family: Arial, "Microsoft YaHei", sans-serif;
            color: #000;
        }

        .register-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .register-card {
            width: 460px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            padding: 48px 38px;
        }

        .register-title {
            margin: 0 0 34px;
            font-size: 34px;
            font-weight: 700;
            line-height: 1.2;
            color: #000;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-size: 20px;
            color: #000;
        }

        .form-control {
            width: 100%;
            height: 54px;
            padding: 0 16px;
            border: 1px solid #999;
            border-radius: 4px;
            font-size: 20px;
            outline: none;
            background: #fff;
        }

        .form-control:focus {
            border-color: #2f70b7;
        }

        .register-btn {
            width: 100%;
            height: 54px;
            margin-top: 8px;
            border: none;
            border-radius: 4px;
            background: #2f70b7;
            color: #fff;
            font-size: 22px;
            font-weight: 700;
            cursor: pointer;
        }

        .register-btn:hover {
            background: #2765a8;
        }

        .register-links {
            margin-top: 24px;
            display: flex;
            justify-content: space-between;
            font-size: 18px;
        }

        .register-links a {
            color: #2f70b7;
            text-decoration: none;
        }

        .register-links a:hover {
            text-decoration: underline;
        }

        .msg {
            margin-bottom: 18px;
            font-size: 16px;
            color: #d93025;
        }
    </style>
</head>
<body>

<div class="register-page">
    <div class="register-card">
        <h1 class="register-title">用户注册</h1>

        <%
            Object msg = request.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="msg"><%= msg %></div>
        <%
            }
        %>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="username">用户名</label>
                <input id="username" class="form-control" type="text" name="username" placeholder="请输入用户名">
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <input id="password" class="form-control" type="password" name="password" placeholder="请输入密码">
            </div>

            <div class="form-group">
                <label for="confirmPassword">确认密码</label>
                <input id="confirmPassword" class="form-control" type="password" name="confirmPassword" placeholder="请再次输入密码">
            </div>

            <div class="form-group">
                <label for="phone">联系电话</label>
                <input id="phone" class="form-control" type="text" name="phone" placeholder="请输入联系电话">
            </div>

            <button class="register-btn" type="submit">注册</button>

            <div class="register-links">
                <a href="${pageContext.request.contextPath}/login.jsp">已有账号，去登录</a>
                <a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>