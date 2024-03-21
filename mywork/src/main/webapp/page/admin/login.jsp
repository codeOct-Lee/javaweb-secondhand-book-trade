<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>BUAA 后台登录</title>

</head>
<script type="text/javascript">

    document.onkeydown=function(e){
        var keycode=document.all?event.keyCode:e.which;
        if(keycode==13)Adminsubmitlogin();
    };

    function isAdminTelephone(){
        var name=$.trim($("#telephone").val());
        $("#telephone").val(name);
        if(name==""){
            $("#telephonespan").html("手机号码不能为空");
            $("#telephonespan").show();
            return false;
        }else{
            $("#telephonespan").hide();
            return true;
        }
    }

    function isAdminPwd(){
        var pwd=$.trim($("#password").val());
        $("#password").val(pwd);
        if(pwd.length<6){
            $("#pwdspan").html("密码长度不能小于6位");
            $("#pwdspan").show();
            return false;
        }else{
            $("#pwdspan").hide();
            return true;
        }
    }

    function isAdminyanzhengma() {
        var flag = false;
        var yanzhengma = $.trim($("#yanzhengma").val());
        $("#yanzhengma").val(yanzhengma);
        if (yanzhengma.length < 1) {
            $("#yanzhengmaspan").html("验证码不能为空");
            $("#yanzhengmaspan").show();
            return flag;
        } else {
            flag = true;
            return flag;
        }

    }

    function Adminsubmitlogin(){

        if(isAdminTelephone()&&isAdminPwd()&&isAdminyanzhengma()){

            var phone=$.trim($("#telephone").val());
            var pwd=$.trim($("#password").val());
            var yanzhengma=$.trim($("#yanzhengma").val());

            var param={};
            param.telephone=phone;
            param.password=pwd;
            param.yanzhengma=yanzhengma;


            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/adminlogin.do",
                data: param,
                dataType: "json",
                async: false,
                success: function(data){
                    var flag=data.flag;
                    var msg=data.msg;
                    if(flag=="2"){
                        $("#telephonespan").html("账户不存在");
                        $("#telephonespan").show();
                    }else if(flag=="3"){
                        $("#pwdspan").html("密码错误");
                        $("#pwdspan").show();
                        $("#telephonespan").hide();
                    }else if(flag=="1"){
                        $("#yanzhengmaspan").html("验证码错误");
                        $("#yanzhengmaspan").show();
                        $("#namespan").hide();
                        $("#pwdspan").hide();

                    }else if(flag=="4"){
                        alert(msg);
                        window.location.href="${pageContext.request.contextPath}/admin/adminIndex.do"

                    }else{
                        alert("系统错误");
                    }
                }
            });
        }
    }
    function updateAdminyanzhengma(){
        document.getElementById('yanzhengmaimg').src= '${pageContext.request.contextPath}/yanzhengma/index.do?t='+new Date().getTime();

    }
    function goBack() {
        window.history.back();
    }
    function goShouYe() {
        window.location.href = '${pageContext.request.contextPath}/page/shouye.jsp';
    }
</script>

<script type="text/javascript" src="/js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src=/js/jquery-3.1.1.min"></script>
<script language="javascript" type="text/javascript">
    function changeimg(){
        var img=document.getElementById("img1");
        //防止页面缓存
        img.src="${pageContext.request.contextPath}/verifycode/getVerifyCodeImage.do?num"+Math.random();
    }
    DD_belatedPNG.fix('div, ul, img, li, input,p,ul,ol,h1,h2,h3,a,span,i');
</script>

<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" id="form">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="telephone" name="telephone" type="text" placeholder="管理员账户" class="input-text size-L" onblur="isAdminTelephone()"></br>
                   <i id="telephonespan" class="p_tip"></i>
                </div>

            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L" onblur="isAdminPwd()"></br>
                    <i id="pwdspan" class="p_tip"></i>
                </div>

            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">


                    <input class="input-text size-L" type="text" id="yanzhengma" placeholder="验证码" onblur="isAdminyanzhengma()" style="width:150px;">
                    <img id="img1" title="点击获取新验证码" src="${pageContext.request.contextPath}/verifycode/getVerifyCodeImage.do" onclick="changeimg()" width="95" height="50" alt="" style="display:inline-block;">
<%--                    <img src="${pageContext.request.contextPath}/yanzhengma/index.do" alt="验证码" height="30px;" id="yanzhengmaimg" onclick="updateAdminyanzhengma();"> </br>--%>
                    <i id="yanzhengmaspan" class="p_tip"></i>
                </div>

            </div>

            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;" onclick="Adminsubmitlogin()"/>
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;" onclick="goBack()">
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;回&nbsp;&nbsp;首&nbsp;&nbsp;页&nbsp;" onclick="goShouYe()">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Copyright BUAA by Lee.admin v3.1</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui/js/H-ui.min.js"></script>
