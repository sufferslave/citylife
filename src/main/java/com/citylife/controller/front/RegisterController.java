package com.citylife.controller.front;

import com.citylife.dao.UserDao;
import com.citylife.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 显示注册页面
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 设置编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 获取参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // 验证参数
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "用户名不能为空");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "密码不能为空");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "两次输入的密码不一致");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 验证用户名格式
        if (!username.matches("[a-zA-Z0-9_]{3,20}")) {
            request.setAttribute("error", "用户名只能包含字母、数字和下划线，长度为3-20个字符");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 验证密码长度
        if (password.length() < 6 || password.length() > 20) {
            request.setAttribute("error", "密码长度必须为6-20个字符");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 检查用户名是否已存在
        if (userDao.existsUsername(username)) {
            request.setAttribute("error", "用户名已被注册，请换一个");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 创建用户对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);  // 注意：实际项目中应该加密密码

        user.setRole(0);  // 普通用户
        user.setStatus(0); // 正常状态

        // 注册用户
        boolean success = userDao.register(user);

        if (success) {
            // 注册成功
            request.setAttribute("success", "注册成功！3秒后跳转到登录页...");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else {
            // 注册失败
            request.setAttribute("error", "注册失败，请稍后重试");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}