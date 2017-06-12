<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/12
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的请假</title>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/static/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="/static/plugins/jQuery-confirm/xcConfirm.css">
    <style>
        body {
            margin: 0 auto;
            padding: 0;
            font-size: 12px;
            text-align: center;
            color: #33322e;
            font-family: "微软雅黑","宋体", Tahoma, sans-serif;
        }
        .logo{
            width: 335px;
            height: 95px;
            float: left;
            background: url("/static/images/logo.jpg");
        }
        .navbar-inverse .navbar-brand {
            color: white;
        }
        .navbar-inverse .navbar-nav>li{
            font-size: 14px;
            padding: 0 5px;
        }


        /*.navbar .nav >li>a:hover{*/
        /*color: #000000;*/
        /*background-color:white ;*/
        /*}*/
        .isearch{
            margin-top: 10px;
            margin-left: 15px;
            display: block;
            width: 100%;
            height: 28px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #d6d6d6;
            background-image: none;
            border: 1px solid #474747;
            border-radius: 20px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            padding-top: 6px;
            padding-right: 12px;
            padding-bottom: 6px;
            padding-left: 12px;
        }

        #captcha1,
        #captcha2 {
            /*width: 100%;*/
            /*display: inline-block;*/
        }
        .show {
            display: block;
        }
        .hide {
            display: none;
        }
        #notice1,
        #notice2 {
            color: red;
        }
        /*label {*/
        /*vertical-align: top;*/
        /*display: inline-block;*/
        /*width: 80px;*/
        /*text-align: right;*/
        /*}*/
        #wait1,
        #wait2 {
            text-align: left;
            color: #666;
            margin: 0;
        }

        .post {
            padding: 35px;
            background: #fff;
            margin-bottom: 35px;
            position: relative;
            overflow: hidden;
        }
        .post-head {
            text-align: center;
        }

        .post .post-head .post-title {
            margin: 0;
            font-size: 2em;
            line-height: 1.2em;
        }
        .post .post-head .post-meta {
            color: #959595;
            margin: 14px 0 0;
        }
        .post .post-head .post-meta span {
            margin: 0 7px;
            white-space: nowrap;
        }
        .featured-media {
            margin-top: 30px;
            overflow: hidden;
        }
        .post .post-content {
            margin: 30px 0;
        }
        .post-content {
            font: 400 18px/1.62 Georgia,"Xin Gothic","Hiragino Sans GB","Droid Sans Fallback","Microsoft YaHei",sans-serif;
            color: #444443;
        }
        .post-footer {
            margin-top: 30px;
            border-top: 1px solid #ebebeb;
            padding: 21px 0 0;
        }
        a {
            color: #444443;
        }

        .sidebar .widget {
            background: #fff;
            padding: 35px 30px;
        }
        .widget {
            margin-bottom: 35px;
        }
        .widget .title {
            margin-top: 0;
            padding-bottom: 7px;
            border-bottom: 1px solid #000000;
            margin-bottom: 21px;
            position: relative;
        }
        .widget .tips{
            margin: 20px 0;
        }
        .pagination {
            margin: 0 0 35px;
            text-align: center;
            display: block;
        }
        .pagination .page-number {
            background: #f4645f;
            color: #fff;
            margin: 0 3px;
            display: inline-block;
            line-height: 36px;
            padding: 0 14px;
            border-radius: 2px;
        }
        .pagination a i {
            width: 36px;
            height: 36px;
            line-height: 36px;
        }
    </style>
</head>
<body>
<header class="main-header">
    <jsp:include page="common/header.jsp"/>
</header>
<div class="container" style="margin-top: 10px;">
    <div class="row">
        <div id="mainContent" class="col-md-8">
            <!-- Default box -->
            <div class="box" style="margin-top: 73px;">
                <div class="box-header with-border text-center">
                    <h1 class="box-title">请假单号:${situation.situationId}</h1>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                            <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                            <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="col-md-12 table-responsive text-center" style="padding: 30px 0;">
                        <form id="changeSitForm">
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <td width="50%" class="text-right"><label>请求离校时间:</label></td>
                                    <td id="formatLeaveTime" width="50%" class="text-left">

                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%" class="text-right"><label>请假原因:</label></td>
                                    <td width="50%" class="text-left">
                                        ${situation.event}
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%" class="text-right"><label>学号:</label></td>
                                    <td width="50%" class="text-left">
                                        ${situation.studentNum}
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%" class="text-right"><label>审批状态:</label></td>
                                    <td id="Status" width="50%" class="text-left">

                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer text-center">
                    <button class="btn btn-success" style="padding: 10px 20px;" onclick="sumitSituation()">销假</button>
                    <button class="btn btn-info" style="padding: 10px 20px;" onclick="goback()">返回</button>
                </div>
                <!-- /.box-footer-->
            </div>
        </div>


        <%--右side--%>
        <aside class="col-md-4 sidebar">
            <div class="widget" id="link">
                <h2 class="title">友情链接</h2>
            </div>
        </aside>

        <%--管理员入口--%>
        <aside class="col-md-4 sidebar">
            <div class="widget">
                <h1 class="title">管理员</h1>
                <div>
                    <button  class="btn btn-primary col-md-12" onclick="gotoLoginJsp()">管理员登录</button>
                </div>
            </div>
        </aside>
    </div>
</div>
<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/plugins/jQuery-confirm/xcConfirm.js"></script>
<script src="/static/dist/js/DateUtil.js"></script>
<script>
    $(document).ready(function() {
        var time = new Date(("${situation.leaveTime}")).Format("yyyy-MM-dd hh:mm:ss");
        $("#formatLeaveTime").html(time);
        var status = ${situation.eventStatus};
        if(status==0){
            $("#Status").html('未审批');
        }else if(status==1){
            $("#Status").html('已通过');
        }else{
            $("#Status").html('不通过');
        }
        $.ajax({
            type: 'post',
            url: '/getIndexLink.do',
            async: false,
            success: function (data) {
                $.each(data.data, function(i,item){
                    $("#link").append('<div class="tips">' +
                            '<div class="tips"> ' +
                            '<h4><a id="linkName" href="http://'+item.linkUrl+'">'+item.linkName+'</a></h4>' +
                            '<span style="color: #959595;margin: 14px 0 0" id="linkUrl">'+item.linkUrl+'</span> ' +
                            '</div>' +
                            '</div>')
                });
            }
        });
    });
    function sumitSituation() {
        var txt = "确定销假吗？";
        var option = {
            onOk: function () {
                $.ajax({
                    method: 'post',
                    url: '/user/changeSit.do?situationId='+${situation.situationId},
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "销假成功！";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/user/Main.jsp";
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

    function gotoLoginJsp() {
        window.location.href = "/login.jsp"

    }
    function goback() {
        window.location.href = "/user/Main.jsp";
    }
</script>
</body>
</html>
