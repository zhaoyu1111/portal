<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classInfo.grade}级${classInfo.className}通讯录-信电校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%@ include file="classroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="classroom-nav.jsp" %>

    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">
        <div class="tab-pane active" id="classroom-content">
            <%--<ul class="letter-list">
                <c:forEach items="${letters}" var="letter">
                    <li><a href="javascript:;">${letter}</a></li>
                </c:forEach>
            </ul>--%>
            <div class="mb20"></div>

            <div class="people-list">
                <c:forEach items="${user}" var="userInfo">
                    <div class="col-md-6">
                        <div class="people-item">
                            <div class="media">
                                <a href="${pageContext.request.contextPath}/ta/show?studentId=${userInfo.studentId}"
                                   class="pull-left"> <img src="${userInfo.avatar}"
                                                           class="img-responsive thumbnail media-object">
                                </a>
                                <div class="media-body">
                                    <h4 class="person-name">${userInfo.userName}</h4>
                                    <div class="text-muted">
                                        <i class="fa fa-map-marker"></i> ${userInfo.homeAddress}
                                    </div>
                                    <div class="text-muted">
                                        <i class="fa fa-briefcase"></i> 软件工程师 就职于<a href="javascript:;">上海证券交易所</a>
                                    </div>
                                    <ul class="social-list">
                                        <c:if test="${userInfo.mobile!=null}">
                                            <li><a href="javascript:;" class="tooltips" data-toggle="tooltip"
                                                   data-placement="top" title="手机：${userInfo.mobile}"><i
                                                    class="fa fa-mobile"></i></a></li>
                                        </c:if>
                                        <c:if test="${userInfo.email!=null}">
                                            <li><a href="javascript:;" class="tooltips"
                                                   data-toggle="tooltip" data-placement="top"
                                                   title="邮箱：${userInfo.email}"><i
                                                    class="fa fa-envelope-o"></i></a></li>
                                        </c:if>
                                        <%--<c:if test="${directory.qq!=null}">
                                            <li><a href="javascript:;" class="tooltips"
                                                   data-toggle="tooltip" data-placement="top"
                                                   title="QQ：${directory.qq}"><i class="fa fa-qq"></i></a></li>
                                        </c:if>
                                        <c:if test="${directory.wechat!=null}">
                                            <li><a href="javascript:;" class="tooltips"
                                                   data-toggle="tooltip" data-placement="top"
                                                   title="微信：${directory.wechat}"><i class="fa fa-wechat"></i></a></li>
                                        </c:if>
                                        <c:if test="${directory.microblog!=null}">
                                            <li><a href="javascript:;" class="tooltips"
                                                   data-toggle="tooltip" data-placement="top"
                                                   title="新浪微博：${directory.microblog}"><i
                                                    class="fa fa-weibo"></i></a></li>
                                        </c:if>--%>
                                    </ul>
                                </div>
                            </div>
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
<script src="/script/class/classroom/classroom-directory.js"></script>
</html>