package com.citylife.dao;

import com.citylife.entity.User;
import com.citylife.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户数据访问对象
 */
public class UserDao {

    /**
     * 根据用户名查询用户
     */
    public User findByUsername(String username) {
        String sql = "SELECT * FROM tb_user WHERE USER_NAME = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                return extractUser(rs);
            }
        } catch (SQLException e) {
            System.err.println("查询用户失败：" + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        return null;
    }

    /**
     * 用户登录验证
     *
     * USER_TYPE：用户类型
     * USER_STATE：用户状态
     */
    public User login(String username, String password, int userType) {
        String sql = "SELECT * FROM tb_user "
                + "WHERE USER_NAME = ? "
                + "AND USER_PASSWORD = ? "
                + "AND USER_TYPE = ? "
                + "AND USER_STATE = 0";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, userType);
            rs = ps.executeQuery();

            if (rs.next()) {
                return extractUser(rs);
            }
        } catch (SQLException e) {
            System.err.println("登录验证失败：" + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        return null;
    }

    /**
     * 注册新用户
     */
    public boolean register(User user) {
        String sql = "INSERT INTO tb_user (USER_NAME, USER_PASSWORD, USER_TYPE, USER_STATE, CITY_ID) "
                + "VALUES (?, ?, 0, 0, ?)";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            if (user.getCityId() == null) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, user.getCityId());
            }

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("注册用户失败：" + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.close(conn, ps);
        }
    }

    /**
     * 检查用户名是否存在
     */
    public boolean existsUsername(String username) {
        String sql = "SELECT COUNT(*) FROM tb_user WHERE USER_NAME = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.err.println("检查用户名失败：" + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        return false;
    }

    /**
     * 从 ResultSet 提取 User 对象
     */
    private User extractUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("ID"));
        user.setUsername(rs.getString("USER_NAME"));
        user.setPassword(rs.getString("USER_PASSWORD"));
        user.setRole(rs.getInt("USER_TYPE"));
        user.setStatus(rs.getInt("USER_STATE"));
        user.setCityId(rs.getInt("CITY_ID"));

        if (rs.wasNull()) {
            user.setCityId(null);
        }

        return user;
    }

    public List<User> findAll() {

        List<User> list = new ArrayList<>();

        String sql = "SELECT * FROM tb_user where USER_TYPE=0 ORDER BY ID ";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {
                list.add(extractUser(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public User findById(Integer id){

        String sql="SELECT * FROM tb_user WHERE ID=?";

        try(
                Connection conn=DBUtil.getConnection();
                PreparedStatement ps=conn.prepareStatement(sql)
        ){

            ps.setInt(1,id);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                return extractUser(rs);

            }

        }catch(SQLException e){

            e.printStackTrace();

        }

        return null;

    }

    public int delete(Integer id){

        String sql="DELETE FROM tb_user WHERE ID=?";

        try(
                Connection conn=DBUtil.getConnection();
                PreparedStatement ps=conn.prepareStatement(sql)
        ){

            ps.setInt(1,id);

            return ps.executeUpdate();

        }catch(SQLException e){

            e.printStackTrace();

        }

        return 0;

    }

    public int disable(Integer id) {

        String sql = "UPDATE tb_user SET USER_STATE = 1 WHERE ID = ?";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int enable(Integer id) {

        String sql = "UPDATE tb_user SET USER_STATE = 0 WHERE ID = ?";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public List<User> search(String username) {

        List<User> list = new ArrayList<>();

        String sql = "SELECT * FROM tb_user "
                + "WHERE USER_TYPE = 0 "
                + "AND USER_NAME LIKE ? "
                + "ORDER BY ID ";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, "%" + username + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(extractUser(rs));
            }

            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int countUser() {

        String sql = "SELECT COUNT(*) FROM tb_user WHERE USER_TYPE=0";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}