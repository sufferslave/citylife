package com.citylife.controller.front;

import com.citylife.dao.LifeInfoDao;
import com.citylife.entity.LifeInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/publish")
public class PublishServlet extends HttpServlet {

    private LifeInfoDao lifeInfoDao = new LifeInfoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/front/publish.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String infoTypeStr = request.getParameter("infoType");
        String infoTitle = request.getParameter("infoTitle");
        String infoLinkman = request.getParameter("infoLinkman");
        String infoPhone = request.getParameter("infoPhone");
        String infoContent = request.getParameter("infoContent");
        String infoEmail = request.getParameter("infoEmail");

        LifeInfo info = new LifeInfo();

        if (infoTypeStr != null && !infoTypeStr.trim().equals("")) {
            info.setInfoType(Integer.parseInt(infoTypeStr));
        }

        info.setInfoTitle(infoTitle);
        info.setInfoLinkman(infoLinkman);
        info.setInfoPhone(infoPhone);
        info.setInfoContent(infoContent);
        info.setInfoEmail(infoEmail);

        // 新发布的信息默认未审核、未付费
        info.setInfoState("0");
        info.setInfoPayfor("0");

        lifeInfoDao.add(info);

        response.sendRedirect(request.getContextPath() + "/index");
    }
}