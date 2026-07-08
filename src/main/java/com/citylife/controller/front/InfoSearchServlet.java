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

@WebServlet("/search")
public class InfoSearchServlet extends HttpServlet {

    private LifeInfoDao lifeInfoDao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        List<LifeInfo> infoList = lifeInfoDao.search(keyword);

        request.setAttribute("keyword", keyword);
        request.setAttribute("infoList", infoList);
        request.getRequestDispatcher("/front/search.jsp").forward(request, response);
    }
}