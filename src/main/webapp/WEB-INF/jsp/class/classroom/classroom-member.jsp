<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classInfo.grade}级${classInfo.className}班级成员-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>

<%@ include file="../../portal-common/header.jsp" %>

<div class="container higher" id="container">
    <%@ include
            file="classroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="classroom-nav.jsp" %>

    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">
        <div class="tab-pane active" id="classroom-content">
            <div class="people-list">
                <c:forEach items="${user}" var="member">
                    <div class="col-md-2">
                        <div class="people-item" style="text-align: center; min-height: 170px; max-height: 170px">
                            <a href="${pageContext.request.contextPath}/ta/show?userId=${member.studentId}">
                                <div style="min-height: 125px;">
                                    <img src="${member.avatar}" class="img-responsive center-block"
                                         style="max-height: 125px;">
                                </div>
                                    ${member.userName}
                            </a>
                        </div>
                    </div>
                    <!-- col-md-6 -->
                </c:forEach>
            </div>
            <input type="hidden" value="${classInfo.classId}" id="classId">
        </div>
        <%@ include file="../../portal-common/pagination.jsp" %>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/class/classroom/classroom-member.js"></script>
</html>