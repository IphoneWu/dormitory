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
      padding: 21px 30px;
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
  </style>
</head>
<body>
<header>
  <jsp:include page="common/header.jsp"/>
</header>


<div class="container" style="margin-top: 100px;">
  <div class="row">
    <div class="col-md-8">
      <div class="post-head">
        <h1 class="post-title"><a href="">东丽a区e栋关于对陈庆丰通告</a></h1>
      </div>
      <div class="post-meta" style="color: #959595;margin: 14px 0 0;">
          <span class="author">
            管理员:<a href="" target="_blank">e栋阿姨</a>
          </span>
        ·
        <time class="post-date">2017-2-20</time>
      </div>
      <div class="featured-media">
        <a href="">
          <img class="img-responsive center-block" src="/static/dist/img/photo1.png" alt="" >
        </a>
      </div>
      <div class="post-content">
        <p></p>
        <p>昨天收到e栋205、204宿舍举报，昨晚凌晨207学生陈庆峰大声k歌，歌声十分难听，205和204学生难以忍受，无法入眠，入眠后都出现各种不同的做噩梦现象，于是来楼下举报，我作为e栋阿姨，收到举报后，赶往现场...</p>
        <p></p>
      </div>
      <div class="post-permalink">
        <a href="" class="btn btn-default">阅读全文</a>
      </div>
      <footer class="post-footer clearfix"></footer>
    </div>


    <%--右side--%>
    <aside class="col-md-4 sidebar">
      <div class="widget">
        <h1 class="title">留言板</h1>
        <div class="tips">
          <h4><a>陈庆丰成名曲不是洋葱</a></h4>
          <span style="color: #959595;margin: 14px 0 0">2017-6-5 20:15:08</span>
        </div>
        <div class="tips">
          <h4><a>陈庆丰成名曲不是洋葱陈庆丰成</a></h4>
          <span style="color: #959595;margin: 14px 0 0">2017-6-5 20:15:08</span>
        </div>
        <div>
          <button  class="btn btn-default">查看全部</button>
        </div>
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
<script>
  function gotoLoginJsp() {
    window.location.href = "/login.jsp"

  }
</script>
</body>
</html>
