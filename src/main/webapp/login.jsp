<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/3/21
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
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
        #captcha1,
        #captcha2 {
            width: 300px;
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
    </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href=""><b>管理员登录</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">请填写你的工号与密码</p>

        <form id="loginForm"  data-toggle="validator" role="form" method="post">
            <div class="form-group has-feedback">
                <input id="dormadminNum" name="dormadminNum" type="text" class="form-control" placeholder="请输入你的员工号..." data-error="请输入你的员工号!" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group has-feedback">
                <input id="dormadminPassword" name="dormadminPassword" type="password" class="form-control" placeholder="请输入你的密码..." data-error="请输入你的密码!" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <div class="help-block with-errors"></div>
            </div>
            <div class="col-xs-12" id="captcha1" style="padding: 0 0;">
            </div>
            <div class="row">
                <div class="col-xs-8" style="padding: 0 0;">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <!-- /.col -->
            </div>
            <div class="col-xs-12" style="padding: 10px 0;">
                <button id="login_submit" type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
            </div>
        </form>
        <!-- /.social-auth-links -->

        <a href="#">忘记密码</a><br>
        <a href="register.jsp" class="text-center">没有账号？注册一个</a>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/plugins/iCheck/icheck.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script type="text/javascript" src="/static/plugins/jQuery-confirm/xcConfirm.js"></script>
<script src="gt.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
    var handler2 = function (captchaObj) {
        captchaObj.appendTo("#captcha1");

        $("#login_submit").click(function (e) {
            var result = captchaObj.getValidate();
            if (!result) {
                window.wxc.xcConfirm("请完成验证！", window.wxc.xcConfirm.typeEnum.error);
                e.preventDefault();
            } else {
                var params = $("#loginForm").serializeArray();
                $.ajax({
                    type: 'post',
                    url: '/adminLogin.do',
                    data: params,
                    async: false,
                    success: function (data) {
                        if (data.code == 1) {
                            var txt = "登录成功，进入后台管理";
                            var option = {
                                onOk: function () {
                                    window.location.href = "/admin/Main.jsp";
                                }
                            };
                            window.wxc.xcConfirm(txt, "success", option);
                            return true;
                        } else {
                            window.wxc.xcConfirm("账号或者密码出错！", window.wxc.xcConfirm.typeEnum.error);
                            e.preventDefault();
                        }
                    }
                });
                e.preventDefault();
            }
        });
    }
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
            }, handler2);
        }
    });
</script>
</body>
</html>
