package com.citylife.test;

import com.citylife.util.DBUtil;

public class TestDB {
    public static void main(String[] args) {
        boolean result = DBUtil.testConnection();

        if (result) {
            System.out.println("数据库连接成功！");
        } else {
            System.out.println("数据库连接失败！");
        }
    }
}