<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-- navigation -->
<ul class="nav nav-tabs nav-dark">
    <li id="index-li"><a href="${pageContext.request.contextPath}/origin/index?associaId=${orgroom.associaId}">
        <i class="fa fa-home"></i><strong> 主页</strong></a></li>
    <li id="member-li"><a href="${pageContext.request.contextPath}/origin/member?address=${orgroom.address}">
        <i class="fa fa-users"></i>&nbsp;<strong>成员</strong></a></li>
    <li id="directory-li"><a
            href="${pageContext.request.contextPath}/origin/directory?address=${orgroom.address}">
        <i class="fa  fa-phone-square"></i>&nbsp;<strong>通讯录</strong></a></li>
    <li id="album-li"><a href="${pageContext.request.contextPath}/orgroom/album?originId=${orgroom.associaId}"><i
            class="fa fa-picture-o"></i>&nbsp;<strong>相册</strong></a></li>
</ul>
<!-- navigation -->