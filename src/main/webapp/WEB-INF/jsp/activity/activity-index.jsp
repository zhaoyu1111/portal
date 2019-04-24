<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>校友活动-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../portal-common/header.jsp" %>

<%@ include file="../portal-common/navmenu.jsp" %>


<div class="banner-bottom">
    <div class="container higher" id="container">
        <section>
            <!-- 导航栏 -->
            <div class="header">
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a>
                    </li>
                    <li class="active">校友活动</li>
                </ol>
            </div>

            <div class="page-header">
                <%--<%@ include file="recruit-button.jsp"%>--%>
                <h3>活动中心</h3>
            </div>
            <%--<div class="page-header">
                <%@ include file="../forum/forum-button.jsp" %>
            </div>--%>
            <!-- 	<p>论坛帖子</p> -->
            <div class="table-responsive">
                <div class="dataTables_wrapper no-footer">
                    <table class="table table-striped" id="table">

                        <thead>
                        <tr>
                            <th>活动名称</th>
                            <th>活动负责人</th>
                            <th>活动人数</th>
                            <th>活动开始时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.records}" var="activity">
                            <tr>
                                <td id="${activity.activityId}">&nbsp;<a
                                        href="${pageContext.request.contextPath}/activity/detail?activityId=${activity.activityId}">${activity.activityName}</a>
                                    <ar:top value="${activity.ctime}"/>
                                </td>
                                <td>${activity.leaderName}</td>
                                <td>${activity.activityNumber}</td>
                                <td><ar:dateTag value="${activity.startTime}" pattern="M月d日"></ar:dateTag>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%@ include file="../portal-common/pagination.jsp" %>
            </div>

        </section>
    </div>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<%@ include file="../portal-common/portal-js.jsp" %>
<script src="/script/forum/forum-index.js"></script>
</html>