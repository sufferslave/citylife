package com.citylife.dao;

import com.citylife.entity.InfoType;
import com.citylife.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {

    public List<InfoType> findAll() {
        List<InfoType> list = new ArrayList<>();
        String sql = "SELECT * FROM tb_type ORDER BY TYPE_SIGN ASC";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                InfoType type = new InfoType();
                type.setTypeSign(rs.getInt("TYPE_SIGN"));
                type.setTypeName(rs.getString("TYPE_NAME"));
                type.setTypeIntro(rs.getString("TYPE_INTRO"));
                list.add(type);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}