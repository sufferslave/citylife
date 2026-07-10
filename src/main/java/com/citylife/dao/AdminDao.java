package com.citylife.dao;

import com.citylife.entity.Admin;
import com.citylife.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {

    public Admin findByUsername(String username) {
        Admin admin = null;

        String sql = "select * from tb_user where USER_NAME = ?";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            System.out.println("正在查询管理员账号：" + username);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("数据库中查到了账号：" + rs.getString("USER_NAME"));
                System.out.println("数据库中的密码：" + rs.getString("USER_PASSWORD"));
                System.out.println("数据库中的角色：" + rs.getInt("USER_TYPE"));

                admin = new Admin();
                admin.setId(rs.getInt("ID"));
                admin.setUsername(rs.getString("USER_NAME"));
                admin.setPassword(rs.getString("USER_PASSWORD"));
            } else {
                System.out.println("数据库中没有查到账号：" + username);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}