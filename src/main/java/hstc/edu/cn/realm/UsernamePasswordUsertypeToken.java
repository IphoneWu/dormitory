package hstc.edu.cn.realm;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Created by win8 on 2017/5/29.
 */
public class UsernamePasswordUsertypeToken extends UsernamePasswordToken {

    private static final long serialVersionUID = 1L;
    private String usertype ;

    public String getUsertype() {
        return usertype;
    }
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public UsernamePasswordUsertypeToken(String loginName, String password, String usertype) {

        super(loginName, password);

        this.usertype = usertype;

    }
}
