<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/3/21
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info" style="padding: 15px 5px 5px 15px;">
                <p>${sessionScope.dormAdmin.dormadminName}</p>
                <%--<!-- Status -->--%>
                <%--<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>--%>
            </div>
        </div>

        <!-- search form (Optional) -->
        <%--<form action="#" method="get" class="sidebar-form">--%>
            <%--<div class="input-group">--%>
                <%--<input type="text" name="q" class="form-control" placeholder="搜索后台...">--%>
                <%--<span class="input-group-btn">--%>
                <%--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--%>
                <%--</button>--%>
              <%--</span>--%>
            <%--</div>--%>
        <%--</form>--%>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">功能导航</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="treeview">
                <a href=""><i class="fa fa-link"></i> <span>学生信息管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/Student.jsp">查看学生信息</a></li>
                    <li><a href="/admin/ImportStu.jsp">批量录入学生信息</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>前台通告管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/Report.jsp">查看通告</a></li>
                    <li><a href="/admin/PublishReport.jsp">发布通告</a></li>
                    <li><a href="#">查看留言板</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href=""><i class="fa fa-link"></i> <span>宿舍管理员管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/Admin.jsp">管理员信息管理</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href=""><i class="fa fa-link"></i> <span>报修信息管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#">未审核的申请</a></li>
                    <li><a href="#">已审核的申请</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>综合管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#">区域信息管理</a></li>
                    <li><a href="#">宿舍楼信息管理</a></li>
                    <li><a href="#">宿舍信息管理</a></li>
                    <li><a href="#">床号信息管理</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>系统管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#">友情链接管理</a></li>
                    <li><a href="/admin/RegisterCode.jsp">注册邀请码</a></li>
                    <li><a href="#">刷新系统缓存</a></li>
                    <li><a href="/adminLogout.do">安全退出</a></li>
                </ul>
            </li>


        </ul>
    </section>
