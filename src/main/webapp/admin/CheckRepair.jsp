
<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/9
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审阅报修单</title>
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
                审批报修单
                <small>报修信息单</small>
            </h1>
        </section>

        <!-- Content Header (Page header) -->
        <%--<section class="content-header">--%>
        <%--<h1>--%>
        <%--Blank page--%>
        <%--<small>it all starts here</small>--%>
        <%--</h1>--%>
        <%--<ol class="breadcrumb">--%>
        <%--<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>--%>
        <%--<li><a href="#">Examples</a></li>--%>
        <%--<li class="active">Blank page</li>--%>
        <%--</ol>--%>
        <%--</section>--%>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border text-center">
                    <h1 class="box-title">报修单号:${repair.repairNum}</h1>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                            <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                            <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="col-xs-12 table-responsive text-center" style="padding: 30px 0;">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <td width="50%" class="text-right"><label>报修物品:</label></td>
                                <td width="50%" class="text-left">
                                    ${repair.porpertyName}
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" class="text-right"><label>报修原因:</label></td>
                                <td width="50%" class="text-left">
                                    ${repair.repairReason}
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" class="text-right"><label>维修地点:</label></td>
                                <td width="50%" class="text-left">
                                    ${repair.addrezz}
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" class="text-right"><label>报修人:</label></td>
                                <td width="50%" class="text-left">
                                    ${repair.studentNum}
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" class="text-right"><label>提交时间:</label></td>
                                <td id="formatTime" width="50%" class="text-left">

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer text-center">
                    <button class="btn btn-success" style="padding: 10px 20px;" onclick="checkRepair(1)">通过</button>
                    <button class="btn btn-danger" style="padding: 10px 20px;" onclick="checkRepair(-1)">不通过</button>
                    <button class="btn btn-info" style="padding: 10px 20px;" onclick="goback()">返回</button>
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->

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

        var time = new Date(("${repair.submitTime}")).Format("yyyy-MM-dd hh:mm:ss");
        $("#formatTime").html(time);
    });

    function checkRepair(action) {

            var txt = "确定审批吗？";
            var option = {
                onOk: function () {
                    var repairNum = ${repair.repairNum};
                    $.ajax({
                        method: 'post',
                        url: '/admin/repair/updateRepair.do?repairStatus='+action+'&repairNum='+repairNum,
                        async: false,
                        success: function (data) {
                            if (data.code == 1) {
                                var txt = "审核成功！";
                                var option = {
                                    onOk: function () {
                                        window.location.href = "/admin/NoRepair.jsp";
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

    function goback() {
        window.location.href = "/admin/NoRepair.jsp";
    }
</script>

</body>
</html>
