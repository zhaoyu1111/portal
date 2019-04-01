<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-js.jsp" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>院系分会-信电校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../portal-common/header.jsp" %>

<%@ include file="../portal-common/navmenu.jsp" %>

<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a>
                </li>
                <li class="active">校友组织</li>
            </ol>
        </div>
        <div class="row">
            <div class="col-sm-9">
                <div id="bloglist" class="row" style="position: relative;">
                    <c:forEach items="${associa}" var="associa">
                        <div class="col-sm-3">
                            <div class="blog-item">
                                <div class="blog-details">
                                    <h5 class="blog-title">
                                        <a href="${pageContext.request.contextPath}/origin/index?associaId=${associa.associaId}"><i
                                                class="fa fa-institution"></i> <ar:sub length="10"
                                                                                       value="${associa.associaName}"/></a>
                                    </h5>
                                    <ul class="blog-meta">
                                        <li>最近活动：<ar:dateTag value="${associa.ctime}" pattern="YYYY-MM-dd"></ar:dateTag>
                                        <li>成员：<a
                                                href="${pageContext.request.contextPath}/origin/members?associaId=${associa.associaId}">${associa.associaId}</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <%--outline div--%>
            <div class="col-sm-3" id="org-outline">
                <img src="/images/icon/loading/loader.gif"
                     class="center-block">
            </div>
            <%--outline div--%>
        </div>
    </section>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<script src="/script/org/org-institute.js"></script>
</html>