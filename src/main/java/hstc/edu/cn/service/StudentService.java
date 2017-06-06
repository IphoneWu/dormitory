package hstc.edu.cn.service;

import hstc.edu.cn.po.Student;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/1.
 */
public interface StudentService {
    public List<Student> getStudent(Map<String,Object> map);
    public long getStuTotal(Map<String,Object> map);
    public List<Student> searchStu(Map<String,Object>map);
    public long getStuSearchAll(Map<String,Object>map);
    public void deleteStu(Integer[] position);
    public Student getModifyStu(int studentNum);
    public void modifyStu(Student student);
    public boolean batchImport(String name,MultipartFile file, File file1);
}
