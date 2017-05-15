package hstc.edu.cn.po;

import java.util.Date;

/**
 * Created by win8 on 2017/5/15.
 */
public class Student {
    private int studentNum;
    private String studentName;
    private int areaNum;
    private int buildNum;
    private int dormNum;
    private int bedNum;
    private String collegeName;
    private String clazzName;
    private Date studentInTime;

    public int getAreaNum() {
        return areaNum;
    }

    public void setAreaNum(int areaNum) {
        this.areaNum = areaNum;
    }

    public int getBedNum() {
        return bedNum;
    }

    public void setBedNum(int bedNum) {
        this.bedNum = bedNum;
    }

    public int getBuildNum() {
        return buildNum;
    }

    public void setBuildNum(int buildNum) {
        this.buildNum = buildNum;
    }

    public String getClazzName() {
        return clazzName;
    }

    public void setClazzName(String clazzName) {
        this.clazzName = clazzName;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public int getDormNum() {
        return dormNum;
    }

    public void setDormNum(int dormNum) {
        this.dormNum = dormNum;
    }

    public Date getStudentInTime() {
        return studentInTime;
    }

    public void setStudentInTime(Date studentInTime) {
        this.studentInTime = studentInTime;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }
}
