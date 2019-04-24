<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-js.jsp" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${orgroom.associaName}通讯录-昌航校友录</title>
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
            <div class="mb20"></div>

            <div class="people-list">
                <c:forEach items="${page.records}" var="user">
                    <c:if test="${user.jobName != null && user.unitName != null}">
                        <div class="col-md-6">
                            <div class="people-item">
                                <div class="media">
                                    <a href="${pageContext.request.contextPath}/login/userIndex?studentId=${user.studentId}"
                                       class="pull-left"> <img alt=""
                                                               src="${user.avatar}" class="thumbnail media-object">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="person-name">${user.userName}</h4>
                                        <div class="text-muted">
                                            <i class="fa fa-map-marker"></i> ${user.homeAddress}
                                        </div>
                                        <div class="text-muted">
                                            <i class="fa fa-briefcase"></i> ${user.jobName} 就职于<a href="javascript:;">${user.unitName}</a>
                                        </div>
                                        <ul class="social-list">
                                            <c:if test="${user.mobile!=null}">
                                                <li><a href="javascript:;" class="tooltips"
                                                       data-toggle="tooltip" data-placement="top"
                                                       title="手机：${user.mobile}"><i class="fa fa-mobile"></i></a></li>
                                            </c:if>
                                            <c:if test="${user.email!=null}">
                                                <li><a href="javascript:;" class="tooltips"
                                                       data-toggle="tooltip" data-placement="top"
                                                       title="邮箱：${user.email}"><i
                                                        class="fa fa-envelope-o"></i></a></li>
                                            </c:if>
                                            <c:if test="${user.qq!=null}">
                                                <li><a href="javascript:;" class="tooltips"
                                                       data-toggle="tooltip" data-placement="top"
                                                       title="QQ：${user.qq}"><i class="fa fa-qq"></i></a></li>
                                            </c:if>
                                            <c:if test="${user.wechat!=null}">
                                                <li><a href="javascript:;" class="tooltips"
                                                       data-toggle="tooltip" data-placement="top"
                                                       title="微信：${user.wechat}"><i class="fa fa-wechat"></i></a></li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
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
<script src="/script/org/orgroom/orgroom-directory.js"></script>
</html>