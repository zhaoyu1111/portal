<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classInfo.grade}级${classInfo.className}班级成员-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>

<%@ include file="../portal-common/header.jsp" %>
<%@ include file="../portal-common/navmenu.jsp"%>

<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a>
                </li>
                <li class="active">杰出校友</li>
            </ol>
        </div>
        <div class="row">
            <div class="col-sm-9">
                <h3>&nbsp;杰出校友</h3>
                <hr>
                <div class="col-md-13">
                    <div class="panel panel-default panel-alt widget-messaging">
                        <div class="panel-body">
                            <ul>
                                <c:forEach items="${alumni}" var="alumni">
                                    <li>
                                        <small class="pull-right">
                                            <ar:dateTag value="${alumni.ctime}" pattern="M月d日"></ar:dateTag>
                                        </small>
                                        <a href="${pageContext.request.contextPath}/article/detail?articleId=${alumni.articleId}"><h4
                                                class="sender">${alumni.title}</h4>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div><!-- panel-body -->
                    </div><!-- panel -->

                    <div class="mb30"></div>

                </div>
            </div>
            <div class="col-sm-3" id="class-outline"></div>
        </div>
    </section>
</div>
<!-- container -->

<%@ include file="../portal-common/footer.jsp" %>

</body>
<%@ include file="../portal-common/portal-js.jsp" %>
<script src="/script/alumni/alumni-index.js"></script>
</html>