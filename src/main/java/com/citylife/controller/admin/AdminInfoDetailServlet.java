package com.citylife.controller.admin;

import com.citylife.dao.LifeInfoDao;
import com.citylife.dao.UserDao;
import com.citylife.entity.LifeInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/info-detail")
public class AdminInfoDetailServlet
        extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Integer id =
                Integer.parseInt(
                        request.getParameter("id"));

        LifeInfoDao dao =
                new LifeInfoDao();

        LifeInfo info =
                dao.findById(id);
        UserDao userDao = new UserDao();

        request.setAttribute("pendingCount", dao.countPending());
        request.setAttribute("publishCount", dao.countPublished());
        request.setAttribute("userCount", userDao.countUser());

        request.setAttribute("info",info);

        request.getRequestDispatcher(
                        "/admin/info-detail.jsp")
                .forward(request,response);

    }

}