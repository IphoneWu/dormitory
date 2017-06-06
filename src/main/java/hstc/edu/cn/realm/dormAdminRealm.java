package hstc.edu.cn.realm;

import hstc.edu.cn.po.DormAdmin;
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

/**
 * Created by win8 on 2017/5/28.
 */
public class dormAdminRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String dormAdminNum = (String) token.getPrincipal();
        DormAdmin dormAdmin_1= new DormAdmin();
        dormAdmin_1.setDormadminNum(dormAdminNum);
        DormAdmin dormAdmin = userService.getDormAdminByNum(dormAdmin_1);

        if (dormAdmin != null) {
            SecurityUtils.getSubject().getSession().setAttribute("dormAdmin", dormAdmin);
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
                    dormAdmin.getDormadminNum(), dormAdmin.getDormadminPassword(), "MyRealm");
            return authcInfo;
        } else {
            return null;
        }
    }
}
