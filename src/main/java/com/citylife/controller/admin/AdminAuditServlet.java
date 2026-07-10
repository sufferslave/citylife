package com.citylife.controller.admin;

import com.citylife.dao.LifeInfoDao;
import com.citylife.dao.UserDao;
import com.citylife.entity.LifeInfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/audit")
public class AdminAuditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        LifeInfoDao dao = new LifeInfoDao();
        UserDao userDao = new UserDao();

        String keyword =
                request.getParameter("keyword");

        List<LifeInfo> auditList;

        if(keyword==null || keyword.trim().isEmpty()){

            auditList = dao.findAuditList();

        }else{

            auditList = dao.searchAudit(keyword);

        }

        request.setAttribute("pendingCount", dao.countPending());

        request.setAttribute("publishCount", dao.countPublished());

        request.setAttribute("userCount", userDao.countUser());

        request.setAttribute("auditList", auditList);

        request.getRequestDispatcher("/admin/audit.jsp")
                .forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Integer id =
                Integer.parseInt(request.getParameter("id"));

        String action =
                request.getParameter("action");

        LifeInfoDao dao = new LifeInfoDao();

        if("pass".equals(action)){

            dao.pass(id);

        }else if("reject".equals(action)){

            dao.reject(id);

        }

        response.sendRedirect(
                request.getContextPath()+"/admin/audit"
        );

    }

}