<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/1
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        margin: 0 auto;
        padding: 0;
        font-size: 12px;
        text-align: center;
        color: #33322e;
        font-family: "微软雅黑","宋体", Tahoma, sans-serif;
    }
    .logo{
        width: 335px;
        height: 95px;
        float: left;
        background: url("/static/images/logo.jpg");
    }
    .navbar-inverse .navbar-brand {
        color: white;
    }
    .navbar-inverse .navbar-nav>li{
        font-size: 14px;
        padding: 0 5px;
    }


    /*.navbar .nav >li>a:hover{*/
    /*color: #000000;*/
    /*background-color:white ;*/
    /*}*/
    .isearch{
        margin-top: 10px;
        margin-left: 15px;
        display: block;
        width: 100%;
        height: 28px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #d6d6d6;
        background-image: none;
        border: 1px solid #474747;
        border-radius: 20px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        padding-top: 6px;
        padding-right: 12px;
        padding-bottom: 6px;
        padding-left: 12px;
    }

</style>
<nav>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-header">
            <!-- .navbar-toggle样式用于toggle收缩的内容，即nav-collapse collapse样式所在元素 -->
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#mynav">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- 确保无论是宽屏还是窄屏，navbar-brand都显示 -->
            <a href="index.jsp" class="navbar-brand" style="font-size: 20px">韩山师范学院</a>
        </div>
        <!-- 屏幕宽度小于768px时，div.navbar-responsive-collapse容器里的内容都会隐藏，显示icon-bar图标，当点击icon-bar图标时，再展开。屏幕大于768px时，默认显示。 -->
        <div class="colcollapse navbar-collapse navbar-responsive-collapse" id="mynav">
            <ul class="nav navbar-nav" style="padding-left: 150px;">
                <li class="active"><a href="/user/Main.jsp">首页</a></li>
                <li><a href="">查询入口</a></li>
                <li><a href="">申请入口</a></li>
                <li><a href="">保修入口</a></li>
                <li><a href="">通告</a></li>
                <li><input class="isearch" placeholder="搜索本站..." type="text"></li>
                <li>
                    <button class="btn btn-black" type="submit" style="margin-top: 10px;margin-left: 15px;">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </li>
                <li class="dropdown user user-menu" id="loginLi" style="margin-left: 100px;"><!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle pull-right" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="/static/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                            <p style="color:#000000;">
                                ${sessionScope.userName}
                                <small></small>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="" class="btn btn-default btn-flat">修改用户信息</a>
                            </div>
                            <div class="pull-right">
                                <a href="/stulogout.do" class="btn btn-default btn-flat">注销登录</a>
                            </div>
                        </li>
                    </ul>
            </ul>
        </div>
    </div>
</nav>
