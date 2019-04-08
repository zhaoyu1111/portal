<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>南昌航空大学校友登录</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link href="/css/bootstrap.css" rel="stylesheet"/>
    <link href="/css/public.css" rel="stylesheet"/>
    <link rel="icon" type="image/icon" href="/images/logo/nchu_title.jpg">
</head>
<body>
<div id="bg"></div>
<div class="show">
    <h3 class="title">南昌航空大学校友录</h3>
    <div class="login-panel">
        <h4 class="form-title">登录&nbsp;校友录</h4>
        <hr class="top-line">
        <form>
            <div class="form-group">
                <label for="studentId">学号</label>
                <input type="text" class="form-control" id="studentId">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" id="password">
            </div>

            <div class="form-group">
                <button type="button" class="btn btn-info" onclick="login()">登录</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script src="/script/portal-common/util.js"></script>
<script>
    function login() {
        var studentId = $("#studentId").val();
        var pwd = $("#password").val();

        if (!isValid(studentId)) {
            errMsg('studentId', "用户名不能为空");
            return;
        }
        if (!isValid(pwd)) {
            errMsg('password', "密码不能为空");
            return;
        }

        $.ajax({
            type: 'POST',
            url: '/login/val',
            data: "studentId=" + studentId + "&password=" + pwd,
            success: function (data) {
                rs = eval(data);
                if (rs.msg == "OK") {
                    $("#studentId").val("");
                    window.location.href = "http://localhost:8080/index";
                } else if (rs.type == "p") {
                    errMsg("password", rs.msg);
                } else if (rs.type == "a") {
                    errMsg("studentId", rs.msg);
                }
            },
            error: function () {
                alert("系统错误");
            },
            dataType: "json"
        });
    }

    function errMsg(el, msg) {
        $(".error").html("");
        $("#" + el).after("<label class='error' style='color: red'>" + msg + "</label>");
        $("#" + el).focus();
        setTimeout(function () {
            $(".error").fadeOut(2000);
        }, 2300);
    }
</script>
</body>
</html>
