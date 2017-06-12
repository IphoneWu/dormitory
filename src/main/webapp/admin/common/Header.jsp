<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/3/21
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Logo -->
<a href="" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b>A</b>dmin</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg">宿舍后台管理</span>
</a>
<!-- Header Navbar -->
<nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
    </a>
    <!-- Navbar Right Menu -->
    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <!-- 用户头像 -->
            <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <!-- The user image in the navbar-->
                    <img src="${sessionScope.dormAdmin.dormadminImage}" class="user-image" alt="User Image">
                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                    <span class="hidden-xs"></span>
                </a>
                <ul class="dropdown-menu">
                    <!-- The user image in the menu -->
                    <li class="user-header">
                            <img src="${sessionScope.dormAdmin.dormadminImage}" class="img-circle" alt="Avatar">
                        <p>
                            ${sessionScope.dormAdmin.dormadminName}
                            <small>
                            </small>
                        </p>
                    </li>
                    <!-- Menu Footer-->
                    <li class="user-footer">
                        <div class="pull-left">
                            <a href="/getModifyProfitById.do?dormadminId=${sessionScope.dormAdmin.dormadminId}" class="btn btn-default btn-flat">修改用户信息</a>
                        </div>
                        <div class="pull-right">
                            <a href="/admin/Portrait.jsp" class="btn btn-default btn-flat">修改头像</a>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

</nav>