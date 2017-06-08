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
    private String porpertyName;
    private String addrezz;
    private int studentNum;
    private int repairStatus;

    public String getAddrezz() {
        return addrezz;
    }

    public void setAddrezz(String addrezz) {
        this.addrezz = addrezz;
    }

    public String getPorpertyName() {
        return porpertyName;
    }

    public void setPorpertyName(String porpertyName) {
        this.porpertyName = porpertyName;
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
