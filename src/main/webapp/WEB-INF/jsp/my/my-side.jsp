<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<img src="${SESSION_USER.avatar}" class="thumbnail img-responsive"/>
<h1 class="subtitle">基本信息</h1>
<ul class="nav nav-pills nav-stacked nav-email ul-h">
    <li id="my-home"><a href="${pageContext.request.contextPath}/login/index"><i
            class="glyphicon glyphicon-home"></i>主页</a></li>
    <li id="my-profile"><a href="${pageContext.request.contextPath}/login/basic"><i
        class="fa fa-user"></i>个人资料</a></li>
    <li id="my-account"><a href="${pageContext.request.contextPath}/login/account"><i
            class="fa fa-gears"></i>账户设置</a></li>
</ul>

<div class="mb10"></div>
<h1 class="subtitle">应用信息</h1>
<ul class="nav nav-pills nav-stacked nav-email">
    <li id="my-class"><a href="${pageContext.request.contextPath}/login/class"><i class="fa fa-mortar-board"></i>我的班级</a>
    </li>
    <li id="my-recruit"><a href="${pageContext.request.contextPath}/recruit/queryUserRecruit"><i class="fa fa-bookmark"></i>我的招聘</a>
    </li>
</ul>