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
        // 原有查询全部列表代码 完整保留，不删除
        List<LifeInfo> infoList = lifeInfoDao.findApprovedList();

        // ========== 新增代码：使用新增Dao接口，单独获取最新一条 ==========
        LifeInfo latestInfo = lifeInfoDao.findLatestOne();
        List<LifeInfo> latestList = new ArrayList<>();
        if(latestInfo != null){
            latestList.add(latestInfo);
        }
        // 把最新单条数据单独传给页面，供「最新消息板块」渲染
        request.setAttribute("latestInfo", latestList);

        // 原有列表继续传递，页面其他板块可正常使用，互不冲突
        request.setAttribute("infoList", infoList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}