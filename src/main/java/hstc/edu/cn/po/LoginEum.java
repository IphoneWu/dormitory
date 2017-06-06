package hstc.edu.cn.po;

/**
 * Created by win8 on 2017/5/28.
 */

/**
 * 用于分别前台用户和后台管理员
 */
public enum  LoginEum {

    STUDENT("1"),DORMADMIN("2");

    private String type;

    private LoginEum(String type){
        this.type = type;
    }
    @Override
    public  String toString(){
        return this.type.toString();
    }
}
