package com.citylife.controller.front;

import com.citylife.dao.LifeInfoDao;
import com.citylife.entity.LifeInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {

    private LifeInfoDao lifeInfoDao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeStr = request.getParameter("type");

        List<LifeInfo> infoList;

        if (typeStr == null || typeStr.trim().equals("")) {
            infoList = lifeInfoDao.findApprovedList();
        } else {
            Integer type = Integer.parseInt(typeStr);
            infoList = lifeInfoDao.findByCategoryId(type);
        }

        request.setAttribute("infoList", infoList);
        request.getRequestDispatcher("/front/list.jsp").forward(request, response);
    }
}