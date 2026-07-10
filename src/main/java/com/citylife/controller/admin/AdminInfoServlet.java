package com.citylife.controller.admin;

import com.citylife.dao.LifeInfoDao;
import com.citylife.dao.UserDao;
import com.citylife.entity.LifeInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/info-list")
public class AdminInfoServlet extends HttpServlet {

    private final LifeInfoDao dao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
                request.getParameter("keyword");

        List<LifeInfo> infoList;

        if(keyword==null || keyword.trim().isEmpty()){

            infoList = dao.findApprovedList();

        }else{

            infoList = dao.searchInfo(keyword);

        }
        UserDao userDao = new UserDao();

        request.setAttribute("pendingCount", dao.countPending());
        request.setAttribute("publishCount", dao.countPublished());
        request.setAttribute("userCount", userDao.countUser());

        request.setAttribute("infoList",infoList);

        request.getRequestDispatcher("/admin/info-list.jsp")
                .forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        Integer id = Integer.parseInt(request.getParameter("id"));

        if ("delete".equals(action)) {

            dao.delete(id);

        }

        response.sendRedirect(request.getContextPath() + "/admin/info-list");
    }

}