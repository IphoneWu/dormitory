<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员信息</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
                <small>所有信息</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">管理员信息表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-6">

                                    </div>
                                    <div class="col-sm-5" style="text-align: right;">
                                        <button type="submit" id="searchSubmit" name="searchSubmit" class="btn btn-primary" onclick="getNoSta(1)">获取未分配</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 table-responsive">
                                        <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                            <thead style="text-align: center;">
                                            <tr role="row">
                                                <th >
                                                    工号
                                                </th>
                                                <th>
                                                    姓名
                                                </th>
                                                <th>
                                                    性别
                                                </th>
                                                <th>
                                                    出生日期
                                                </th>
                                                <th>
                                                    电话
                                                </th>
                                                <th>
                                                    管理区域
                                                </th>
                                                <th>

                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="mainTable">

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <div id="mainTableInfo" class="dataTables_info" id="example2_info" role="status" aria-live="polite">

                                            </div>
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
        $("#mainTable").empty();
        $.ajax({
            type:'post',
            url:'/admin/getAllAdmin.do',
            async: false,
            success:function (data) {
                $.each(data.data, function (i, item) {
                    var dormadminNum = item.dormadminNum;
                    var adminAddrezz = item.adminAddrezz;
                    var dormadminSex = item.dormadminSex;
                    var dormadminSbirth = item.dormadminSbirth;
                    if(dormadminNum==null)
                    {
                        dormadminNum = '未分配'
                    }
                    if(adminAddrezz==null)
                    {
                        adminAddrezz = '未分配'
                    }
                    if(dormadminSex==null)
                    {
                        dormadminSex = '未填写'
                    }
                    if(dormadminSbirth==null)
                    {
                        dormadminSbirth = '未填写'
                    }else {
                        dormadminSbirth = new Date((item.dormadminSbirth)).Format("yyyy-MM-dd")
                    }
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1">' + dormadminNum + '</td>' +
                            '<td class="sorting_1">' + item.dormadminName + '</td>' +
                            '<td class="sorting_1">' + dormadminSex + '</td>' +
                            '<td class="sorting_1">' + dormadminSbirth+ '</td>' +
                            '<td class="sorting_1">' + item.dormadminPhone + '</td>' +
                            '<td class="sorting_1">' + adminAddrezz + '</td>' +
                            '<td class="sorting_1"><a href="/admin/getModifyAdmin.do?dormadminId=' + item.dormadminId + '">修改</a>' +
                            '&nbsp;&nbsp;&nbsp;<a href="JavaScript:deleteAdmin('+(item.dormadminId)+')">删除</a></td></tr>')
                });
            }
        });

    });

    function getNoSta() {
        $("#mainTable").empty();
        $.ajax({
            type:'post',
            url:'/admin/getNoStaAdmin.do',
            async: false,
            success:function (data) {
                $.each(data.data, function (i, item) {
                    var dormadminNum = item.dormadminNum;
                    var adminAddrezz = item.adminAddrezz;
                    var dormadminSex = item.dormadminSex;
                    var dormadminSbirth = item.dormadminSbirth;
                    if(dormadminNum==null)
                    {
                        dormadminNum = '未分配'
                    }
                    if(adminAddrezz==null)
                    {
                        adminAddrezz = '未分配'
                    }
                    if(dormadminSex==null)
                    {
                        dormadminSex = '未填写'
                    }
                    if(dormadminSbirth==null)
                    {
                        dormadminSbirth = '未填写'
                    }else {
                        dormadminSbirth = new Date((item.dormadminSbirth)).Format("yyyy-MM-dd")
                    }
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1">' + dormadminNum + '</td>' +
                            '<td class="sorting_1">' + item.dormadminName + '</td>' +
                            '<td class="sorting_1">' + dormadminSex + '</td>' +
                            '<td class="sorting_1">' + dormadminSbirth + '</td>' +
                            '<td class="sorting_1">' + item.dormadminPhone + '</td>' +
                            '<td class="sorting_1">' + adminAddrezz + '</td>' +
                            '<td class="sorting_1"><a href="/admin/getModifyAdmin.do?dormadminId=' + item.dormadminId + '">修改</a>' +
                            '&nbsp;&nbsp;&nbsp;<a href="JavaScript:deleteAdmin('+(item.dormadminId)+')">删除</a></td></tr>')
                });
            }
        });

    }

    function deleteAdmin(dormadminId) {
        var txt = "确定删除吗？删除之后无法恢复！";
        var option = {
            onOk: function () {
                $.ajax({
                    type: 'post',
                    url: '/admin/deleteAdmin.do?dormadminId='+dormadminId,
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "删除成功！";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/admin/Admin.jsp";
                                }
                            };
                            window.wxc.xcConfirm(txt, "success", option);
                        }
                    }
                });
            }
        };
        window.wxc.xcConfirm(txt, "warning", option);
    }
</script>
</body>
</html>
