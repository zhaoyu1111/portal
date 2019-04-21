<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>个人资料</span>
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
                <li class="active"><a href="javascript:;"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>基本资料</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/job"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/avatar"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/album"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>个人相册</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">
                    <form class="form" id="user-info-form" method="post"
                          action="${pageContext.request.contextPath}/my/profile/basic/update">
                        <div class="panel panel-default">
                            <h5 class="panel-title">基本信息</h5>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><span class="asterisk">*</span> 性别 </label>
                            <div class="col-sm-9">
                                <div class="rdio rdio-primary">
                                    <input type="radio" id="m" value="0" name="sex"
                                           <c:if test="${info.gender == '0'}">checked</c:if> />
                                    <label for="m">男</label>
                                </div><!-- rdio -->
                                <div class="rdio rdio-primary">
                                    <input type="radio" id="f" value="1" name="sex"
                                           <c:if test="${info.gender == '1'}">checked</c:if> />
                                    <label for="f">女</label>
                                </div><!-- rdio -->
                            </div>
                        </div><!-- form-group -->

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>生日</label>
                            <div class="input-group date form_date col-sm-4" data-date="" data-date-format="dd MM yyyy"
                                 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                <input type="text" name="birthdayString" readonly
                                       value="${info.birthday}"
                                       class="form-control" size="16">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="hidden" id="dtp_input2" value=""/><br/>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>住址</label>
                            <div class="col-sm-4">
                                <input type="text" name="address" id="address" value="${info.homeAddress}"
                                       maxlength="50" class="form-control tooltips" data-trigger="hover"
                                       data-toggle="tooltip" data-original-title="2-50字"/>
                            </div>
                        </div>


                        <br>

                        <div class="panel panel-default">
                            <h5 class="panel-title">社交信息</h5>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>电话</label>
                            <div class="col-sm-4">
                                <input type="text" name="phone" id="phone" value="${info.mobile}"
                                       maxlength="20" class="form-control tooltips" data-trigger="hover"
                                       data-toggle="tooltip" data-original-title="8-20字"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>邮箱</label>
                            <div class="col-sm-4">
                                <input type="email" name="email" id="email" value="${info.email}"
                                       maxlength="50" class="form-control tooltips" data-trigger="hover"
                                       data-toggle="tooltip" data-original-title="2-50字符"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2"></label>
                            <div class="col-sm-4">
                                <button class="btn btn-primary" onclick="updateUserInfo()">保存更改</button>
                            </div>
                        </div>

                    </form>
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
<script src="/script/my/profile/profile-basic.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
</html>