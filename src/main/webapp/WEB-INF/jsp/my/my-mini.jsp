<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<c:if test="${SESSION_USER.studentId!=null}">
    <div class="media">
        <a class="pull-left" href="${pageContext.request.contextPath}/ta/show?userId=${SESSION_USER.studentId}">
            <img class="thumbnail img-responsive center-block" src="${SESSION_USER.avatar}" style="max-width: 65px"/>
        </a>
        <div class="media-body event-body">
            <h4 class="subtitle">${SESSION_USER.userName}</h4>
            <%--<p><ar:sub length="20" value="${SESSION_USER.introduce}"/></p>--%>
        </div>
    </div>
</c:if>