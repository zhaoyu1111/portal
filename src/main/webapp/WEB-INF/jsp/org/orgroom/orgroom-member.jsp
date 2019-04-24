<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${orgroom.associaName}成员-昌航校友录</title>
    <%@ include file="../../portal-common/portal-js.jsp" %>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%@ include file="orgroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="orgroom-nav.jsp" %>

    <input type="hidden" value="${orgroom.address}" id="originAddress">
    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">
        <div class="tab-pane active" id="classroom-content">
            <div class="people-list">
                <c:forEach items="${page.records}" var="member">
                    <div class="col-md-2">
                        <div class="people-item" style="text-align: center; min-height: 170px; max-height: 170px;">
                            <a href="${pageContext.request.contextPath}/login/userIndex?studentId=${member.studentId}">
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
        </div>
        <%@ include file="../../portal-common/pagination.jsp" %>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<script src="/script/org/orgroom/orgroom-member.js"></script>
</html>