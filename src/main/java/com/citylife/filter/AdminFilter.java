package com.citylife.filter;

import com.citylife.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * 管理员权限过滤器
 * 只允许管理员访问 /admin/* 路径
 */
@WebFilter(filterName = "AdminFilter", urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AdminFilter 初始化");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String uri = request.getRequestURI();
        System.out.println("AdminFilter 拦截: " + uri);

        // 检查是否登录且是管理员
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // 未登录，跳转到登录页
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!user.isAdmin()) {
            // 不是管理员，返回403
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "需要管理员权限");
            return;
        }

        // 是管理员，继续请求
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("AdminFilter 销毁");
    }
}