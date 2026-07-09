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

// 访问路径绑定 /category
@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        // 获取url参数 type分类编号 id当前信息id
        String typeParam = request.getParameter("type");
        String idParam = request.getParameter("id");
        int type = Integer.parseInt(typeParam);
        int targetId = 0;
        if(idParam != null && !idParam.trim().isEmpty()){
            targetId = Integer.parseInt(idParam);
        }

        LifeInfoDao dao = new LifeInfoDao();
        // 查询该分类所有已审核信息
        List<LifeInfo> allList = dao.findByCategoryId(type);
        request.setAttribute("infoList", allList);

        int currIndex = 0;
        LifeInfo currInfo = null;
        // 根据id匹配当前展示数据，同时记录下标
        if(targetId > 0){
            for(int i = 0; i < allList.size(); i++){
                LifeInfo item = allList.get(i);
                if(item.getId() == targetId && item.getInfoType() == type){
                    currInfo = item;
                    currIndex = i;
                    break;
                }
            }
        }
        // 无id或id非法，默认展示第一条
        if(currInfo == null && allList.size() > 0){
            currInfo = allList.get(0);
            currIndex = 0;
        }
        // 传递数据到页面
        request.setAttribute("currInfo", currInfo);
        request.setAttribute("currIndex", currIndex);

        // 转发到分类页面（必须有，否则空白页面）
        request.getRequestDispatcher("/front/list.jsp").forward(request,response);
    }
}