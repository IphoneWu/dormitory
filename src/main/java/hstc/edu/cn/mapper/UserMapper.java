package hstc.edu.cn.mapper;

import hstc.edu.cn.po.DormAdmin;
import hstc.edu.cn.po.Student;

/**
 * Created by win8 on 2017/5/15.
 */
public interface UserMapper {
    public DormAdmin getDormAdminByNum(DormAdmin dormAdmin);

    public DormAdmin getDormAdminByName(DormAdmin dormAdmin);
    public DormAdmin getDormAdminByPhone(DormAdmin dormAdmin);
    public Student getStudentByNum(Student student);
    public void addDormAdmin(DormAdmin dormAdmin);
}
