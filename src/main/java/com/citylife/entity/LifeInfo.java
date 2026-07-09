package com.citylife.entity;

import java.util.Date;

public class LifeInfo {

    private Integer id;
    private Integer infoType;
    private String infoTitle;
    private String infoLinkman;
    private String infoPhone;
    private Date infoDate;
    private String infoState;
    private String infoContent;
    private String infoEmail;
    private String infoPayfor;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInfoType() {
        return infoType;
    }

    public void setInfoType(Integer infoType) {
        this.infoType = infoType;
    }

    public String getInfoTitle() {
        return infoTitle;
    }

    public void setInfoTitle(String infoTitle) {
        this.infoTitle = infoTitle;
    }

    public String getInfoLinkman() {
        return infoLinkman;
    }

    public void setInfoLinkman(String infoLinkman) {
        this.infoLinkman = infoLinkman;
    }

    public String getInfoPhone() {
        return infoPhone;
    }

    public void setInfoPhone(String infoPhone) {
        this.infoPhone = infoPhone;
    }

    public Date getInfoDate() {
        return infoDate;
    }

    public void setInfoDate(Date infoDate) {
        this.infoDate = infoDate;
    }

    public String getInfoState() {
        return infoState;
    }

    public void setInfoState(String infoState) {
        this.infoState = infoState;
    }

    public String getInfoContent() {
        return infoContent;
    }

    public void setInfoContent(String infoContent) {
        this.infoContent = infoContent;
    }

    public String getInfoEmail() {
        return infoEmail;
    }

    public void setInfoEmail(String infoEmail) {
        this.infoEmail = infoEmail;
    }

    public String getInfoPayfor() {
        return infoPayfor;
    }

    public void setInfoPayfor(String infoPayfor) {
        this.infoPayfor = infoPayfor;
    }

    /**
     * 下面这些方法是为了兼容 JSP 页面里的写法：
     * info.getTitle()
     * info.getLinkman()
     * info.getPhone()
     * info.getEmail()
     * info.getContent()
     * info.getCreateTime()
     */
    public String getTitle() {
        return infoTitle;
    }

    public String getLinkman() {
        return infoLinkman;
    }

    public String getPhone() {
        return infoPhone;
    }

    public String getEmail() {
        return infoEmail;
    }

    public String getContent() {
        return infoContent;
    }

    public Date getCreateTime() {
        return infoDate;
    }
}