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

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    private LifeInfoDao lifeInfoDao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<LifeInfo> infoList = lifeInfoDao.findApprovedList();
        request.setAttribute("infoList", infoList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}