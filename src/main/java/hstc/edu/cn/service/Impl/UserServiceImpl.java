package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.UserMapper;
import hstc.edu.cn.po.DormAdmin;
import hstc.edu.cn.po.RegisterCode;
import hstc.edu.cn.po.Student;
import hstc.edu.cn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by win8 on 2017/5/15.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    public DormAdmin getDormAdminByNum(DormAdmin dormAdmin) {
        return userMapper.getDormAdminByNum(dormAdmin);
    }

    public DormAdmin getDormAdminByName(DormAdmin dormAdmin) {
        return userMapper.getDormAdminByName(dormAdmin);
    }

    public DormAdmin getDormAdminByPhone(DormAdmin dormAdmin) {
        return userMapper.getDormAdminByPhone(dormAdmin);
    }

    public Student getStudentByNum(Student student) {
        return userMapper.getStudentByNum(student);
    }

    public void addDormAdmin(DormAdmin dormAdmin) {
        userMapper.addDormAdmin(dormAdmin);
    }

    public RegisterCode getRegisterCode() {
        return userMapper.getRegisterCode();
    }
}
