<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/12
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的报修记录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
        <div id="mainContent" class="col-md-8" style="margin-top: 60px;height: 400px;">
            <div class="col-sm-12 table-responsive">
                <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                    <thead style="text-align: center;">
                    <tr role="row">
                        <th >
                            报修单号
                        </th>
                        <th>
                            提交时间
                        </th>
                        <th>
                            报修原因
                        </th>
                        <th>
                            报修物件
                        </th>
                        <th>
                            维修地址
                        </th>
                        <th>
                            报修人
                        </th>
                        <th>

                        </th>
                    </tr>
                    </thead>
                    <tbody id="mainTable">
                    <%--<c:forEach items="${situationList}" var="situation">--%>
                    <%--<tr>--%>
                    <%--<td>${situation.situationId}</td>--%>
                    <%--<td>${situation.studentNum}</td>--%>
                    <%--<td id="leaveTime">--%>
                    <%--<script>--%>
                    <%--var time = new Date(("${situation.leaveTime}")).Format("yyyy-MM-dd hh:mm:ss");--%>
                    <%--$("#leaveTime").html(time);--%>
                    <%--</script>--%>
                    <%--</td>--%>
                    <%--<td id="event">--%>
                    <%--<script>--%>
                    <%--var event = "${situation.event}";--%>
                    <%--$("#event").html(event.substr(0, 10));--%>
                    <%--</script>--%>
                    <%--</td>--%>
                    <%--<td ><a href="/user/getOneSit.do?situationId=${situation.situationId}" style="color: #3c8dbc;">查看</a></td></td>--%>
                    <%--</tr>--%>
                    <%--</c:forEach>--%>
                    </tbody>
                </table>
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
<script src="/static/dist/js/DateUtil.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/plugins/jQuery-confirm/xcConfirm.js"></script>
<script>
    $(document).ready(function() {
        var studentNum =  ${sessionScope.student.studentNum};
        $("#mainTable").empty();
        $.ajax({
            type: 'post',
            url: '/user/getRepairByNum.do?studentNum='+studentNum,
            async: false,
            success: function (data) {
                $.each(data.data, function(i,item){
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1">'+item.repairNum+'</td>' +
                            '<td class="sorting_1">'+new Date((item.submitTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+item.repairReason.substr(0, 10)+'</td>' +
                            '<td class="sorting_1">'+item.porpertyName+'</td>' +
                            '<td class="sorting_1">'+item.addrezz+'</td>' +
                            '<td class="sorting_1">'+item.studentNum+'</td>' +
                            '<td class="sorting_1"><a href="/user/getOneRepair.do?repairNum='+item.repairNum+'" style="color:  #3c8dbc;">查看</a></td></tr>')
                });
            }
        });
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
    function gotoLoginJsp() {
        window.location.href = "/login.jsp"

    }
</script>
</body>
</html>
