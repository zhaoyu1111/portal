<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-js.jsp" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${orgroom.associaName}-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%--org pageheader--%>
    <%@include file="orgroom-pageheader.jsp" %>

    <!-- nav tab -->
    <%@ include file="orgroom-nav.jsp" %>

    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane active" id="classroom-content">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">校友会简介：</h4>
                    </div>
                    <div class="panel-body">
                        <blockquote>
                            <i class="fa fa-quote-left"></i>
                            <c:if test="${orgroom.descrip!=''&&orgroom.descrip!=null}">
                                <p>${orgroom.descrip}</p>
                            </c:if>
                            <c:if test="${orgroom.descrip=='' || orgroom.descrip==null}">
                                <p>(暂无简介)</p>
                            </c:if>
                        </blockquote>
                    </div>
                </div>
                <div id="bloglist" class="row">
                    <%--<c:forEach items="${latestInfos}" var="info" varStatus="status">
                        <div class="col-md-12">
                            <div class="blog-item">
                                    &lt;%&ndash;
                                    <c:if test="${info.infoImg!=null&&info.infoImg!=''}">
                                        <a
                                            href="classroom/infoDetail.action?classId=${classroom.classId}&infoId=${info.infoId}"
                                            class="blog-img" target="blank"><img
                                            src="/img/${info.infoImg}" class="img-responsive" alt=""
                                            style="max-height: 230px;" /></a>
                                    </c:if> &ndash;%&gt;
                                <div class="blog-details">
                                    <div class="blog-summary">
                                        <ar:sub length="40" value="${info.content}"/><br>
                                        <ul class="blog-meta">
                                            <li>By: <a href="ta/show.action?userId=${info.userId}">${info.trueName}</a>
                                            </li>
                                            <li><fmt:formatDate value="${info.createTime}"
                                                                pattern="yyyy-MM-dd HH:mm"/></li>
                                            <li>
                                                <a href="orgroom/infoDetail.action?originId=${orgroom.originId}&infoId=${info.infoId}">评论(${info.comments})</a>
                                            </li>
                                        </ul>
                                        <button class="btn btn-sm btn-white"
                                                onclick="javascript:location.href='orgroom/infoDetail.action?originId=${orgroom.originId}&infoId=${info.infoId}';">
                                            查看详情
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- blog-item -->
                        </div>
                        <c:if test="${(status.index+1)%4==0}">
                            <div class="row"></div>
                        </c:if>
                    </c:forEach>--%>
                </div>
                <%--<div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">最新照片：</h4>
                    </div>
                </div>--%>
            </div>
            <%--<div class="col-md-3"
                 style="background-color: #eee; padding: 10px 10px 50px 10px;">
                <%@ include file="../../my/my-mini.jsp" %>
                <ar:exist items="${memberIds}" value="${SESSION_USER.userId}">
                    <div class="alert alert-info">
                        <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
                        <a class="alert-link" href="javascript:;">您已加入${orgroom.associaName}!</a>
                    </div>
                </ar:exist>
                <ar:notexist items="${memberIds}" value="${SESSION_USER.userId}">
                    <div class="alert alert-info">
                        <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
                        <a class="alert-link" href="javascript:;">您还未加入该组织${orgroom.associaName}!</a>
                    </div>
                    <a class="btn btn-darkblue"
                       href="${pageContext.request.contextPath}/orgroom/joinOrigin.action?originId=${orgroom.associaId}">
                        <span class="glyphicon glyphicon-plus"></span>&nbsp;申请加入</a>
                </ar:notexist>
                <hr/>
                <h5 class="subtitle mb5">管理员：</h5>
                <div class="media">
                    <a class="pull-left"
                       href="${pageContext.request.contextPath}/ta/show.action?userId=${classroom.mgrId}"> <img
                            class="media-object img-responsive" src="${classroom.mgrImg}"
                            alt="" style="max-width: 100px;">
                    </a>
                    <div class="media-body">
                        <h5>${classroom.mgrName}</h5>
                        <p class="email-summary">
                            <ar:sub length="20" value="${classroom.mgrDesc}"/>
                        </p>
                    </div>
                </div>
                <div class="row"></div>
            </div>--%>
        </div>
    </div>
    <!-- Tab panes -->
</div>
<!-- container -->
<%@ include file="../../portal-common/footer.jsp" %>
</body>
<script src="/script/org/orgroom/orgroom-index.js"></script>
</html>