<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册 - CityLife</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .register-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
        }

        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .register-header h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .register-header p {
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

        .form-group label .required {
            color: red;
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

        .form-group .hint {
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }

        .error-message {
            background: #fee;
            color: #c33;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .success-message {
            background: #efe;
            color: #3c3;
            display: none;
        }

        .success-message.show {
            display: block;
        }

        .btn-register {
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

        .btn-register:hover {
            transform: translateY(-2px);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        .btn-register:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
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

        .info-box {
            background: #f0f4ff;
            border-left: 4px solid #667eea;
            padding: 12px;
            margin-bottom: 20px;
            font-size: 14px;
            color: #555;
        }

        .tip-box {
            background: #fffbf0;
            border-left: 4px solid #ffc107;
            padding: 12px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #555;
            border-radius: 3px;
        }

        .tip-box strong {
            color: #ff9800;
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="register-header">
        <h1>用户注册</h1>
        <p>加入 CityLife 城市生活社区</p>
    </div>

    <div class="info-box">
        ℹ️ 注册后您将成为普通用户，可以发布和管理帖子
    </div>

    <div class="tip-box">
        <strong>💡 提示：</strong> 暂时不想注册？点击"返回主页"按钮，继续以游客身份浏览
    </div>

    <div class="error-message" id="errorMsg">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>

    <div class="success-message" id="successMsg">
        <%= request.getAttribute("success") != null ? request.getAttribute("success") : "" %>
    </div>

    <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
        <div class="form-group">
            <label for="username">用户名 <span class="required">*</span></label>
            <input type="text" id="username" name="username" placeholder="请输入用户名（3-20个字符）"
                   required minlength="3" maxlength="20" pattern="[a-zA-Z0-9_]+">
            <div class="hint">只能包含字母、数字和下划线</div>
        </div>

        <div class="form-group">
            <label for="password">密码 <span class="required">*</span></label>
            <input type="password" id="password" name="password" placeholder="请输入密码（6-20个字符）"
                   required minlength="6" maxlength="20">
            <div class="hint">密码长度为6-20个字符</div>
        </div>

        <div class="form-group">
            <label for="confirmPassword">确认密码 <span class="required">*</span></label>
            <input type="password" id="confirmPassword" name="confirmPassword"
                   placeholder="请再次输入密码" required>
        </div>

        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="email" id="email" name="email" placeholder="请输入邮箱地址（选填）">
            <div class="hint">用于找回密码和接收通知</div>
        </div>

        <div class="form-group">
            <label for="phone">手机号</label>
            <input type="tel" id="phone" name="phone" placeholder="请输入手机号（选填）"
                   pattern="1[3-9]\d{9}">
            <div class="hint">可选填写，用于账号安全</div>
        </div>

        <button type="submit" class="btn-register" id="submitBtn">立即注册</button>

        <!-- 返回主页按钮 - 明显突出 -->
        <a href="${pageContext.request.contextPath}/front/index.jsp" class="btn-home">
            🏠 返回主页继续浏览
        </a>
    </form>

    <div class="links">
        <a href="${pageContext.request.contextPath}/login">已有账号？去登录</a>
    </div>
</div>

<script>
    const form = document.getElementById('registerForm');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');
    const submitBtn = document.getElementById('submitBtn');

    // 表单提交验证
    form.addEventListener('submit', function(e) {
        // 验证两次密码是否一致
        if (password.value !== confirmPassword.value) {
            e.preventDefault();
            showError('两次输入的密码不一致');
            return false;
        }

        // 禁用提交按钮，防止重复提交
        submitBtn.disabled = true;
        submitBtn.textContent = '注册中...';
    });

    // 显示错误信息
    function showError(message) {
        const errorMsg = document.getElementById('errorMsg');
        errorMsg.textContent = message;
        errorMsg.classList.add('show');

        // 3秒后自动隐藏
        setTimeout(() => {
            errorMsg.classList.remove('show');
        }, 3000);
    }

    // 页面加载时显示消息
    window.onload = function() {
        const errorMsg = document.getElementById('errorMsg');
        const successMsg = document.getElementById('successMsg');

        if (errorMsg.textContent.trim() !== '') {
            errorMsg.classList.add('show');
        }

        if (successMsg.textContent.trim() !== '') {
            successMsg.classList.add('show');
            // 3秒后跳转到登录页
            setTimeout(() => {
                window.location.href = '${pageContext.request.contextPath}/login';
            }, 3000);
        }
    };

    // 实时验证确认密码
    confirmPassword.addEventListener('input', function() {
        if (this.value && password.value !== this.value) {
            this.setCustomValidity('两次密码不一致');
        } else {
            this.setCustomValidity('');
        }
    });
</script>
</body>
</html>