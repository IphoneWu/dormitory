<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/4
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
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
                学生信息表
                <small>${student.studentName}的信息</small>
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
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap table-responsive">
                                <div class="row">
                                    <div class="col-sm-12">
                                            <table class="table table-bordered table-hover">
                                                <form  id="modifyStu"  method="post" >
                                                <tr>
                                                    <td width="10%">学号</td>
                                                    <td>
                                                        <input  type="text" id="studentNum" name="studentNum" value="${student.studentNum}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">学生姓名</td>
                                                    <td>
                                                        <input  type="text" id="studentName" name="studentName" value="${student.studentName}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">学生性别</td>
                                                    <td>
                                                        <input type="radio" name="studentSex" value="男" checked/> 男
                                                        <input type="radio" name="studentSex" value="女"/> 女
                                                        <input type="hidden" name="vs" value="${student.studentSex}"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">出生日期</td>
                                                    <td>
                                                        <input type="text" name="studentBirth" value="${student.studentBirth}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">住宿区域</td>
                                                    <td>
                                                        <select id="areaNum" name="areaNum" onchange="getBuild()">

                                                        </select>
                                                        <select id="buildNum" name="buildNum" onchange="getDorm()">

                                                        </select>
                                                        <select id="dormNum" name="dormNum" onchange="getBed()">

                                                        </select>
                                                        <select id="bedNum" name="bedNum">

                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">学院</td>
                                                    <td>
                                                        <input type="text" name="collegeName" value="${student.collegeName}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">专业</td>
                                                    <td>
                                                        <input type="text" name="clazzName" value="${student.clazzName}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">班级</td>
                                                    <td>
                                                        <input type="text" name="clazzNum" value="${student.clazzNum}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">入学日期</td>
                                                    <td>
                                                        <input type="text" name="studentInTime" value="${student.studentInTime}">
                                                    </td>
                                                </tr>
                                                </form>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <button id="submitId" type="submit" class="btn btn-primary" type="button" >保存</button> &nbsp;&nbsp;
                                                        <button type="button" class="btn btn-success" name="backid" id="backid" onclick="backtoStudentJsp()" n>返回主页</button>
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

<script>
    $(function () {
        $.ajax({
            method: 'post',
            url: '/admin/getAllarea.do',
            success: function (data) {
                var ddl = $("#areaNum");
                ddl.append("<option  value='${student.areaNum}'>请选择宿舍区域...</option>");
                var result = eval(data.data);
                $.each(result, function (key, value) {
                    var op = new Option(value.areaName,value.areaNum);
                    ddl[0].options.add(op);
                })
            }
        });
        $("#buildNum").hide();
        $("#dormNum").hide();
        $("#bedNum").hide();
    });
    function backtoStudentJsp() {
        window.event.returnValue=false;
        window.location.href="/admin/Student.jsp";

    }

    function getBuild() {
        $("#buildNum").show();
        var areaNum = $('#areaNum  option:selected').val();
        $("#buildNum").empty();
        $.ajax({
            method: 'post',
            url: '/admin/getBuildByareaNum.do?areaNum='+areaNum,
            success: function (data){
                var ddl = $("#buildNum");
                ddl.append("<option  value='${student.buildNum}'>请选择宿舍楼...</option>");
                var result = eval(data.data);
                $.each(result, function (key, value) {
                    var op = new Option(value.buildName,value.buildNum);
                    ddl[0].options.add(op);
                })
            }
        });
    }
    function getDorm() {
        $("#dormNum").show();
        var buildNum = $('#buildNum  option:selected').val();
        $("#dormNum").empty();
        $.ajax({
            method: 'post',
            url: '/admin/getDormBybuildNum.do?buildNum='+buildNum,
            success: function (data){
                var ddl = $("#dormNum");
                ddl.append("<option  value='${student.dormNum}'>请选择宿舍号...</option>");
                var result = eval(data.data);
                $.each(result, function (key, value) {
                    var op = new Option(value.dormNum,value.dormNum);
                    ddl[0].options.add(op);
                })
            }
        });
    }
    function getBed() {
        $("#bedNum").show();
        var dormNum = $('#dormNum  option:selected').val();
        $("#bedNum").empty();
        $.ajax({
            method: 'post',
            url: '/admin/getBedByStatus.do?dormNum='+dormNum,
            success: function (data){
                var ddl = $("#bedNum");
                ddl.append("<option  value='${student.bedNum}'>请选择床号...</option>");
                var result = eval(data.data);
                $.each(result, function (key, value) {
                    var op = new Option(value.bedNum,value.bedNum);
                    ddl[0].options.add(op);
                })
            }
        });
    }
    $("#submitId").click(function (e) {
        var params = $("#modifyStu").serializeArray();
        var txt = "确定修改吗？";
        var option = {
            onOk: function () {
                $.ajax({
                    method: 'post',
                    data: params,
                    url: '/admin/modifyStu.do',
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "修改成功！";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/admin/Student.jsp";
                                }
                            };
                            window.wxc.xcConfirm(txt, "success", option);
                        }
                    }
                });
            }
        };
        window.wxc.xcConfirm(txt, "warning", option);
    })
</script>
</body>
</html>
