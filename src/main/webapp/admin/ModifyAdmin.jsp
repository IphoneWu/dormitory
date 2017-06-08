<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/8
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改管理员信息</title>
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
                管理员信息表
                <small>${dormAdmin.dormadminNum}的信息</small>
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
                                            <form  id="modifyAdmin"  method="post" >
                                                <tr>
                                                    <td width="10%">员工号</td>
                                                    <td>
                                                        <input type="hidden" id="dormadminId" name="dormadminId" value="${dormAdmin.dormadminId}">
                                                        <input  type="text" id="dormadminNum" name="dormadminNum" value="${dormAdmin.dormadminNum}" onblur="checkadminNum()">
                                                        <span style="color: red;" id="adminNumError"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">姓名</td>
                                                    <td>
                                                        <input  type="text" id="dormadminName" name="dormadminName" value="${dormAdmin.dormadminName}" readonly>
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
                                                <tr>
                                                    <td width="10%">管理区域</td>
                                                    <td>
                                                        <select id="areaNum" name="areaNum" onchange="getBuild()">

                                                        </select>
                                                        <select id="buildNum" name="buildNum" onchange="getDorm()">

                                                        </select>
                                                    </td>
                                                </tr>
                                            </form>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <button id="submitId" type="submit" class="btn btn-primary" type="button" >保存</button> &nbsp;&nbsp;
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
    var Num = "${dormAdmin.dormadminNum}";
    $(function () {
        $.ajax({
            method: 'post',
            url: '/admin/getAllarea.do',
            success: function (data) {
                var ddl = $("#areaNum");
                ddl.append("<option  value='-1'>请选择区域...</option>");
                var result = eval(data.data);
                $.each(result, function (key, value) {
                    var op = new Option(value.areaName,value.areaNum);
                    ddl[0].options.add(op);
                })
            }
        });
        $("#buildNum").hide();
    });

    function getBuild() {
        $("#buildNum").show();
        var areaNum = $('#areaNum  option:selected').val();
        $("#buildNum").empty();
        $.ajax({
            method: 'post',
            url: '/admin/getBuildStatus.do?areaNum='+areaNum,
            success: function (data){
                var ddl = $("#buildNum");
                ddl.append("<option  value='-1'>请选择宿舍楼...</option>");
                var result = eval(data.data);
                $.each(result, function (key, value) {
                    var op = new Option(value.buildName,value.buildNum);
                    ddl[0].options.add(op);
                })
            }
        });
    }

    $("#submitId").click(function (e) {
        var params = $("#modifyAdmin").serializeArray();
        var txt = "确定提交吗？";
        var option = {
            onOk: function () {
                $.ajax({
                    method: 'post',
                    data: params,
                    url: '/admin/modifyAdmin.do?Num='+Num,
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "分配成功！";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/admin/Admin.jsp";
                                }
                            };
                            window.wxc.xcConfirm(txt, "success", option);
                        }
                        else{
                            window.wxc.xcConfirm(data.msg, window.wxc.xcConfirm.typeEnum.error);
                        }
                    }
                });
            }
        };
        window.wxc.xcConfirm(txt, "warning", option);
    });

    function checkadminNum() {
        var dormadminNum = $("#dormadminNum").val();
        if(dormadminNum!=Num){
            $.ajax({
                method: 'post',
                url: '/admin/checkAdminNum.do?dormadminNum='+dormadminNum,
                async: false,
                success: function (data) {
                    if(data.code!= 1){
                        $("#adminNumError").html(data.msg);
                    }else{
                        $("#adminNumError").empty();
                    }
                }

            });

        }
    }
    function backtoAdminJsp() {
        window.location.href="/admin/Admin.jsp";

    }
</script>
</body>
</html>
