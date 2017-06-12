<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/9
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/static/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/static/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/static/plugins/jQuery-confirm/xcConfirm.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <jsp:include page="common/Header.jsp"/>
    </header>
    <aside class="main-sidebar">
        <jsp:include page="common/SideBar.jsp"/>
    </aside>
    <div class="content-wrapper" style="min-height: 915px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                个人信息表
                <small>${dormAdmin.dormadminName}的信息</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-header">
                            <h3 class="box-title">修改信息</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-12 table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <form  id="modifyProfit"  method="post" >
                                                <tr>
                                                    <td width="10%">员工号</td>
                                                    <td>
                                                        <input type="hidden" id="dormadminId" name="dormadminId" value="${dormAdmin.dormadminId}">
                                                        <input  type="text" id="dormadminNum" name="dormadminNum" value="${dormAdmin.dormadminNum}" readonly>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">姓名</td>
                                                    <td>
                                                        <input  type="text" id="dormadminName" name="dormadminName" value="${dormAdmin.dormadminName}" onblur="checkadminName()">
                                                        <span id="adminNameError" style="color: red;"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">密码</td>
                                                    <td>
                                                        <input  type="password" id="dormadminPassword_1" name="dormadminPassword" value="${dormAdmin.dormadminPassword}" onblur="checkpassword()">
                                                        <span id="adminPasswordError" style="color: red;"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">确认密码</td>
                                                    <td>
                                                        <input  type="password" id="dormadminPassword_2" name="dormadminPassword" value="${dormAdmin.dormadminPassword}" onblur="checkpasswordEqual()">
                                                        <span id="enqualTo" style="color: red;"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">电话号码</td>
                                                    <td>
                                                        <input  type="text" id="dormadminPhone" name="dormadminPhone" value="${dormAdmin.dormadminPhone}" onblur="checkadminPhone()">
                                                        <span id="adminPhoneError" style="color: red;"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">性别</td>
                                                    <td>
                                                        <input type="radio" name="dormadminSex" value="男" checked/> 男
                                                        <input type="radio" name="dormadminSex" value="女"/> 女
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="10%">出生日期</td>
                                                    <td>
                                                        <input type="text" name="dormadminSbirth" value="${dormAdmin.dormadminSbirth}">
                                                    </td>
                                                </tr>
                                            </form>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <button id="submitId" type="submit" class="btn btn-primary" type="button" onclick="submitProfit()" >保存</button> &nbsp;&nbsp;
                                                    <button type="button" class="btn btn-success" name="backid" id="backid" onclick="backtoAdminJsp()">返回</button>
                                                </td>
                                            </tr>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5">
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                                                <ul id="list" class="pagination">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <footer class="main-footer">
        <jsp:include page="common/Footer.jsp"/>
    </footer>
</div>
<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>

<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/static/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/static/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="/static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/static/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/app.min.js"></script>
<script type="text/javascript" src="/static/plugins/jQuery-confirm/xcConfirm.js"></script>
<!--这个js用来格式化日期的-->
<script src="/static/dist/js/DateUtil.js"></script>

<script>
    $(document).ready(function() {
        var type = ${sessionScope.dormAdmin.adminType};
        if(type==1){
            $("#m1").show();
            $("#m2").show();
            $("#m3").show();
        }else{
            $("#m1").hide();
            $("#m2").hide();
            $("#m3").hide();
        }
    });
    function checkadminName() {
        $("#adminNameError").html("");
        if($("#dormadminName").val() == ''){
            $("#adminNameError").html("用户名不能为空");
            return false;
        }else if($("#dormadminName").val()!="${dormAdmin.dormadminName}"){
            $("#adminNameError").html("");
            $.ajax({
                type:'post',
                url:'/checkDormAdminName.do?dormadminName='+$("#dormadminName").val(),
                success:function (data) {
                    if(data.code == 0){
                        $("#adminNameError").html(data.msg);
                        return false;
                    }else {
                        $("#adminNameError").html("");
                        return true;
                    }
                }
            });
        }
    }
    function checkadminPhone() {
        $("#adminPhoneError").html("");
        if($("#dormadminPhone").val()== ''){
            $("#adminPhoneError").html("输入手机不能为空");
            return false;
        }else if($("#dormadminPhone").val()!="${dormAdmin.dormadminPhone}"){
            $("#adminPhoneError").html("");
            $.ajax({
                type:'post',
                url:'/checkDormAdminPhone.do?dormadminPhone='+$("#dormadminPhone").val(),
                success:function (data) {
                    if(data.code == 0){
                        $("#adminPhoneError").html(data.msg);
                        return false;
                    }else {
                        $("#adminPhoneError").html("");
                        return true;
                    }
                }
            });
        }
    }
    function checkpassword() {
        $("#adminPasswordError").html("");
        var password_1 = $("#dormadminPassword_1").val();
        if(password_1.length<6){
            $("#adminPasswordError").html("密码不能少于6个字符");
            return false;
        }else{
            $("#adminPasswordError").html("");
            return true;
        }
    }

    function checkpasswordEqual() {
        $("#enqualTo").html("两次输入密码不一致");
        var password_1 = $("#dormadminPassword_1").val();
        var password_2 = $("#dormadminPassword_2").val();
        if (password_2!=password_1){
            $("#enqualTo").html("两次输入密码不一致");
            return false;
        }else{
            $("#enqualTo").html("");
            return true;
        }
    }

    function backtoAdminJsp() {
        window.location.href="/admin/Main.jsp";

    }

    function submitProfit(){
        $.ajax({
            url:"/modifyProfit.do",
            data:$('#modifyProfit').serialize(),
            success:function(data){
                if (data.code == 1) {
                    var txt = "修改成功！注销登录";
                    var option = {
                        onOk: function () {
                            window.event.returnValue=false;
                            window.location.href = "/adminLogout.do";
                        }
                    };
                    window.wxc.xcConfirm(txt, "success", option);
                }
            },
            error:function(data){
                alert(data);
            }
        });
    }
</script>
</body>
</html>
