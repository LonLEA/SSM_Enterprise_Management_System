<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/4/12
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>

    <title>LonLEA企业管理平台</title>
</head>
<body>
<div class="head">
    LonLEA员工管理系统
</div>
<div class="container front">
    <div class="form-box">
        <form id="login_form" action="${pageContext.request.contextPath}/login.do" method="post">
        <h1>登录</h1>
        <span id="login_message" style="color: red"></span>
        <div class="form-control">
            <input id="login_username" name="username" type="text" required>
            <label>UserName</label>
        </div>

        <div class="form-control">
            <input id="login_password" name="password" type="password" required>
            <label>PassWord</label>
        </div>

        <button id="loginbtn" class="btn" type="submit">Login</button>
        <p class="text">Don't have an account?
            <a id="register">注册</a>
        </p>
        </form>
    </div>
</div>

<div class="container back" id="registerpart">
    <div class="form-box">
        <form id="register_form" action="${pageContext.request.contextPath}/users/register.do" method="post">
        <h1>注册</h1>
        <span style="color: red" id="register_message"></span>
        <div class="form-control">
            <input id="register_username" type="text" name="username" required>
            <label>UserName</label>
            <span style="color: red" id="register_msg1"></span>
        </div>
        <div class="form-control">
            <input id="register_password" type="password" name="password" required>
            <label>PassWord</label>
            <span style="color: red" id="register_msg2"></span>
        </div>

        <div class="form-control">
            <input id="register_confirm" type="password" name="confirm" required>
            <label>Confirm PassWord</label>
            <span style="color: red" id="register_msg3"></span>
        </div>

            <button type="button" id="registerbtn" class="btn" >Register</button>

        <p class="text">Have an account ? You can
            <a id="login">登录</a>
        </p>
        </form>
    </div>
</div>
</body>
</html>

</body>
</html>
