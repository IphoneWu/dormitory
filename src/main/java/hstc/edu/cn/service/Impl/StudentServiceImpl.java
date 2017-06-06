package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.StudentMapper;
import hstc.edu.cn.po.Student;
import hstc.edu.cn.service.StudentService;
import hstc.edu.cn.util.ReadExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/1.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentMapper studentMapper;
    public List<Student> getStudent(Map<String, Object> map) {
        return studentMapper.getStudent(map);
    }

    public long getStuTotal(Map<String, Object> map) {
        return studentMapper.getStuTotal(map);
    }

    public List<Student> searchStu(Map<String, Object> map) {
        return studentMapper.searchStu(map);
    }

    public long getStuSearchAll(Map<String, Object> map) {
        return studentMapper.getStuSearchAll(map);
    }

    public void deleteStu(Integer[] position) {
        studentMapper.deleteStu(position);
    }

    public Student getModifyStu(int studentNum) {
        return studentMapper.getModifyStu(studentNum);
    }

    public void modifyStu(Student student) {
        studentMapper.modifyStu(student);
    }

    public boolean batchImport(String name, MultipartFile file, File file1) {
        boolean b = false;
        //创建处理EXCEL
        ReadExcel readExcel=new ReadExcel();
        //解析excel，获取客户信息集合。
        List<Student> studentList = readExcel.getExcelInfo(name ,file,file1);

        if(studentList != null){
            b = true;
        }

        //迭代添加客户信息（注：实际上这里也可以直接将studentList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
        for(Student student:studentList){
            studentMapper.addStudents(student);
//            System.out.println(student.getStudentNum());
        }
        return b;
    }

}
