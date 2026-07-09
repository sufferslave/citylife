package com.citylife.entity;

public class User {

    private Integer id;
    private String username;
    private String password;

    /**
     * 对应 tb_user.USER_TYPE
     */
    private Integer role;

    /**
     * 对应 tb_user.USER_STATE
     */
    private Integer status;

    /**
     * 对应 tb_user.CITY_ID
     */
    private Integer cityId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public boolean isAdmin() {
        return role != null && role == 1;
    }
}