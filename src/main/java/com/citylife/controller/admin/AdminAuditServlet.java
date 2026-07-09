package com.citylife.controller.admin;

import com.citylife.dao.LifeInfoDao;
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

        List<LifeInfo> auditList = dao.findAuditList();

        request.setAttribute("auditList", auditList);

        request.getRequestDispatcher("/admin/audit.jsp")
                .forward(request,response);

    }

}