<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人简历-信电校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的简历</span><span>简历详情</span>
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
                <div class="panel-heading">
                    <h4 class="panel-title"><i class="fa fa-bars"></i> 简历详情</h4>
                </div>
                <div class="panel-body panel-body-nopadding">

                    <div id="progressWizard" class="basic-wizard">

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-recruit">
                                <form class="form" id="resumeForm" method="post"
                                      action="${pageContext.request.contextPath}/resume/addResumeSubmit">

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">简历信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">简历标题：</label>
                                        <div class="col-sm-4">${resume.resumeTitle}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">职业类型：</label>
                                        <div class="col-sm-4">${resume.careerType}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">期望工资：</label>
                                        <div class="col-sm-4">
                                            <c:forEach items="${salary}" var="salary">
                                                <c:if test="${resume.salary==salary.dictdataValue}">${salary.dictdataName}</c:if>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">个人信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">姓名</label>
                                        <div class="col-sm-4">${resume.userName}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">性别</label>
                                        <div class="col-sm-4">
                                            <c:forEach items="${gender}" var="gender">
                                                <c:if test="${resume.gender==gender.dictdataValue}">${gender.dictdataName}</c:if>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">现居住地</label>
                                        <div class="col-sm-7">${resume.currentCity}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">联系方式</label>
                                        <div class="col-sm-4">${resume.mobile}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">个人简介</label>
                                        <div class="col-sm-7">${resume.descrip}</div>
                                    </div>

                                </form>
                            </div>

                        </div>
                        <!-- tab-content -->

                        <ul class="pager wizard">
                            <li>
                                <a href="${pageContext.request.contextPath}/resume/edit?resumeId=${resume.resumeId}">编辑</a>
                            </li>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <li><a href="javascript:;" onclick="deleteResume(${resume.resumeId})">删除</a></li>
                        </ul>
                    </div>
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
<script src="/script/my/recruit/resume.js"></script>
</html>