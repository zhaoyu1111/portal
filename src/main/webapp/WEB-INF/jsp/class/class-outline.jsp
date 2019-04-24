<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<div class="fm-sidebar">
    <h3 class="subtitle">校友组织信息</h3>
    <ul class="folder-list">
        <li><i class="fa fa-institution"></i>
            班级总数&nbsp;:&nbsp;${classCount}&nbsp;个班级</li>
        <li><i class="fa fa-users"></i>已加入校友&nbsp;:&nbsp;${userCount}&nbsp;位校友</li>
    </ul>

    <div class="mb30"></div>

    <h3 class="subtitle">人气排行</h3>
    <ul class="folder-list">
        <c:forEach items="${sortClass}" var="sortClass">
            <li><a href="class/classDetail?classId=${sortClass.classId}">
                <i class="fa fa-graduation-cap"></i>${sortClass.className} (${sortClass.count}人)</a>
            </li>
        </c:forEach>
    </ul>

    <div class="mb30"></div>

    <h3 class="subtitle">我的班级</h3>
    <c:if test="${SESSION_USER == null}">
        <label><h4>您还没有登录，请<a href="/login">登录</a></h4></label>
    </c:if>
    <c:if test="${SESSION_USER != null && SESSION_USER.classId == myClass.classId}">
        <ul class="folder-list">
            <li><a href="class/classDetail?classId=${myClass.classId}">
                <i class="fa fa-graduation-cap"></i>${myClass.className}</a>
            </li>
        </ul>
    </c:if>
</div>