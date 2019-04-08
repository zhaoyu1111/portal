<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>

<div class="pageheader" style="max-height: 80px;">
    <h2><i class="fa fa-graduation-cap">${orgroom.associaName}</i><span>${member}人加入</span></h2>
    <div class="breadcrumb-wrapper">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
            <li><a href="${pageContext.request.contextPath}/origin">校友组织</a></li>
            <li class="active">${orgroom.associaName}</li>
        </ol>
    </div>
    <input id="originId" value="${orgroom.associaId}" type="hidden">
</div>
<div class="mb5"></div>