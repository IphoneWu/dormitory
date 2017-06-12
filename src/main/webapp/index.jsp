<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/5/14
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>学生宿舍前台</title>
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
<body class="hold-transition skin-blue sidebar-mini">
<header class="main-header">
  <nav class="navbar navbar-inverse navbar-static-top" style="margin-left: 0;">
    <div class="container">
      <div class="navbar-header">
        <a href="/index.jsp" class="navbar-brand"><b>韩山师范学院</b>宿舍管理</a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
          <i class="fa fa-bars"></i>
        </button>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="/index.jsp">首页</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">查询入口<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#" data-toggle="modal" data-target="#mymodal">我的请假</a></li>
              <li><a href="#" data-toggle="modal" data-target="#mymodal">我的报修</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">申请入口 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#" data-toggle="modal" data-target="#mymodal">请假申请</a></li>
              <li><a href="#" data-toggle="modal" data-target="#mymodal">报修申请</a></li>
            </ul>
          </li>
        </ul>
        <%--<form class="navbar-form navbar-left" role="search">--%>
          <div class="navbar-form navbar-left form-group">
            <input type="text" class="form-control" id="reportSearch" placeholder="搜索本站...">
            <button class="btn btn-black" type="submit" onclick="searchReport(1)">
              <i class="glyphicon glyphicon-search"></i>
            </button>
          </div>
        <%--</form>--%>
      </div>
      <!-- /.navbar-collapse -->
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <a href="#" data-toggle="modal" data-target="#mymodal">登录</a>
          </li>
        </ul>
      </div>
      <!-- /.navbar-custom-menu -->
    </div>
    <!-- /.container-fluid -->
  </nav>
</header>
<div class="modal" id="mymodal" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">前台登录</h4>
      </div>
      <div class="modal-body">
        <form id="studentForm"  action="" method="post">
          <div class="col-xs-3 text-right">
            <label for="studentNum">学生号：</label>
          </div>
          <div class="col-xs-7 text-left">
            <input type="text" class="form-control"  name="studentNum"
                   id="studentNum" placeholder="请输入学生号..." required/>
          </div>
          <div class="col-xs-3 text-right">
            <label for="studentName">姓&nbsp;&nbsp;&nbsp;名：</label>
          </div>
          <div class="col-xs-7 text-left">
            <input type="text" class="form-control" name="studentName"
                   id="studentName" placeholder="请输入学生名字..." required />
          </div>
          <div class="col-xs-3 text-right">
            <label for="captcha1">验证码：</label>
          </div>
          <div class="col-xs-6"  id="captcha1">

          </div>
        </form>
      </div>
      <div class="modal-footer" style="margin: 100px 0; text-align: center;">
        <div class="col-xs-12">
          <button id="submitId" type="button" class="btn btn-primary">登录</button>
        </div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>



<div class="container" style="margin-top: 10px;">
  <div class="row">

    <div id="mainContent" class="col-md-8">
      <%--<div class="post-head">--%>
      <%--<h1 class="post-title"><a href="">东丽a区e栋关于对陈庆丰通告</a></h1>--%>
      <%--</div>--%>
      <%--<div class="post-meta" style="color: #959595;margin: 14px 0 0;">--%>
      <%--<span class="author">--%>
      <%--管理员:<a href="" target="_blank">e栋阿姨</a>--%>
      <%--</span>--%>
      <%--·--%>
      <%--<time class="post-date">2017-2-20</time>--%>
      <%--</div>--%>
      <%--<div class="featured-media">--%>
      <%--<a href="">--%>
      <%--<img class="img-responsive center-block" src="/static/dist/img/photo1.png" alt="" >--%>
      <%--</a>--%>
      <%--</div>--%>
      <%--<div class="post-content">--%>
      <%--<p></p>--%>
      <%--<p>昨天收到e栋205、204宿舍举报，昨晚凌晨207学生陈庆峰大声k歌，歌声十分难听，205和204学生难以忍受，无法入眠，入眠后都出现各种不同的做噩梦现象，于是来楼下举报，我作为e栋阿姨，收到举报后，赶往现场...</p>--%>
      <%--<p></p>--%>
      <%--</div>--%>
      <%--<div class="post-permalink">--%>
      <%--<a href="" class="btn btn-default">阅读全文</a>--%>
      <%--</div>--%>
      <%--<footer class="post-footer clearfix"></footer>--%>
      <%--<nav class="pagination" role="navigation"><span class="page-number">第 1 页 / 共 7 页</span> <a class="older-posts" href="/page/2/"><i class=" fa fa-angle-right"></i></a></nav>--%>
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
          <button class="btn btn-primary col-md-12" onclick="gotoLoginJsp()">管理员登录</button>
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
<script src="gt.js"></script>
<script src="/static/dist/js/DateUtil.js"></script>

<script>
  var totalNum;
  var currentPage;
  var pageAmount;
  var pre = (currentPage-1);
  var next = (currentPage+1);

  $(document).ready(function() {
    getIndexReport(1);
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
  function getIndexReport(page) {
    $("#mainContent").empty();
    $.ajax({
      type:'post',
      url:'/IndexreportList.do?page='+page,
      async: false,
      success:function (data) {
        totalNum = data.totalNum;
        currentPage=data.pageNum;
        pageAmount =data.pageAmount;
        pre=(currentPage-1);
        next=(currentPage+1);
        $.each(data.data, function(i,item){
          $("#mainContent").append('<div class="post">' +
                  '<div class="post-head"> ' +
                  '<h1 class="post-title"><a href="JavaScript:ReadReport('+(item.reportId)+')">'+item.reportTitle+'</a></h1>' +
                  '</div>' +
                  '<div class="post-meta" style="color: #959595;margin: 14px 0 0;">' +
                  '<span class="author">管理员:<a href="" target="_blank">'+item.reportAuthor+'</a> </span>· <time class="post-date">'+new Date((item.reportTime)).Format("yyyy-MM-dd hh:mm:ss")+'</time>' +
                  '</div>' +
                  '<div class="featured-media"> <a href="JavaScript:ReadReport('+(item.reportId)+')"> <img class="img-responsive center-block" src="'+item.reportImage+'" alt="" ></a>' +
                  '</div>' +
                  '<div class="post-content"> <p></p> <p>'+item.reportSummary+'</p> <p></p> ' +
                  '</div>' +
                  '<div class="post-permalink"> <a href="JavaScript:ReadReport('+(item.reportId)+')" class="btn btn-default">阅读全文</a></div> <footer class="post-footer clearfix"></footer>' +
                  '</div>');
          var isimage = item.reportImage;
          if(isimage==null){
            $(".featured-media").empty();
          }
        });
        if (pageAmount==1){
          $("#mainContent").append('<nav class="pagination" role="navigation"><span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span> ');
        } else if(currentPage==pageAmount) {
          $("#mainContent").append('<nav class="pagination" role="navigation">' +
                  '<a class="newer-posts" href="JavaScript:getIndexReport('+(pre)+')"> <i class="fa fa-angle-left"  style="background-color: #f4645f;color: white;"></i></a>' +
                  '<span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span>' +
                  '</nav>');
        }else if(pre==0){
          $("#mainContent").append('<nav class="pagination" role="navigation"><span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span> ' +
                  '<a class="older-posts" href="JavaScript:getIndexReport('+(next)+')"><i class="fa fa-angle-right" style="background-color: #f4645f;color: white;"></i></a></nav>');
        } else {
          $("#mainContent").append('<nav class="pagination" role="navigation">' +
                  '<a class=" newer-posts" href="JavaScript:getIndexReport('+(pre)+')"> <i class="fa fa-angle-left"  style="background-color: #f4645f;color: white;"></i></a>' +
                  '<span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span>' +
                  '<a class="older-posts" href="JavaScript:getIndexReport('+(next)+')"><i class="fa fa-angle-right"  style="background-color: #f4645f;color: white;"></i></a>' +
                  '</nav>');
        }
      }
    });
  }

  function ReadReport(reportId) {
    $("#mainContent").empty();
    $.ajax({
      type:'post',
      url:'/ReadReport.do?reportId='+reportId,
      async: false,
      success:function (data) {
        $("#mainContent").append('<div class="post">' +
                '<div class="post-head"> ' +
                '<h1 class="post-title"><a href="JavaScript:ReadReport('+(data.data.reportId)+')">'+data.data.reportTitle+'</a></h1>' +
                '</div>' +
                '<div class="post-meta" style="color: #959595;margin: 14px 0 0;">' +
                '<span class="author">管理员:<a href="" target="_blank">'+data.data.reportAuthor+'</a> </span>· <time class="post-date">'+new Date((data.data.reportTime)).Format("yyyy-MM-dd hh:mm:ss")+'</time>' +
                '</div>' +
                '<div class="featured-media"> <a href="JavaScript:ReadReport('+(data.data.reportId)+')"> <img class="img-responsive center-block" src="'+data.data.reportImage+'" alt="" ></a>' +
                '</div>' +
                '<div class="post-content">'+data.data.report+' ' +
                '</div>' +
                '<div class="post-permalink"> <a href="/index.jsp" class="btn btn-success">返回首页</a></div> ' +
                '<footer class="post-footer clearfix"></footer>' +
                '</div>');
        var isimage = data.data.reportImage;
        if(isimage==null){
          $(".featured-media").empty();
        }
      }
    });
  }
  function searchReport(page) {
    $("#mainContent").empty();
    var reportSearch=$("#reportSearch").val();
    $.ajax({
      type: 'post',
      url: '/reportSearch.do?page='+page+'&reportSearch='+reportSearch,
      async: false,
      success: function (data) {
        totalNum = data.totalNum;
        currentPage=data.pageNum;
        pageAmount =data.pageAmount;
        pre=(currentPage-1);
        next=(currentPage+1);
        $.each(data.data, function(i,item){
          $("#mainContent").empty();
          $("#mainContent").append('<div class="post">' +
                  '<div class="post-head"> ' +
                  '<h1 class="post-title"><a href="JavaScript:ReadReport('+(item.reportId)+')">'+item.reportTitle+'</a></h1>' +
                  '</div>' +
                  '<div class="post-meta" style="color: #959595;margin: 14px 0 0;">' +
                  '<span class="author">管理员:<a href="" target="_blank">'+item.reportAuthor+'</a> </span>· <time class="post-date">'+new Date((item.reportTime)).Format("yyyy-MM-dd hh:mm:ss")+'</time>' +
                  '</div>' +
                  '<div class="featured-media"> <a href="JavaScript:ReadReport('+(item.reportId)+')"> <img class="img-responsive center-block" src="'+item.reportImage+'" alt="" ></a>' +
                  '</div>' +
                  '<div class="post-content"> <p></p> <p>'+item.reportSummary+'</p> <p></p> ' +
                  '</div>' +
                  '<div class="post-permalink"> <a href="JavaScript:ReadReport('+(item.reportId)+')" class="btn btn-default">阅读全文</a></div> <footer class="post-footer clearfix"></footer>' +
                  '</div>');
          var isimage = item.reportImage;
          if(isimage==null){
            $(".featured-media").empty();
          }
        });
        if (pageAmount==1){
          $("#mainContent").append('<nav class="pagination" role="navigation"><span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span> ');
        } else if(currentPage==pageAmount) {
          $("#mainContent").append('<nav class="pagination" role="navigation">' +
                  '<a class="newer-posts" href="JavaScript:searchReport('+(pre)+')"> <i class="fa fa-angle-left"  style="background-color: #f4645f;color: white;"></i></a>' +
                  '<span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span>' +
                  '</nav>');
        }else if(pre==0){
          $("#mainContent").append('<nav class="pagination" role="navigation"><span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span> ' +
                  '<a class="older-posts" href="JavaScript:searchReport('+(next)+')"><i class="fa fa-angle-right" style="background-color: #f4645f;color: white;"></i></a></nav>');
        } else {
          $("#mainContent").append('<nav class="pagination" role="navigation">' +
                  '<a class=" newer-posts" href="JavaScript:searchReport('+(pre)+')"> <i class="fa fa-angle-left"  style="background-color: #f4645f;color: white;"></i></a>' +
                  '<span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span>' +
                  '<a class="older-posts" href="JavaScript:searchReport('+(next)+')"><i class="fa fa-angle-right"  style="background-color: #f4645f;color: white;"></i></a>' +
                  '</nav>');
        }
      }
    });

  }


  var handler1 = function (captchaObj) {
    // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
    captchaObj.appendTo("#captcha1");
    $("#submitId").click(function (e) {
      var result = captchaObj.getValidate();
      if (!result) {
        window.wxc.xcConfirm("请完成验证！", window.wxc.xcConfirm.typeEnum.error);
        e.preventDefault();
      } else {
        var params = $("#studentForm").serializeArray();
        $.ajax({
          type: 'post',
          url: '/studentLogin.do',
          data: params,
          async: false,
          success: function (data) {
            if (data.code == 1) {
              var txt=  "登录成功";
              var option = {
                onOk: function () {
                  window.location.href = "/user/Main.jsp"
                }
              };
              window.wxc.xcConfirm(txt, "success", option);
              return true;
            }else {
              window.wxc.xcConfirm("学号或者姓名有误！", window.wxc.xcConfirm.typeEnum.error);
              e.preventDefault();
            }
          }
        });
        return false;
      }

    });
  };

  $.ajax({
    url: "gt/register1?t=" + (new Date()).getTime(), // 加随机数防止缓存
    type: "get",
    dataType: "json",
    success: function (data) {
      // 调用 initGeetest 初始化参数
      // 参数1：配置参数
      // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
      initGeetest({
        gt: data.gt,
        challenge: data.challenge,
        new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
        offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
        product: "float", // 产品形式，包括：float，popup
        width: "100%"
        // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
      }, handler1);
    }
  });

  function gotoLoginJsp() {
    window.location.href = "/login.jsp"

  }
</script>
</body>
</html>
