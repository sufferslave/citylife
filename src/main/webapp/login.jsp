<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录 - CityLife</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .login-header p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .role-select {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .role-option {
            flex: 1;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }

        .role-option:hover {
            border-color: #667eea;
        }

        .role-option.active {
            border-color: #667eea;
            background: #f0f4ff;
            color: #667eea;
            font-weight: bold;
        }

        .role-option input[type="radio"] {
            display: none;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s;
            margin-bottom: 15px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-home {
            width: 100%;
            padding: 12px;
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
            display: block;
            text-decoration: none;
        }

        .btn-home:hover {
            background: #f0f4ff;
            transform: translateY(-2px);
        }

        .btn-home:active {
            transform: translateY(0);
        }

        .error-message {
            background: #fee;
            color: #c33;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .links {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .links a {
            color: #667eea;
            text-decoration: none;
            margin: 0 10px;
            font-size: 14px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .tip-box {
            background: #f0f4ff;
            border-left: 4px solid #667eea;
            padding: 12px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #555;
            border-radius: 3px;
        }

        .tip-box strong {
            color: #667eea;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <h1>欢迎登录</h1>
        <p>CityLife 城市生活社区</p>
    </div>

    <div class="tip-box">
        <strong>💡 提示：</strong> 不想登录？点击下方"返回主页"按钮，继续以游客身份浏览
    </div>

    <div class="error-message" id="errorMsg">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>

    <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名" required>
        </div>

        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required>
        </div>

        <div class="role-select">
            <label class="role-option active">
                <input type="radio" name="role" value="0" checked>
                <div>普通用户</div>
            </label>
            <label class="role-option">
                <input type="radio" name="role" value="1">
                <div>管理员</div>
            </label>
        </div>

        <button type="submit" class="btn-login">立即登录</button>

        <!-- 返回主页按钮 - 明显突出 -->
        <a href="${pageContext.request.contextPath}/front/index.jsp" class="btn-home">
            🏠 返回主页继续浏览
        </a>
    </form>

    <div class="links">
        <a href="${pageContext.request.contextPath}/register">还没账号？立即注册</a>
    </div>
</div>

<script>
    // 角色选择切换效果
    document.querySelectorAll('.role-option').forEach(option => {
        option.addEventListener('click', function() {
            document.querySelectorAll('.role-option').forEach(opt => {
                opt.classList.remove('active');
            });
            this.classList.add('active');
            this.querySelector('input[type="radio"]').checked = true;
        });
    });

    // 显示错误信息
    window.onload = function() {
        const errorMsg = document.getElementById('errorMsg');
        if (errorMsg.textContent.trim() !== '') {
            errorMsg.classList.add('show');
        }
    };
</script>
</body>
</html>