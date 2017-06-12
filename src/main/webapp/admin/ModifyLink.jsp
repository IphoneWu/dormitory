<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/12
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改友情链接</title>
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
                友情链表
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-header">
                            <h3 class="box-title">修改链接</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-12  table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <form  id="modifyLink"  method="post" >
                                                <tr>
                                                    <td width="10%">链接名字</td>
                                                    <td>
                                                        <input type="hidden" id="linkId" name="linkId" value="${link.linkId}">
                                                        <input  type="text" id="linkName" name="linkName" value="${link.linkName}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">链接Url</td>
                                                    <td>
                                                        <input  type="text" id="linkUrl" name="linkUrl" value="${link.linkUrl}">
                                                    </td>
                                                </tr>
                                            </form>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <button id="submitId" type="submit" class="btn btn-primary" type="button" onclick="submitLink()" >保存</button> &nbsp;&nbsp;
                                                    <button type="button" class="btn btn-success" name="backid" id="backid" onclick="back()">返回</button>
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
    function submitLink() {
        var params = $("#modifyLink").serializeArray();
        $.ajax({
            method: 'post',
            data: params,
            url: '/admin/link/updateLink.do',
            async: false,
            success: function (data) {
                if (data.code == 1) {
                    var txt = "修改成功！";
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
    function back() {
        window.location.href="/admin/Link.jsp";

    }
</script>
</body>
</html>
