<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/5
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布公告</title>
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
                发布通告
                <small>首页通告</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-header">
                            <h3 class="box-title">编辑通告</h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap table-responsive">
                                <div class="row">
                                    <%--main--%>
                                    <div class="col-sm-12">

                                        <table cellspacing="20px">
                                            <tr>
                                                <td width="80px">通告标题：</td>
                                                <td>
                                                    <input type="text" id="reportTitle" name="reportTitle" style="width:400px" />
                                                </td>
                                            </tr>
                                            <form id="imageUpload" method="post" enctype="multipart/form-data">
                                            <tr>
                                                <td width="80px">通告图片：</td>
                                                <td>
                                                    <input type="file" id="reportImage" name="reportImage" style="width:400px"/>
                                                </td>
                                            </tr>
                                            </form>
                                            <tr>
                                                <td valign="top">通告内容：</td>
                                                <td>
                                                    <script id="editor"  type="text/plain" style="width:85%; height:300px;"></script>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <a href="javascript:submitData()" class="btn btn-primary">发布通告</a>
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
<script src="/static/plugins/form/jquery.form.min.js"></script>
<script type="text/javascript" src="/static/plugins/jQuery-confirm/xcConfirm.js"></script>
<!-- 加载Ueditor -->
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/ueditor.config.js"></script>

<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/ueditor.all.min.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>

<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('editor');
</script>
<script type="text/javascript">
    function uploadImage() {
        var params = $("#imageUpload").serializeArray();
        $("#imageUpload").ajaxSubmit({
            method: 'post',
            data: params,
            url: '/admin/report/uploadImage.do',
            async: false
        });
    }

    function submitData() {
        uploadImage();


        var title = $("#reportTitle").val();
        var reportImage ="${sessionScope.reportImage}";
        var content = UE.getEditor('editor').getContent();
        var summary = UE.getEditor('editor').getContentTxt().substr(0, 50);
        var reportAuthor = "${sessionScope.dormAdmin.dormadminName}";
        alert(reportImage);
        if (title == null || title == '') {
            alert( "请输入标题！");
        } else if (content == null || content == '') {
            alert("请编辑通告内容！");
        } else {
            $.post("/admin/report/addReport.do",
                    {
                        'reportTitle' : title,
                        'reportSummary' : summary,
                        'report' : content,
                        'reportAuthor' : reportAuthor
                    }, function(data) {
                        if (data.code == 1) {
                            alert( "通告发布成功！");
                            clearValues();
                            window.location.href="/admin/Main.jsp";
                            window.event.returnValue=false;
                        } else {
                            alert("通告发布失败！");
                        }
                    });
        }
    }
    function clearValues() {
        $("#reportTitle").val("");
        UE.getEditor("editor").setContent("");
    }
</script>
</body>
</html>
