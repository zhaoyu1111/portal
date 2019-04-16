<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-信电校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的简历</span><span>登记简历</span>
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
                    <h4 class="panel-title"><i class="fa fa-plus"></i> 登记简历</h4>
                </div>
                <div class="panel-body panel-body-nopadding">

                    <div id="progressWizard" class="basic-wizard">

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-recruit">
                                <form class="form" id="resumeForm" method="post"
                                      action="${pageContext.request.contextPath}/resume/saveOrUpdate">

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">职位信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 简历标题</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="resumeTitle" id="resumeTitle" maxlength="20"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="2-20字"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 职业类型</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="careerType" id="profType" maxlength="20"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="2-20字"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 期望工资</label>
                                        <div class="col-sm-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">￥</span>
                                                <select class="select2" name="salary" id="expSalary">
                                                    <option value="">--</option>
                                                    <c:forEach items="${salary}" var="salary">
                                                        <option value="${salary.dictdataValue}">${salary.dictdataName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">个人信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="userName" id="name"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="2-10字"
                                                   maxlength="10"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*</span> 性别</label>
                                        <div class="col-sm-4">
                                            <div class="rdio rdio-primary">
                                                <input type="radio" value="1" id="1" name="gender" checked/>
                                                <label for="1">女</label>
                                            </div>
                                            <div class="rdio rdio-primary">
                                                <input type="radio" value="0" id="0" name="gender">
                                                <label for="0">男</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*
														</span>现居住地</label>
                                        <div class="col-sm-7">
                                            <input type="text" name="currentCity" id="domicile"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="必填，且不超过50字"
                                                   maxlength="50"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4"><span class="asterisk">*
														</span>联系方式</label>
                                        <div class="col-sm-4">
                                            <input type="text" name="mobile" id="contact"
                                                   class="form-control tooltips" data-trigger="hover"
                                                   data-toggle="tooltip" data-original-title="必填，且不超过30字"
                                                   placeholder="手机/固定电话" maxlength="30"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label"><span
                                                class="asterisk">* </span>个人简介</label>
                                        <div class="col-sm-7">
                                            <textarea rows="7" style="height: 150.4px;" name="descrip" id="introduce"
                                                      class="form-control tooltips" data-trigger="hover"
                                                      data-toggle="tooltip" data-original-title=不超过500字"
                                                      maxlength="500"></textarea>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                        <!-- tab-content -->

                        <ul class="pager wizard">
                            <li><a href="javascript:;" onclick="addResumeSubmit()" id="submitBtn">提交</a></li>
                            &nbsp;&nbsp;&nbsp;
                            <li><a href="${pageContext.request.contextPath}/resume" id="cancelBtn">放弃</a></li>
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