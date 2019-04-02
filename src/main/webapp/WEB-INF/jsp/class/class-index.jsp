<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>班级录-昌航校友录</title>
    <%@ include file="../portal-common/portal-js.jsp" %>
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
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/class">主页</a>
                </li>
                <li class="active">班级录</li>
            </ol>
        </div>
        <div class="row">
            <div class="col-sm-9">
                <%@ include file="query-form.jsp" %>

                <h3>&nbsp;班级录</h3>
                <hr>
                <div id="bloglist" class="row" style="position: relative;">
                    <c:forEach items="${grade}" var="grade">
                        <div class="col-sm-3">
                            <div class="blog-item">
                                <div class="blog-details">
                                    <h4 class="blog-title">
                                        <a
                                                href="${pageContext.request.contextPath}/class/queryClasses?grade=${grade.grade}">${grade.grade}级</a>
                                    </h4>
                                    <ul class="blog-meta">
                                        <li>创建于:<ar:dateTag value="${grade.ctime}" pattern="yyyy-MM-dd"></ar:dateTag>
                                            </li>
                                        <li><a
                                                href="${pageContext.request.contextPath}/class/queryClasses?selectStr=${grade.grade}">${grade.classCount}个班级</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-sm-3" id="class-outline"></div>
        </div>
    </section>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<script src="/script/class/class-index.js"></script>
</html>