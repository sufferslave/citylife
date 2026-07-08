package com.citylife.controller.front;

import com.citylife.dao.LifeInfoDao;
import com.citylife.entity.LifeInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/detail")
public class InfoDetailServlet extends HttpServlet {

    private LifeInfoDao lifeInfoDao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.trim().equals("")) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

        Integer id = Integer.parseInt(idStr);
        LifeInfo info = lifeInfoDao.findById(id);

        request.setAttribute("info", info);
        request.getRequestDispatcher("/front/detail.jsp").forward(request, response);
    }
}