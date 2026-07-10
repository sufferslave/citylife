package com.citylife.controller.admin;

import com.citylife.dao.AdminDao;
import com.citylife.entity.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private final AdminDao adminDao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 展示管理员登录页面
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 关键修改：先去掉前后空格
        if (username != null) {
            username = username.trim();
        }
        if (password != null) {
            password = password.trim();
        }

        if (username == null || username.equals("")) {
            request.setAttribute("error", "管理员账号不能为空");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        if (password == null || password.equals("")) {
            request.setAttribute("error", "管理员密码不能为空");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        // 1. 先查账号是否存在
        Admin admin = adminDao.findByUsername(username);

        if (admin == null) {
            request.setAttribute("error", "管理员账号不存在");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        // 2. 再判断密码是否正确
        if (!password.equals(admin.getPassword())) {
            request.setAttribute("error", "管理员密码错误");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        // 3. 登录成功，把管理员对象放入 session
        request.getSession().setAttribute("admin", admin);

        // 4. 跳转到后台管理页面
        response.sendRedirect(request.getContextPath() + "/admin/index");
    }
}