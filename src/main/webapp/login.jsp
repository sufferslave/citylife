<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
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

        .login-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .login-card {
            width: 430px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            padding: 48px 38px;
        }

        .login-title {
            margin: 0 0 36px;
            font-size: 34px;
            font-weight: 700;
            line-height: 1.2;
            color: #000;
        }

        .form-group {
            margin-bottom: 22px;
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

        .login-btn {
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

        .login-btn:hover {
            background: #2765a8;
        }

        .login-links {
            margin-top: 24px;
            display: flex;
            justify-content: space-between;
            font-size: 18px;
        }

        .login-links a {
            color: #2f70b7;
            text-decoration: none;
        }

        .login-links a:hover {
            text-decoration: underline;
        }

        .error-msg {
            margin-bottom: 18px;
            color: #d93025;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="login-page">
    <div class="login-card">
        <h1 class="login-title">用户登录</h1>

        <%
            Object error = request.getAttribute("error");
            if (error != null) {
        %>
        <div class="error-msg"><%= error %></div>
        <%
            }
        %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">用户名</label>
                <input id="username" class="form-control" type="text" name="username" placeholder="请输入用户名">
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <input id="password" class="form-control" type="password" name="password" placeholder="请输入密码">
            </div>

            <button class="login-btn" type="submit">登录</button>

            <div class="login-links">
                <a href="${pageContext.request.contextPath}/register.jsp">注册账号</a>
                <a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>