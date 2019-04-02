<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="/ar-taglib" prefix="ar" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../portal-common/portal-js.jsp" %>
<%@ include file="../portal-common/header.jsp" %>
<%@ include file="../portal-common/navmenu.jsp" %>

<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active"><img src="/images/school/nchu-l.png"></div>
        <%--<div class="item"><img src="${pageContext.request.contextPath}/assets/images/school/xzit-south.jpg"></div>--%>
        <div class="item"><img src="/images/school/xzit-motto.jpg"></div>
        <div class="item"><img src="/images/school/xzit-library.jpg"></div>
        <div class="item"><img src="/images/school/xzit-alumni.jpg"></div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control focus-navigation left" href="#myCarousel" data-slide="prev">
        <br><br><br><br><br><br><br><br><br><br><i class="fa fa-chevron-left"></i>
    </a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">
        <br><br><br><br><br><br><br><br><br><br><i class="fa fa-chevron-right"></i>
    </a>
</div>
<!--container    -->
<br>
<div class="container higher" id="container">
    <!--col-md-4   1-->
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #D8DBDE">
                <h4 class="panel-title">校友活动</h4>
            </div>
            <div class="panel-body padding0">

                <c:forEach items="${activity}" var="activity">
                    <a href="${pageContext.request.contextPath}/article/detail?activityId=${activity.activityId}"
                       class="photoday">
                        <%--<img src="${article}" alt=""/>--%>
                    </a>
                    <div class="photo-details">
                        <a href="${pageContext.request.contextPath}/article/detail?articleId=${activity.activityId}">
                            <h5 class="photo-title"><ar:sub value="${activity.activityName}" length="20"></ar:sub></h5>
                        </a>
                        <small class="text-muted">
                            当前状态 ：<c:if test="${activity.status == 1}">
                                正在进行...
                                </c:if>
                                <c:if test="${activity.status == 2}">
                                    已结束
                                </c:if>
                        </small>
                        <br>
                        <small class="text-muted">
                            发布于 ：<ar:dateTag value="${activity.ctime}" pattern="M月d日"></ar:dateTag>
                        </small>
                    </div>
                    <hr>
                </c:forEach>

            </div>
        </div>
    </div>

    <!--col-md-4    2-->
    <div class="col-md-6">
        <div class="panel panel-default panel-alt widget-messaging">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="${pageContext.request.contextPath}/article" class="panel-edit"><i
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
                            <a href="${pageContext.request.contextPath}/article/detail?articleId=${info.articleId}"><h4
                                    class="sender">${info.title}</h4>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div><!-- panel-body -->
        </div><!-- panel -->

        <div class="mb30"></div>

    </div>

    <!--col-md-4   3-->
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #D8DBDE">
                <h4 class="panel-title">热门招聘</h4>
            </div>
            <div class="panel-body padding0 about-list">
                <ul>
                    <c:forEach items="${recruit}" var="recruit">
                        <li>
                            <a href="${pageContext.request.contextPath}/recruit/detailRecruit?recuritId=${recruit.recuritId}">
                                <ar:sub value="${recruit.title}" length="15"></ar:sub>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>

<%@ include file="../portal-common/footer.jsp" %>
</body>
<script src="/script/portal-main/index.js"></script>
</html>