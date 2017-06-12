<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/12
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>友情链接</title>
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
                友情链接表
                <small>所有链接</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">链接信息表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-6">

                                    </div>
                                    <div class="col-sm-5" style="text-align: right;">
                                        <button type="submit" id="searchSubmit" name="searchSubmit" class="btn btn-success" data-toggle="modal" data-target="#mymodal">添加</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 table-responsive">
                                        <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                            <thead style="text-align: center;">
                                            <tr role="row">
                                                <th >
                                                    链接号
                                                </th>
                                                <th>
                                                    链接名字
                                                </th>
                                                <th>
                                                    链接地址
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

<div class="modal" id="mymodal" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">添加友情链接</h4>
            </div>
            <div class="modal-body">
                <form id="addLinkForm"  action="" method="post">
                    <div class="col-xs-3 text-right">
                        <label for="linkName">链接名：</label>
                    </div>
                    <div class="col-xs-7 text-left">
                        <input type="text" class="form-control"  name="linkName"
                               id="linkName" placeholder="请输入链接名..." required/>
                    </div>
                    <div class="col-xs-3 text-right">
                        <label for="linkUrl">链接地址：</label>
                    </div>
                    <div class="col-xs-7 text-left">
                        <input type="text" class="form-control" name="linkUrl"
                               id="linkUrl" placeholder="请输入链接url..." required />
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="margin: 100px 0; text-align: center;">
                <div class="col-xs-12">
                    <button id="submitId" type="button" class="btn btn-primary" onclick="addLink()">添加</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
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
            url:'/admin/link/getAllLink.do',
            async: false,
            success:function (data) {
                $.each(data.data, function (i, item) {
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1">' + item.linkId + '</td>' +
                            '<td class="sorting_1">' + item.linkName + '</td>' +
                            '<td class="sorting_1">' + item.linkUrl + '</td>' +
                            '<td class="sorting_1"><a href="/admin/link/getModifyLink.do?linkId=' + item.linkId + '">修改</a>' +
                            '&nbsp;&nbsp;&nbsp;<a href="JavaScript:deleteLink('+(item.linkId)+')">删除</a></td></tr>')
                });
            }
        });

    });

    function deleteLink(linkId) {
        var txt = "确定删除吗？删除之后无法恢复！";
        var option = {
            onOk: function () {
                $.ajax({
                    type: 'post',
                    url: '/admin/link/deleteLink.do?linkId='+linkId,
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "删除成功！";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/admin/Link.jsp";
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

    function addLink() {
        var params = $("#addLinkForm").serializeArray();
        $.ajax({
            method: 'post',
            data: params,
            url: '/admin/link/addLink.do',
            async: false,
            success: function (data) {
                if (data.code == 1) {
                    var txt = "添加成功！";
                    var option = {
                        onOk: function () {
                            window.location.href = "/admin/Link.jsp";
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
</script>

</body>
</html>
