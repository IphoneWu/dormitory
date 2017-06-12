<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/9
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>已审批请假</title>
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
                请假信息表
                <small>已审核的请假</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">请假信息表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-6">

                                    </div>
                                    <div class="col-sm-5" style="text-align: right;">
                                        <input type="text" id="sitSearch" name="sitSearch" class="form-control" placeholder="搜索...">
                                        <button type="submit" id="sitSubmit" name="sitSubmit" class="btn btn-primary" onclick="searchSit(1)">查询</button>
                                        <button type="submit" id="deleteSit" name="deleteSit" class="btn btn-danger" onclick="deleteSit()">删除</button>
                                        <button type="submit" id="refleshSit" name="refleshSit" class="btn btn-success" onclick="refleshSit()" style="display: none;">刷新</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 table-responsive">
                                        <table id="example2" class="table table-bordered table-hover dataTable text-center" role="grid" aria-describedby="example2_info">
                                            <thead>
                                            <tr role="row">
                                                <th>

                                                </th>
                                                <th >
                                                    请假单号
                                                </th>
                                                <th>
                                                    提交离校时间
                                                </th>
                                                <th>
                                                    回校时间
                                                </th>
                                                <th>
                                                    请假原因
                                                </th>
                                                <th>
                                                    学号
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
    var totalNum;
    var currentPage;
    var pageAmount;
    var pre = (currentPage-1);
    var next = (currentPage+1);

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
            url:'/admin/situation/getSitList.do?page=1&eventStatus=1',
            async: false,
            success:function (data) {
                totalNum = data.totalNum;
                currentPage=data.pageNum;
                pageAmount =data.pageAmount;
                pre=(currentPage-1);
                next=(currentPage+1);
                $("#mainTableInfo").html("总共"+totalNum+"条记录");
                $.each(data.data, function(i,item){
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1"><input  type="checkbox" name="position" value="'+item.situationId+'"></td>' +
                            '<td class="sorting_1">'+item.situationId+'</td>' +
                            '<td class="sorting_1">'+new Date((item.leaveTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+new Date((item.returnTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+item.event.substr(0, 10)+'</td>' +
                            '<td class="sorting_1">'+item.studentNum+'</td>' +
                            '<td class="sorting_1"><a href="/admin/situation/readSit.do?situationId='+item.situationId+'">查看</a></td></tr>')
                });
                $("#list").append('<li class="paginate_button previous" id="example1_previous"><a id="pre"  href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">上一页</a></li>');
                $('#pre').attr('href','JavaScript:getTable('+(pre)+');');
                for (var i = 0; i < pageAmount; i++) {
                    $("#list").append('<li class="paginate_button" id="example1_current'+(i+1)+'"><a id="current'+(i+1)+'" href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">'+(i+1)+'</a></li>');
                    $('#current'+(i+1)).attr('href','JavaScript:getTable('+(i+1)+');');
                    if ((i+1)==currentPage) {
                        $("#example1_current"+(i+1)).addClass('active');
                    }
                }
                $("#list").append('<li class="paginate_button next" id="example1_next"><a id="next" href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">下一页</a></li>');
                $('#next').attr('href','JavaScript:getTable('+(next)+');');
                if (pageAmount==1){
                    $("#example1_previous").addClass('disabled');
                    $('#pre').attr('href','#');
                    $("#example1_next").addClass('disabled');
                    $('#next').attr('href','#');
                } else if(currentPage==pageAmount) {
                    $("#example1_next").addClass('disabled');
                    $('#next').attr('href','#');
                }else if(pre==0){
                    $("#example1_previous").addClass('disabled');
                    $('#pre').attr('href','#');
                } else {
                    $("#example1_previous").removeClass('disabled');
                    $("#example1_next").removeClass('disabled');
                }
            }
        });

    });
    function getTable(now) {
        $("#mainTable").empty();
        $.ajax({
            type: 'post',
            url: '/admin/situation/getSitList.do?eventStatus=1&page=' + now,
            async: false,
            success: function (data) {
                totalNum = data.totalNum;
                currentPage = data.pageNum;
                pageAmount = data.pageAmount;
                pre = (currentPage - 1);
                next = (currentPage + 1);
                $("#mainTableInfo").html("总共" + totalNum + "条记录");
                $.each(data.data, function (i, item) {
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1"><input  type="checkbox" name="position" value="'+item.situationId+'"></td>' +
                            '<td class="sorting_1">'+item.situationId+'</td>' +
                            '<td class="sorting_1">'+new Date((item.leaveTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+new Date((item.returnTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+item.event.substr(0, 10)+'</td>' +
                            '<td class="sorting_1">'+item.studentNum+'</td>' +
                            '<td class="sorting_1"><a href="/admin/situation/readSit.do?situationId='+item.situationId+'">查看</a></td></tr>')
                });
                $("#list").empty();
                $("#list").append('<li class="paginate_button previous" id="example1_previous"><a id="pre"  href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">上一页</a></li>');
                $('#pre').attr('href','JavaScript:getTable('+(pre)+');');
                for (var i = 0; i < pageAmount; i++) {
                    $("#list").append('<li class="paginate_button" id="example1_current'+(i+1)+'"><a id="current'+(i+1)+'" href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">'+(i+1)+'</a></li>');
                    $('#current'+(i+1)).attr('href','JavaScript:getTable('+(i+1)+');');
                    if ((i+1)==currentPage) {
                        $("#example1_current"+(i+1)).addClass('active');
                    }
                }
                $("#list").append('<li class="paginate_button next" id="example1_next"><a id="next" href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">下一页</a></li>');
                $('#next').attr('href','JavaScript:getTable('+(next)+');');
                if (pageAmount==1){
                    $("#example1_previous").addClass('disabled');
                    $('#pre').attr('href','#');
                    $("#example1_next").addClass('disabled');
                    $('#next').attr('href','#');
                } else if(currentPage==pageAmount) {
                    $("#example1_next").addClass('disabled');
                    $('#next').attr('href','#');
                }else if(pre==0){
                    $("#example1_previous").addClass('disabled');
                    $('#pre').attr('href','#');
                } else {
                    $("#example1_previous").removeClass('disabled');
                    $("#example1_next").removeClass('disabled');
                }
            }
        });
    }

    function deleteSit() {

        var txt = "确定删除吗？删除之后无法恢复！";
        var option = {
            onOk: function () {
                var position = "";
                $('input:checkbox[name=position]:checked').each(function (i) {
                    if (0 == i) {
                        position = $(this).val();
                    } else {
                        position += ("," + $(this).val());
                    }
                });
                if(position == ''){
                    var txt=  "没有选中要删除的信息！";
                    var option = {
                        onOk: function () {
                            window.location.href = "/admin/isSituation.jsp";
                        }
                    };
                    window.wxc.xcConfirm(txt, "error", option);
                }
                $.ajax({
                    type: 'post',
                    url: '/admin/situation/deleteSit.do?position=' + position,
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "删除成功！";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/admin/isSituation.jsp";
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

    function searchSit(page) {
        $("#refleshSit").show();
        $("#mainTable").empty();
        var sitSearch=$("#sitSearch").val();
        $.ajax({
            type: 'post',
            url: '/admin/situation/sitSearch.do?eventStatus=1&page='+page+'&sitSearch='+sitSearch,
            async: false,
            success: function (data) {
                totalNum = data.totalNum;
                currentPage = data.pageNum;
                pageAmount = data.pageAmount;
                pre = (currentPage - 1);
                next = (currentPage + 1);
                $("#mainTableInfo").html("总共" + totalNum + "条记录");
                $.each(data.data, function (i, item) {
                    $("#mainTable").append('<tr role="row" class="odd">' +
                            '<td class="sorting_1"><input  type="checkbox" name="position" value="'+item.situationId+'"></td>' +
                            '<td class="sorting_1">'+item.situationId+'</td>' +
                            '<td class="sorting_1">'+new Date((item.leaveTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+new Date((item.returnTime)).Format("yyyy-MM-dd hh:mm:ss")+'</td>' +
                            '<td class="sorting_1">'+item.event.substr(0, 10)+'</td>' +
                            '<td class="sorting_1">'+item.studentNum+'</td>' +
                            '<td class="sorting_1"><a href="/admin/situation/readSit.do?situationId='+item.situationId+'">查看</a></td></tr>')
                });
                $("#list").empty();
                $("#list").append('<li class="paginate_button previous" id="example1_previous"><a id="pre"  href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">上一页</a></li>');
                $('#pre').attr('href','JavaScript:searchSit('+(pre)+');');
                for (var i = 0; i < pageAmount; i++) {
                    $("#list").append('<li class="paginate_button" id="example1_current'+(i+1)+'"><a id="current'+(i+1)+'" href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">'+(i+1)+'</a></li>');
                    $('#current'+(i+1)).attr('href','JavaScript:searchSit('+(i+1)+');');
                    if ((i+1)==currentPage) {
                        $("#example1_current"+(i+1)).addClass('active');
                    }
                }
                $("#list").append('<li class="paginate_button next" id="example1_next"><a id="next" href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">下一页</a></li>');
                $('#next').attr('href','JavaScript:searchSit('+(next)+');');
                if (pageAmount==1){
                    $("#example1_previous").addClass('disabled');
                    $('#pre').attr('href','#');
                    $("#example1_next").addClass('disabled');
                    $('#next').attr('href','#');
                } else if(currentPage==pageAmount) {
                    $("#example1_next").addClass('disabled');
                    $('#next').attr('href','#');
                }else if(pre==0){
                    $("#example1_previous").addClass('disabled');
                    $('#pre').attr('href','#');
                } else {
                    $("#example1_previous").removeClass('disabled');
                    $("#example1_next").removeClass('disabled');
                }
            }
        });

    }
    function refleshSit() {

        window.location.href = "/admin/isSituation.jsp";

    }
</script>
</body>
</html>
