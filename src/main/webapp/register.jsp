<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/4/21
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册账号</title>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <!--<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>-->
    <!--<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
    <!--[endif]-->
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

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="#"><b>注册</b>成为宿管</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">请填写注册信息</p>

        <form id="registerForm" data-toggle="validator" role="form">
            <div class="form-group has-feedback">
                <input type="text" id="dormadminName" name="dormadminName" class="form-control" placeholder="输入用户名..."
                       onchange="checkadminName()" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                <div id="adminNameError" class="help-block with-errors" style="color: #dd4b39;" ></div>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="dormadminPassword" name="dormadminPassword" class="form-control" placeholder="输入密码..."
                       data-error="密码长度不短于6" data-minlength="6" >
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="dormadminPassword_2" name="dormadminPassword_2" class="form-control" placeholder="确认密码..."
                       onchange="checkpassword()" >
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                <div id="enqualTo" class="help-block with-errors" style="color: #dd4b39;"></div>
            </div>
            <div class="form-group has-feedback">
                <input type="text" id="dormadminPhone" name="dormadminPhone" class="form-control" placeholder="输入手机号码..."
                       onchange="checkadminPhone()" >
                <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                <div id="adminPhoneError" class="help-block with-errors" style="color: #dd4b39;"></div>
            </div>

            <div class="col-xs-12" id="captcha1" style="padding: 0 0;">
            </div>
            <br>

            <div class="row">
                <div class="col-xs-12" style="padding: 0 0;">
                    <div class="checkbox icheck">
                        <label>
                            <input id="checkboxCheck"  type="checkbox">我同意
                        </label>
                        &nbsp;&nbsp;<a class="text-center" data-toggle="modal" data-target="#myModal">用户协议</a>
                    </div>
                </div>
                <!-- /.col -->
                <!-- /.col -->
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button id="submitId" name="submitId"  class="btn btn-primary btn-block btn-flat" disabled>注册</button>
                </div>
            </div>
        </form>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            用户协议
                        </h4>
                    </div>
                    <div class="modal-body">
                        <p>网络用户隐私权保护和个人信息利用政策<br></p>
                        <p>最后更新时间：2017年5月26日</p>
                        <p>【注意】根据文化部制定的《网络管理暂行规定》及《网络服务格式化协议必备条款》（下称“必备条款”）的相关规定，为保障网络用户（下称“用户”）的隐私权、规范对网络用户个人信息的利用，特制定本政策。请用户仔细阅读以下全部内容（特别是粗体下划线标注的内容）。如用户不同意本政策的任意内容，请不要注册或使用网易服务。如用户通过进入注册程序并勾选“我同意网络游戏用户隐私权保护和个人信息利用政策”，即表示用户与计算机系统有限公司及其他合作运营主体（下列简称为“本学习网站”）已达成协议，自愿接受本政策的所有内容。此后，用户不得以未阅读本政策的内容作任何形式的抗辩。
                        尊重用户个人隐私是本公司的一项基本政策。“隐私”是指用户在注册帐号时提供给本公司的个人身份信息，包括用户注册资料中的姓名、个人有效身份证件号码、联系方式、家庭住址等。本公司一贯积极地采取技术与管理等合理措施保障用户帐号的安全、有效；本公司将善意使用收集的信息，采取各项有效且必要的措施以保护您的隐私安全，并使用商业上合理的安全技术措施来保护您的隐私不被未经授权的访问、使用或泄漏。
                        因业务所需，本公司不随便披露用户信息，但是一下情况除外：</p>
                        <p>（1）用户或用户监护人授权本公司披露的；</p>
                        <p>（2）有关法律要求本公司披露的；</p>
                        <p>（3）司法机关或行政机关基于法定程序要求本公司提供的；</p>
                        <p>（4）本公司为了维护自己合法权益而向用户提起诉讼或者仲裁时；</p>
                        <p>（5）应用户监护人的合法要求而提供用户个人身份信息时。</p>
                        <p>特别提示：本政策仅适用于使用本公司在线游戏服务的宿舍管理系统用户。</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <a href="/login.jsp" class="text-center">我已经是宿管，直接登录</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script type="text/javascript" src="/static/plugins/jQuery-confirm/xcConfirm.js"></script>
<!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
<script src="gt.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'// optional
        });
    });
    function checkadminName() {
        if($("#dormadminName").val() == ''){
            $("#adminNameError").html("用户名不能为空");
            $('#submitId').attr("disabled",true);
            return false;
        }else{
            $("#adminNameError").html("");
            $.ajax({
                type:'post',
                url:'/checkDormAdminName.do?dormadminName='+$("#dormadminName").val(),
                success:function (data) {
                    if(data.code == 0){
                        $("#adminNameError").html(data.msg);
                        $('#submitId').attr("disabled",true);
                        return false;
                    }else {
                        $("#adminNameError").html("");
                        $('#submitId').removeAttr("disabled");
                        return true;
                    }
                }
            });
        }

    }
    function checkadminPhone() {
        if($("#dormadminPhone").val()== ''){
            $("#adminPhoneError").html("输入手机不能为空");
            $('#submitId').attr("disabled",true);
            return false;
        }else{
            $("#adminPhoneError").html("");
            $.ajax({
                type:'post',
                url:'/checkDormAdminPhone.do?dormadminPhone='+$("#dormadminPhone").val(),
                success:function (data) {
                    if(data.code == 0){
                        $("#adminPhoneError").html(data.msg);
                        $('#submitId').attr("disabled",true);
                        return false;
                    }else {
                        $("#adminPhoneError").html("");
                        $('#submitId').removeAttr("disabled");
                        return true;
                    }
                }
            });
        }

    }
    function checkpassword() {
        var password_1 = $("#dormadminPassword").val();
        var password_2 = $("#dormadminPassword_2").val();
        if (password_2!=password_1){
            $("#enqualTo").html("两次输入密码不一致");
            $('#submitId').attr("disabled",true);
            return false;
        }else{
            $("#enqualTo").html("");
            $('#submitId').removeAttr("disabled");
            return true;
        }
    }
    var handler1 = function (captchaObj) {
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha1");
//        captchaObj.onReady(function () {
//            $("#wait1").hide();
//        });
        $("#submitId").click(function (e) {
            if(!($("#checkboxCheck").is(':checked'))){
                window.wxc.xcConfirm("请阅读完用户协议再提交！",window.wxc.xcConfirm.typeEnum.error);
                e.preventDefault();
            }

                var result = captchaObj.getValidate();
                if (!result) {
                    window.wxc.xcConfirm("请完成验证！", window.wxc.xcConfirm.typeEnum.error);
                    e.preventDefault();
                } else {
                    var params = $("#registerForm").serializeArray();
                    $.ajax({
                        type: 'post',
                        url: '/saveDormAdmin.do',
                        data: params,
                        async: false,
                        success: function (data) {
                            if (data.code == 1) {
                                var txt=  "注册成功，回登录页";
                                var option = {
//                                    title: "成功",
//                                    btn: parseInt("0011", 2),
                                    onOk: function () {
                                        window.location.href = "login.jsp"
                                    }
                                };
                                window.wxc.xcConfirm(txt, "success", option);
//                                setTimeout(,10000);
                                return true;
                            }else {
                                window.wxc.xcConfirm("信息注册有误！", window.wxc.xcConfirm.typeEnum.error);
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
</script>
</body>

</html>