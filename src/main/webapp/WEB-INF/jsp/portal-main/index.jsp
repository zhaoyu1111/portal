<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页-信电校友录</title>
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
        <div class="item active"><img src="/images/school/xzit-front-wide.jpg"></div>
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
                <h4 class="panel-title">校友新闻</h4>
            </div>
            <div class="panel-body padding0">

                <c:forEach items="${inews}" var="info">
                    <a href="${pageContext.request.contextPath}/news/detail.action?infoId=${info.infoId}"
                       class="photoday">
                        <img src="${info.thumbImage}" alt=""/>
                    </a>
                    <div class="photo-details">
                        <a href="${pageContext.request.contextPath}/news/detail.action?infoId=${info.infoId}">
                            <h5 class="photo-title"><%--<ar:sub value="${info.infoTitle}" length="20"></ar:sub>--%></h5>
                        </a>
                        <small class="text-muted">
                            发布于 ：<fmt:formatDate value="${info.createTime}" pattern="M月d日"></fmt:formatDate>
                        </small>
                    </div>
                    <hr>
                </c:forEach>

            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #D8DBDE">
                <h4 class="panel-title">快速导航</h4>
            </div>
            <div class="panel-body text-center nopadding">
                <br>
                <a href="${pageContext.request.contextPath}/recruit/addRecruit.action" class="btn btn-warning-alt">
                    发布招聘 </a>
                <a href="${pageContext.request.contextPath}/post/add.action" class="btn btn-warning-alt"> 发布新帖 </a>
                <a class="btn btn-warning-alt"> 我的简历 </a>
                <hr>
                <a href="${pageContext.request.contextPath}/my/class.action" class="btn btn-info-alt"> 我的班級 </a>
                <a href="${pageContext.request.contextPath}/my/recruit.action" class="btn btn-info-alt"> 我的招聘 </a>
                <a href="${pageContext.request.contextPath}/my/resume.action" class="btn btn-info-alt"> 我的简历 </a>
                <hr>
            </div>
        </div>
    </div>

    <!--col-md-4    2-->
    <div class="col-md-6">
        <div class="panel panel-default panel-alt widget-messaging">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="${pageContext.request.contextPath}/forum.action" class="panel-edit"><i
                            class="fa fa-chevron-right"></i></a>
                </div>
                <h1 class="panel-title">校友新闻</h1>
            </div>
            <div class="panel-body">
                <ul>
                    <c:forEach items="${news}" var="info">
                        <li>
                            <small class="pull-right">
                                <fmt:formatDate value="${info.createTime}" pattern="M月d日"></fmt:formatDate>
                            </small>
                            <a href="${pageContext.request.contextPath}/news/detail.action?infoId=${info.infoId}"><h4
                                    class="sender">${info.infoTitle}</h4>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div><!-- panel-body -->
        </div><!-- panel -->

        <div class="mb30"></div>

        <div class="panel panel-default panel-alt widget-messaging">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="${pageContext.request.contextPath}/forum.action" class="panel-edit"><i
                            class="fa fa-chevron-right"></i></a>
                </div>
                <h2 class="panel-title">热门话题</h2>
            </div>
            <div class="panel-body">
                <ul>
                    <c:forEach items="${posts}" var="post">
                        <li>
                            <small class="pull-right">
                                <fmt:formatDate value="${post.createTime}" pattern="M月d日"></fmt:formatDate>
                            </small>
                            <a href="${pageContext.request.contextPath}/post/detail.action?postId=${post.infoId}"><h4
                                    class="sender">${post.infoTitle}</h4>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div><!-- panel-body -->
        </div><!-- panel -->
    </div>

    <!--col-md-4   3-->
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #D8DBDE">
                <h4 class="panel-title">热门招聘</h4>
            </div>
            <div class="panel-body padding0 about-list">
                <ul>
                    <c:forEach items="${recruits}" var="recruit">
                        <li>
                            <a href="${pageContext.request.contextPath}/recruit/detailRecruit.action?recruitId=${recruit.recruitId}">
                                <%--<ar:sub value="${recruit.title}" length="15"></ar:sub>--%>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <br>
        <h3 class="subtitle">最新加入校友</h3>
        <ul class="folder-list">
            <c:forEach items="${latestMembers}" var="member">
                <li>
                    <div class="media">
                        <a class="pull-left col-sm-4" style="max-height: 40px;"
                           href="${pageContext.request.contextPath}/ta/show.action?userId=${member.userId}">
                            <img class="thumbnail img-responsive" src="${member.imgPath}"></a>
                        <div class="media-body" style="max-height: 40px;">
                            <a class="email-summary"
                               href="${pageContext.request.contextPath}/ta/show.action?userId=">${member.trueName}</a>
                            <small class="text-muted"><fmt:formatDate value="${member.createTime}"
                                                                      pattern="yyyy-MM-dd HH:mm"/>&nbsp; 加入
                            </small>
                            <a class="email-summary"
                               href="${pageContext.request.contextPath}/classroom.action?classId=${member.originId}">${member.originName}</a>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>

<%@ include file="../portal-common/footer.jsp" %>
</body>
<script src="/script/portal-main/index.js"></script>
</html>