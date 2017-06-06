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
        width: 320px;
        display: inline-block;
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
      label {
        vertical-align: top;
        display: inline-block;
        width: 80px;
        text-align: right;
      }
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
      <nav>
        <div class="navbar navbar-inverse navbar-fixed-top">
          <div class="navbar-header">
            <!-- .navbar-toggle样式用于toggle收缩的内容，即nav-collapse collapse样式所在元素 -->
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#mynav">
              <span class="sr-only">Toggle Navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <!-- 确保无论是宽屏还是窄屏，navbar-brand都显示 -->
            <a href="index.jsp" class="navbar-brand" style="font-size: 20px">韩山师范学院</a>
          </div>
          <!-- 屏幕宽度小于768px时，div.navbar-responsive-collapse容器里的内容都会隐藏，显示icon-bar图标，当点击icon-bar图标时，再展开。屏幕大于768px时，默认显示。 -->
          <div class="colcollapse navbar-collapse navbar-responsive-collapse" id="mynav">
            <ul class="nav navbar-nav" style="padding-left: 150px;">
              <li class="active"><a href="index.jsp">首页</a></li>
              <li><a href="" data-toggle="modal" data-target="#mymodal">查询入口</a></li>
              <li><a href="" data-toggle="modal" data-target="#mymodal">申请入口</a></li>
              <li><a href="" data-toggle="modal" data-target="#mymodal">保修入口</a></li>
              <li><a href="" data-toggle="modal" data-target="#mymodal">通告</a></li>
              <li><input class="isearch" placeholder="搜索本站..." type="text"></li>
              <li>
                <button class="btn btn-black" type="submit" style="margin-top: 10px;margin-left: 15px;">
                  <i class="glyphicon glyphicon-search"></i>
                </button>
              </li>
              <li id="loginLi" style="margin-left: 100px;"><span class="glyphicon glyphicon-user" style="color:white;padding: 15px;padding-right: 0px; ">
                        <a href="#" style="color: white;padding: 15px 0px;" data-toggle="modal" data-target="#mymodal">登录</a></span></li>
            </ul>
          </div>
        </div>
      </nav>
    </header>


    <!-- 模态框（Modal）学生用户登录 -->
    <div class="modal fade" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
              &times;
            </button>
            <h3 >请登录</h3>
          </div>
          <div class="modal-body">

            <form id="registerForm"  action="" method="post">
              <div class="form-group" style="width: 400px;height: auto;margin: 5px auto">
                <%--<span class="error">${str}</span>--%>
                <label style="float: left;margin-top: 8px;" for="studentNum">学生号：</label>
                <input type="text" class="form-control"  name="studentNum"
                       id="studentNum" placeholder="请输入学生号..." style="width: 300px;"  required/>
              </div>
              <div class="form-group" style="width: 400px;height: auto;margin: 5px auto">
                <label style="float: left;margin-top: 8px;" for="studentName">姓&nbsp;&nbsp;&nbsp;名：</label>
                <input type="text" class="form-control" name="studentName"
                        id="studentName" placeholder="请输入学生名字..." style="width: 300px;"  required />
              </div>
              <div class="form-group" style="width: 400px;height: auto;margin: 5px auto">
                <label style="float: left;margin-top: 8px;" for="captcha1">验证码：</label>
                <div  id="captcha1">

                </div>
              </div>
              <%--<input type="submit" class="btn btn-primary login-button" value="登录" style="width:70px;height:40px;" />--%>
              <%--<p class="text-success"  ><a href="register.html">>>还没账号？去注册</a></p>--%>
              <div>
                <input id="submitId" type="submit" class="btn btn-primary login-button" value="登录" style="margin-left:0;margin-top: 20px; width: 120px;" />
              </div>
            </form>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal -->
    </div>


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

  <script>
    var handler1 = function (captchaObj) {
      // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
      captchaObj.appendTo("#captcha1");
      $("#submitId").click(function (e) {
        var result = captchaObj.getValidate();
        if (!result) {
          window.wxc.xcConfirm("请完成验证！", window.wxc.xcConfirm.typeEnum.error);
          e.preventDefault();
        } else {
          var params = $("#registerForm").serializeArray();
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
