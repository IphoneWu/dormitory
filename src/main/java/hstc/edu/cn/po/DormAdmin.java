package hstc.edu.cn.po;

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
    private Date dormadminSbirth;
    private String dormadminImage;
    private int buildNum;
    private int adminType;

    public int getBuildNum() {
        return buildNum;
    }

    public void setBuildNum(int buildNum) {
        this.buildNum = buildNum;
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

    public Date getDormadminSbirth() {
        return dormadminSbirth;
    }

    public void setDormadminSbirth(Date dormadminSbirth) {
        this.dormadminSbirth = dormadminSbirth;
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
