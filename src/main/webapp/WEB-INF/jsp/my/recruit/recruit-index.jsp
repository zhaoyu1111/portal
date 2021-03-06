<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的招聘-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的招聘</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
                <li class="active">个人中心</li>
            </ol>
        </div>
    </div>
    <div class="mb5"></div>
    <div class="row">
        <!-- 侧边栏 -->
        <div class="col-sm-4 col-lg-2">
            <%@ include file="../my-side.jsp" %>
        </div>
        <!-- 侧边栏 -->

        <div class="col-sm-8 col-lg-10">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="${pageContext.request.contextPath}/recruit/queryUserRecruit"><span
                        class="fa fa-archive"></span>&nbsp;<strong>我的招聘</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/apply"><span
                        class="fa fa-chain"></span>&nbsp;<strong>我的投递</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/resume"><span
                        class="fa fa-file-text-o"></span>&nbsp;<strong>我的简历</strong></a></li>
                <%--<li><a href="${pageContext.request.contextPath}/recruitUnit/queryMyUnit"><span
                        class="fa fa-institution"></span>&nbsp;<strong>我的单位</strong></a></li>--%>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>招聘标题</th>
                                <th>简历投递</th>
                                <th>发布时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${myrecruit}" var="recruit">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/recruit/detailRecruit?recuritId=${recruit.recuritId}">${recruit.title}</a>
                                    </td>
                                    <td>${recruit.resumes}</td>
                                    <td><ar:dateTag value="${recruit.ctime}" pattern="YYYY-MM-DD HH:mm"></ar:dateTag>
                                    <td>
                                        <div class="btn-group mr5">
                                            <button onclick="location='${pageContext.request.contextPath}/recruit/detailRecruit?recuritId=${recruit.recuritId}'"
                                                    class="btn btn-sm btn-white tooltips" type="button"
                                                    data-toggle="tooltip" title="详情"><i class="fa fa-bars"></i></button>
                                            <button onclick="deleteMyRecruit(${recruit.recuritId})"
                                                    class="btn btn-sm btn-white tooltips" type="button"
                                                    data-toggle="tooltip" title="删除"><i class="fa fa-trash-o"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- table-responsive -->

                    <%--<%@include file="../../portal-common/pagination.jsp" %>--%>

                </div>
            </div>
        </div>
    </div>
    <!-- row -->
</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/my/recruit/recruit.js"></script>
</html>