<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classInfo.className}-昌航校友录</title>
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
    <div class="tab-content">
        <div class="tab-pane active" id="classroom-content">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">班级简介：</h4>
                    </div>
                    <div class="panel-body">
                        <blockquote>
                            <i class="fa fa-quote-left"></i>
                            <c:if
                                    test="${classInfo.descript!=''&&classInfo.descript!=null}">
                                <p>${classInfo.descript}</p>
                            </c:if>
                            <c:if
                                    test="${classInfo.descript==''||classInfo.descript==null}">
                                <p>(暂无简介)</p>
                            </c:if>
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col-md-3"
                 style="background-color: #eee; padding: 10px 10px 50px 10px;">
                <%@ include file="../../my/my-mini.jsp" %>
                <c:if test="${classInfo.classId == SESSION_USER.classId}">
                    <div class="alert alert-info">
                        <button class="close" aria-hidden="true" data-dismiss="alert"
                                type="button">×
                        </button>
                        <strong></strong><a class="alert-link" href="javascript:;">您已加入该班级啦!</a>
                    </div>
                </c:if>
                <c:if test="${classInfo.classId != SESSION_USER.classId}">
                    <div class="alert alert-info">
                        <button class="close" aria-hidden="true" data-dismiss="alert"
                                type="button">×
                        </button>
                        <strong></strong><a class="alert-link" href="javascript:;">您还未加入该班级!</a>
                    </div>
                    <%--<a class="btn btn-darkblue"
                       href="${pageContext.request.contextPath}/classroom/joinClass.action?classId=${classroom.classId}"><span
                            class="glyphicon glyphicon-plus"></span>&nbsp;加入班级</a>--%>
                </c:if>
                <hr/>
                <h5 class="subtitle mb5">管理员：</h5>
                <div class="media">
                    <div class="media-body">
                        <h5>${classInfo.contractor}</h5>
                    </div>
                </div>
                <div class="row"></div>
            </div>
        </div>
    </div>
    <!-- Tab panes -->
</div>
<!-- container -->
<%@ include file="../../portal-common/footer.jsp" %>
</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/class/classroom/classroom-index.js"></script>
</html>