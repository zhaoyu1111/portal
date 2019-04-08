<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>校友捐赠-昌航校友录</title>
    <%@ include file="../portal-common/portal-js.jsp" %>
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
                    <li class="active">捐赠项目</li>
                </ol>
            </div>
            <div class="row">
                <div class="col-sm-9">
                    <h3>&nbsp;捐赠项目</h3>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table-primary mb30">
                            <thead>
                            <tr>
                                <th>项目名称</th>
                                <th>创建时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${donation}" var="donation">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/article/donationDetail?articleId=${donation.articleId}">${donation.title}</a>
                                    </td>
                                    <td><ar:dateTag value="${donation.ctime}" pattern="yyyy-MM-dd"></ar:dateTag>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${page.totalRows < 1}">
                        <div class="alert alert-info">
                            <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
                            <strong>抱歉，没有相关班级!</strong>
                        </div>
                    </c:if>
                    <c:if test="${page.totalRows > 0}">
                        <%@ include file="../portal-common/pagination.jsp" %>
                    </c:if>
                </div>
                <div class="col-sm-3" id="donation-outline"></div>
            </div>
        </section>
    </div>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<script src="/script/donation/donation.js"></script>
</html>