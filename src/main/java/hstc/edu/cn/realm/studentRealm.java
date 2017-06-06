package hstc.edu.cn.realm;


import hstc.edu.cn.po.Student;
import hstc.edu.cn.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;


public class studentRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		String studentNum = (String) token.getPrincipal();
		Student student_1= new Student();
		student_1.setStudentNum(Integer.parseInt(studentNum));
		Student student = userService.getStudentByNum(student_1);

		if (student != null) {
			SecurityUtils.getSubject().getSession().setAttribute("student", student);
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
					student.getStudentNum(), student.getStudentName(), "MyRealm");
			return authcInfo;
		} else {
			return null;
		}

	}

}
