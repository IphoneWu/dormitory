package hstc.edu.cn.mapper;

import hstc.edu.cn.po.Student;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/1.
 */
public interface StudentMapper {
//    获取所有学生信息
    public List<Student> getStudent(Map<String,Object> map);
//    获取总条数
    public long getStuTotal(Map<String,Object> map);
//    搜索学生信息
    public List<Student> searchStu(Map<String,Object>map);
//    获取总搜索条数
    public long getStuSearchAll(Map<String,Object>map);
//    批量删除学生信息
    public void deleteStu(Integer[] position);
//    获取单个学生信息
    public Student getModifyStu(int studentNum);
//    修改学生信息
    public void modifyStu(Student student);
//    批量导入学生信息
    public void addStudents(Student student);
}
