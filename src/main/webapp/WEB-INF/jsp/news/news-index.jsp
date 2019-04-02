<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="/ar-taglib" prefix="ar" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>新闻中心-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../portal-common/portal-js.jsp" %>
<%@ include file="../portal-common/header.jsp" %>
<%@ include file="../portal-common/navmenu.jsp" %>
<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a>
                </li>
                <li class="active">新闻中心</li>
            </ol>
        </div>

        <div class="col-md-9">

            <!-- 校友新闻 -->
            <div class="panel panel-default panel-alt widget-messaging">
                <div class="panel-heading">
                    <div class="panel-btns">
                        <a href="${pageContext.request.contextPath}/forum" class="panel-edit"><i
                                class="fa fa-chevron-right"></i></a>
                    </div>
                    <h1 class="panel-title">校友新闻</h1>
                </div>
                <div class="panel-body">
                    <ul>
                        <c:forEach items="${article}" var="info">
                            <li>
                                <small class="pull-right">
                                    <ar:dateTag value="${info.ctime}" pattern="M月d日"></ar:dateTag>
                                </small>
                                <a href="${pageContext.request.contextPath}/article/detail?articleId=${info.articleId}">
                                    <h4
                                            class="sender">${info.title}</h4>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div><!-- panel-body -->
            </div><!-- panel -->
            <%--<%@include file="../portal-common/pagination.jsp" %>--%>
        </div>
        <!-- col-md-9 -->

        <div class="col-md-3" id="news-outline"></div>
    </section>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<script src="/script/news/news-index.js"></script>
</html>