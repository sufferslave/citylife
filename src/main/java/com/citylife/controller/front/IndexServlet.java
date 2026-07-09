package com.citylife.controller.front;

import com.citylife.dao.LifeInfoDao;
import com.citylife.entity.LifeInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    private LifeInfoDao lifeInfoDao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 查询审核通过的信息列表，用于首页普通信息展示
        List<LifeInfo> infoList = lifeInfoDao.findApprovedList();

        // 查询最新一条信息，用于首页“最新信息 / 最新消息”板块展示
        LifeInfo latestInfo = lifeInfoDao.findLatestOne();

        List<LifeInfo> latestList = new ArrayList<>();
        if (latestInfo != null) {
            latestList.add(latestInfo);
        }

        // 普通信息列表
        request.setAttribute("infoList", infoList);

        // 最新信息列表，虽然只有一条，但用 List 方便 JSP 使用 for 循环展示
        request.setAttribute("latestInfo", latestList);

        // 转发到首页
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}