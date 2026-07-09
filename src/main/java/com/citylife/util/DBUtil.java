package com.citylife.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库工具类
 */
public class DBUtil {

    private static String driver;
    private static String url;
    private static String username;
    private static String password;

    // 静态代码块，加载数据库配置
    static {
        try {
            // 加载配置文件
            Properties props = new Properties();
            InputStream in = DBUtil.class.getClassLoader()
                    .getResourceAsStream("jdbc.properties");
            props.load(in);

            driver = props.getProperty("jdbc.driver");
            url = props.getProperty("jdbc.url");
            username = props.getProperty("jdbc.username");
            password = props.getProperty("jdbc.password");

            // 加载驱动
            Class.forName(driver);

            System.out.println("数据库驱动加载成功：" + driver);
        } catch (Exception e) {
            System.err.println("数据库配置加载失败：" + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库连接
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    /**
     * 关闭资源
     */
    public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 关闭资源（无 ResultSet）
     */
    public static void close(Connection conn, PreparedStatement ps) {
        close(conn, ps, null);
    }

    /**
     * 测试数据库连接
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            System.err.println("数据库连接测试失败：" + e.getMessage());
            return false;
        }
    }
}