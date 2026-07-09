package com.citylife.controller.front;

import com.citylife.dao.UserDao;
import com.citylife.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 如果已经登录，跳转到首页
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/front/index.jsp");
            return;
        }

        // 显示登录页面
        request.getRequestDispatcher("/login.jsp").forward(request, response);
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
        String roleStr = request.getParameter("role");

        // 验证参数
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "用户名和密码不能为空");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        int role = 0;
        try {
            role = Integer.parseInt(roleStr);
        } catch (NumberFormatException e) {
            role = 0;
        }

        // 从数据库验证用户
        User user = userDao.login(username, password, role);

        if (user != null) {
            // 登录成功，存入session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", user.getRole());

            System.out.println("用户登录成功：" + user.getUsername() + " (role=" + user.getRole() + ")");

            // 根据角色跳转
            if (user.isAdmin()) {
                // 管理员跳转到后台
                response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
            } else {
                // 普通用户跳转到首页或返回页面
                String returnUrl = request.getParameter("returnUrl");
                if (returnUrl != null && !returnUrl.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + returnUrl);
                } else {
                    response.sendRedirect(request.getContextPath() + "/front/index.jsp");
                }
            }
        } else {
            // 登录失败
            System.out.println("登录失败：用户名或密码错误 (username=" + username + ", role=" + role + ")");
            request.setAttribute("error", "用户名、密码或角色不正确");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}