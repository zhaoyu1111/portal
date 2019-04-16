<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的简历</span>
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
                <li><a href="${pageContext.request.contextPath}/recruit/queryUserRecruit"><span
                        class="fa fa-archive"></span>&nbsp;<strong>我的招聘</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/apply"><span
                        class="fa fa-chain"></span>&nbsp;<strong>我的投递</strong></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/resume"><span
                        class="fa fa-file-text-o"></span>&nbsp;<strong>我的简历</strong></a></li>
                <%--<li><a href="${pageContext.request.contextPath}/recruitUnit/queryMyUnit"><span
                        class="fa fa-institution"></span>&nbsp;<strong>我的单位</strong></a></li>--%>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <ul class="filemanager-options">
                    <li><a href="${pageContext.request.contextPath}/resume/addResume" class="itemopt"><i
                            class="fa fa-plus"></i> 登记简历</a></li>
                    <li><a href="" class="itemopt"></a></li>
                    <li><a href="" class="itemopt"></a></li>
                </ul>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>简历标题</th>
                            <th>职业类型</th>
                            <th>期望薪资</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${resume}" var="resume" varStatus="status">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/resume/detail?resumeId=${resume.resumeId}">${resume.resumeTitle}</a>
                                </td>
                                <td>${resume.careerType}</td>
                                <td>
                                    <c:forEach items="${salary}" var="salary">
                                        <c:if test="${resume.salary==salary.dictdataValue}">${salary.dictdataName}</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <div class="btn-group mr5">
                                        <button onclick="location='${pageContext.request.contextPath}/resume/detail?resumeId=${resume.resumeId}'"
                                                class="btn btn-sm btn-white tooltips" type="button"
                                                data-toggle="tooltip" title="详情"><i class="fa fa-bars"></i></button>
                                        <button onclick="location='${pageContext.request.contextPath}/resume/edit?resumeId=${resume.resumeId}'"
                                                class="btn btn-sm btn-white tooltips" type="button"
                                                data-toggle="tooltip" title="编辑"><i class="fa fa-edit"></i></button>
                                        <button onclick="deleteResume(${resume.resumeId})"
                                            <%--onclick="location='my/resume/delete.action?resumeId=${resume.resumeId}'"--%>
                                                class="btn btn-sm btn-white tooltips" type="button"
                                                data-toggle="tooltip" title="删除"><i class="fa fa-trash-o"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!-- table-responsive -->
            </div>
        </div>
        <!-- col-sm-8 -->
    </div>
    <!-- row -->
</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/my/recruit/resume.js"></script>
</html>