package hstc.edu.cn.po;

/**
 * Created by win8 on 2017/5/15.
 */
public class DormAdmin {
    private int dormadminId;
    private String dormadminName;
    private String dormadminPassword;
    private int areaNum;

    public int getAreaNum() {
        return areaNum;
    }

    public void setAreaNum(int areaNum) {
        this.areaNum = areaNum;
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
}
