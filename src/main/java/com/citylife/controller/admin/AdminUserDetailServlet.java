package com.citylife.controller.admin;

import com.citylife.dao.LifeInfoDao;
import com.citylife.dao.UserDao;
import com.citylife.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/user-detail")
public class AdminUserDetailServlet extends HttpServlet {

    private UserDao dao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Integer id = Integer.parseInt(request.getParameter("id"));

        User user = dao.findById(id);
        UserDao userDao = new UserDao();
        LifeInfoDao infoDao = new LifeInfoDao();

        request.setAttribute("pendingCount", infoDao.countPending());
        request.setAttribute("publishCount", infoDao.countPublished());
        request.setAttribute("userCount", userDao.countUser());

        request.setAttribute("user", user);

        request.getRequestDispatcher("/admin/user-detail.jsp")
                .forward(request, response);
    }
}