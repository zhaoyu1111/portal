<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>

<div class="pageheader" style="max-height: 80px;">
    <h2><i class="fa fa-graduation-cap"></i>${classInfo.grade}级 /${classInfo.className} <span>${classCount}人加入</span>
    </h2>
    <div class="breadcrumb-wrapper">
        <ol class="breadcrumb">

            <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
            <li><a href="${pageContext.request.contextPath}/class">班级录</a></li>
            <li class="active">${classInfo.className}</li>
        </ol>
    </div>
    <input id="originId" value="${classInfo.classId}" type="hidden">
</div>
<div class="mb5"></div>