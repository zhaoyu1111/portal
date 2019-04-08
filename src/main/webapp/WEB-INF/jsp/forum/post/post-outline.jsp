<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>

<h5 class="subtitle">其他活动：</h5>
<ul class="sidebar-list">
    <c:forEach items="${activity}" var="activity">
        <li><a href="${pageContext.request.contextPath}/article/detail?activityId=${activity.activityId}">
            <i class="fa fa-angle-right"></i> ${activity.activityName}</a>
        </li>
    </c:forEach>
</ul>