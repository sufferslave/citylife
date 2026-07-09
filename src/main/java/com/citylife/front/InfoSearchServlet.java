package com.citylife.front;
import com.citylife.entity.search.SearchLifeInfo;
import com.citylife.service.search.SearchInfoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/infoSearch")
public class InfoSearchServlet extends HttpServlet {
    private final SearchInfoService searchInfoService = new SearchInfoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String keyword = request.getParameter("keyword");
        List<SearchLifeInfo> infoList = searchInfoService.searchInfo(keyword);

        request.setAttribute("keyword", keyword);
        request.setAttribute("infoList", infoList);
        // 转发路径：webapp/front/search.jsp
        request.getRequestDispatcher("/front/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}