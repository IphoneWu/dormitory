package hstc.edu.cn.po;

import java.util.Date;

/**
 * Created by win8 on 2017/5/15.
 */
public class Repair {
    private int repairNum;
    private Date submitTime;
    private Date resolveTime;
    private String repairReason;
    private int porpertyNum;
    private int dormNum;
    private int studentNum;
    private int repairStatus;

    public int getDormNum() {
        return dormNum;
    }

    public void setDormNum(int dormNum) {
        this.dormNum = dormNum;
    }

    public int getPorpertyNum() {
        return porpertyNum;
    }

    public void setPorpertyNum(int porpertyNum) {
        this.porpertyNum = porpertyNum;
    }

    public int getRepairNum() {
        return repairNum;
    }

    public void setRepairNum(int repairNum) {
        this.repairNum = repairNum;
    }

    public String getRepairReason() {
        return repairReason;
    }

    public void setRepairReason(String repairReason) {
        this.repairReason = repairReason;
    }

    public int getRepairStatus() {
        return repairStatus;
    }

    public void setRepairStatus(int repairStatus) {
        this.repairStatus = repairStatus;
    }

    public Date getResolveTime() {
        return resolveTime;
    }

    public void setResolveTime(Date resolveTime) {
        this.resolveTime = resolveTime;
    }

    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }
}
