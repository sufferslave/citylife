package com.citylife.service.search;
import com.citylife.dao.search.SearchInfoDao;
import com.citylife.entity.search.SearchLifeInfo;
import java.util.List;

public class SearchInfoService {
    private final SearchInfoDao dao = new SearchInfoDao();

    // 删除构造方法里 dao.getConn(); 这一行，不再直接调用私有方法
    public List<SearchLifeInfo> searchInfo(String keyword){
        return dao.searchByKeyword(keyword);
    }
}