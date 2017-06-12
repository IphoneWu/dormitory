<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/11
  Time: 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改头像</title>
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
    <link rel="stylesheet" href="/static/userImageUpload/css/fileinput/file-input.min.css">
    <link rel="stylesheet" href="/static/userImageUpload/css/jcrop/jquery.Jcrop.min.css">
    <link rel="stylesheet" href="/static/userImageUpload/css/sco/scojs.css">
    <link rel="stylesheet" href="/static/userImageUpload/css/sco/sco.message.css">
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
                修改头像信息
                <small>图片格式</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-header">
                            <h3 class="box-title">点击插入头像</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button type="button" name="upload" class="pull-right btn btn-primary" style="margin-top: 15px">点击上传</button>
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
<!--图片裁剪插件-->
<script type="text/javascript" src="/static/userImageUpload/jcrop/jquery.Jcrop.min.js"></script>
<!--文件上传插件-->
<script type="text/javascript" src="/static/userImageUpload/fileinput/file-input.min.js"></script>
<!--fileinput中文化-->
<script type="text/javascript" src="/static/userImageUpload/fileinput/zh.js"></script>
<!--模态窗口优化插件,sco还有很多其他优化组件-->
<script type="text/javascript" src="/static/userImageUpload/sco/sco.modal.js"></script>
<!--腾讯的模板插件,使用起来类似JSTL和EL表达式-->
<script type="text/javascript" src="/static/userImageUpload/template/template.js"></script>
<script type="text/javascript" src="/static/userImageUpload/portrait.js"></script>
<script id="portraitUpload" type="text/html">
    <div style="padding: 10px 20px">
        <form role="form" enctype="multipart/form-data" method="post">
            <div class="embed-responsive embed-responsive-16by9">
                <div class="embed-responsive-item pre-scrollable">
                    <img alt="" src="/static/images/showings.jpg" id="cut-img"
                         class="img-responsive img-thumbnail"/>
                </div>
            </div>
            <div class="white-divider-md"></div>
            <input type="file" name="imgFile" id="fileUpload"/>
            <div class="white-divider-md"></div>
            <div id="alert" class="alert-success  hidden" role="alert"></div>
            <input type="hidden" id="x" name="x"/>
            <input type="hidden" id="y" name="y"/>
            <input type="hidden" id="w" name="w"/>
            <input type="hidden" id="h" name="h"/>
            <%--<div id="alert" class="col-xs-12 hidden">--%>
                <%--<button class=" btn btn-success " onclick="window.location.href=('/admin/Main.jsp')">完成</button>--%>
            <%--</div>--%>
        </form>
    </div>

</script>
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
</script>
</body>
</html>
