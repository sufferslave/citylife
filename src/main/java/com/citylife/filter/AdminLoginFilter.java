package com.citylife.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/admin/*")
public class AdminLoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String uri = request.getRequestURI();

        // 允许访问管理员登录页面和登录请求
        if (uri.endsWith("/admin/login")) {
            chain.doFilter(request, response);
            return;
        }

        // 如果 admin 目录下后续有 css/js/images，也放行静态资源
        if (uri.endsWith(".css")
                || uri.endsWith(".js")
                || uri.endsWith(".png")
                || uri.endsWith(".jpg")
                || uri.endsWith(".jpeg")
                || uri.endsWith(".gif")) {
            chain.doFilter(request, response);
            return;
        }

        Object admin = request.getSession().getAttribute("admin");

        if (admin == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        chain.doFilter(request, response);
    }
}