package com.citylife.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * 登录过滤器
 * 只拦截需要登录才能访问的页面（发布、修改、删除等操作）
 * 不拦截首页浏览功能
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = {
        "/publish/*",      // 发布相关
        "/user/*",         // 用户操作相关
        "/post/edit/*",    // 编辑帖子
        "/post/delete/*",  // 删除帖子
        "/favorite/*"      // 收藏相关
})
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("LoginFilter 初始化 - 只拦截需要登录的操作");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // 获取请求路径
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();

        System.out.println("LoginFilter 拦截: " + uri);

        // 检查是否登录
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (!isLoggedIn) {
            // 未登录，跳转到登录页，并记录返回地址
            String returnUrl = uri.substring(contextPath.length());
            String queryString = request.getQueryString();
            if (queryString != null) {
                returnUrl += "?" + queryString;
            }

            System.out.println("用户未登录，跳转到登录页，返回地址: " + returnUrl);
            response.sendRedirect(contextPath + "/login?returnUrl=" + returnUrl);
            return;
        }

        // 已登录，继续请求
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("LoginFilter 销毁");
    }
}