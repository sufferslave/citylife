package com.citylife.controller.admin;

import com.citylife.dao.LifeInfoDao;
import com.citylife.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/user-list")
public class AdminUserServlet extends HttpServlet {

    private UserDao dao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {

            request.setAttribute("userList", dao.findAll());

        } else {

            request.setAttribute("userList", dao.search(keyword.trim()));

        }
        LifeInfoDao infoDao = new LifeInfoDao();

        request.setAttribute("pendingCount", infoDao.countPending());
        request.setAttribute("publishCount", infoDao.countPublished());
        request.setAttribute("userCount", dao.countUser());

        request.getRequestDispatcher("/admin/user-list.jsp")
                .forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        Integer id = Integer.parseInt(request.getParameter("id"));

        switch(action){

            case "disable":
                dao.disable(id);
                break;

            case "enable":
                dao.enable(id);
                break;

            case "delete":
                dao.delete(id);
                break;
        }

        response.sendRedirect(request.getContextPath()+"/admin/user-list");



    }

}
