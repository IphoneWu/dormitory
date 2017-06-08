package hstc.edu.cn.po;

import hstc.edu.cn.util.DateUtil;

import java.util.Date;

/**
 * Created by win8 on 2017/5/15.
 */
public class DormAdmin {
    private int dormadminId;
    private String dormadminNum;
    private String dormadminName;
    private String dormadminPassword;
    private String dormadminPhone;
    private String dormadminSex;
    private String dormadminSbirth;
    private String dormadminImage;
    private String adminAddrezz;
    private int adminType;

    public String getAdminAddrezz() {
        return adminAddrezz;
    }

    public void setAdminAddrezz(String adminAddrezz) {
        this.adminAddrezz = adminAddrezz;
    }

    public int getDormadminId() {
        return dormadminId;
    }

    public void setDormadminId(int dormadminId) {
        this.dormadminId = dormadminId;
    }

    public String getDormadminName() {
        return dormadminName;
    }

    public void setDormadminName(String dormadminName) {
        this.dormadminName = dormadminName;
    }

    public String getDormadminPassword() {
        return dormadminPassword;
    }

    public void setDormadminPassword(String dormadminPassword) {
        this.dormadminPassword = dormadminPassword;
    }

    public String getDormadminImage() {
        return dormadminImage;
    }

    public void setDormadminImage(String dormadminImage) {
        this.dormadminImage = dormadminImage;
    }

    public String getDormadminSbirth() {
        return dormadminSbirth;
    }

    public void setDormadminSbirth(Date dormadminSbirth) {
        this.dormadminSbirth = DateUtil.formatDate(dormadminSbirth,"yyyy-MM-dd");
    }

    public String getDormadminSex() {
        return dormadminSex;
    }

    public void setDormadminSex(String dormadminSex) {
        this.dormadminSex = dormadminSex;
    }

    public int getAdminType() {
        return adminType;
    }

    public void setAdminType(int adminType) {
        this.adminType = adminType;
    }

    public String getDormadminPhone() {
        return dormadminPhone;
    }

    public void setDormadminPhone(String dormadminPhone) {
        this.dormadminPhone = dormadminPhone;
    }

    public String getDormadminNum() {
        return dormadminNum;
    }

    public void setDormadminNum(String dormadminNum) {
        this.dormadminNum = dormadminNum;
    }
}
