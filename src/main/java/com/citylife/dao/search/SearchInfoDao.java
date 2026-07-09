package com.citylife.dao.search;
import com.citylife.entity.search.SearchLifeInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SearchInfoDao {
    private Connection getConn() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/infodb?useSSL=false&serverTimezone=UTC";
            String user = "root";
            String pwd = "Gyt20060428@";
            conn = DriverManager.getConnection(url, user, pwd);
            System.out.println("✅ 数据库连接成功！");
        } catch (Exception e) {
            System.out.println("❌ 数据库连接失败！错误信息：");
            e.printStackTrace();
        }
        return conn;
    }

    public List<SearchLifeInfo> searchByKeyword(String keyword){
        List<SearchLifeInfo> infoList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            // 完全匹配数据库真实字段：tb_info.INFO_TYPE = tb_type.TYPE_SIGN
            String sql = "SELECT l.ID,l.INFO_TYPE,l.INFO_TITLE,l.INFO_LINKMAN,l.INFO_PHONE,l.INFO_EMAIL,l.INFO_CONTENT,l.INFO_DATE,t.TYPE_NAME " +
                    "FROM tb_info l LEFT JOIN tb_type t ON l.INFO_TYPE = t.TYPE_SIGN " +
                    "WHERE l.INFO_TITLE LIKE ? OR l.INFO_LINKMAN LIKE ? OR l.INFO_CONTENT LIKE ?";
            pstmt = conn.prepareStatement(sql);
            String likeWord = "%" + keyword + "%";
            pstmt.setString(1, likeWord);
            pstmt.setString(2, likeWord);
            pstmt.setString(3, likeWord);
            rs = pstmt.executeQuery();

            while(rs.next()){
                SearchLifeInfo info = new SearchLifeInfo();
                info.setId(rs.getInt("ID"));
                info.setCategoryId(rs.getInt("INFO_TYPE"));
                info.setTitle(rs.getString("INFO_TITLE"));
                info.setLinkman(rs.getString("INFO_LINKMAN"));
                info.setPhone(rs.getString("INFO_PHONE"));
                info.setEmail(rs.getString("INFO_EMAIL"));
                info.setContent(rs.getString("INFO_CONTENT"));
                info.setCreateTime(rs.getDate("INFO_DATE"));
                info.setCategoryName(rs.getString("TYPE_NAME"));
                infoList.add(info);
            }
            System.out.println("本次查询匹配数据条数：" + infoList.size());
        } catch (Exception e) {
            System.out.println("数据库查询异常：");
            e.printStackTrace();
        } finally {
            try{if(rs != null) rs.close();}catch (SQLException e){}
            try{if(pstmt != null) pstmt.close();}catch (SQLException e){}
            try{if(conn != null) conn.close();}catch (SQLException e){}
        }
        return infoList;
    }
}