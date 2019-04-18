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
                <li><a href="index">主页</a></li>
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
                <li><a href="${pageContext.request.contextPath}/login/basic"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>基本资料</strong></a></li>
                <li class="active"><a href="javascript:;"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/avatar"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
            </ul>
            <!-- Nav Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                    <form class="form" id="user-info-form" method="post"
                          action="${pageContext.request.contextPath}/login/jobUpdate">
                        <div class="panel panel-default">
                            <h5 class="panel-title">基本信息</h5>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2"><span class="asterisk">*
														</span> 所在公司</label>
                            <div class="col-sm-4">
                                <select class="select2" name="unitId" id="unitId">
                                    <option value="">--</option>
                                    <c:forEach items="${unit}" var="unit">
                                        <option value="${unit.unitId}"
                                                <c:if test="${job.unitId==unit.unitId}">selected</c:if>>
                                                    ${unit.unitName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>工作名称</label>
                            <div class="col-sm-4">
                                <input type="text" name="jobName" id="jobName" value="${job.jobName}"
                                       maxlength="50" class="form-control tooltips" data-trigger="hover"
                                       data-toggle="tooltip" data-original-title="2-50字"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>职位名称</label>
                            <div class="col-sm-4">
                                <input type="text" name="post" id="post" value="${job.post}"
                                       maxlength="50" class="form-control tooltips" data-trigger="hover"
                                       data-toggle="tooltip" data-original-title="2-50字"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>开始时间</label>
                            <div class="input-group date form_date col-sm-4" data-date="" data-date-format="dd MM yyyy"
                                 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                <input type="text" name="startTime" readonly
                                       value="${job.startTime}"
                                       class="form-control" size="16">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="hidden" id="dtp_input2" value=""/><br/>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2">
                                <span class="asterisk">* </span>结束时间</label>
                            <div class="input-group date form_date col-sm-4" data-date="" data-date-format="dd MM yyyy"
                                 data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
                                <input type="text" name="endTime" readonly
                                       value="${job.endTime}"
                                       class="form-control" size="16">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="hidden" id="dtp_input1" value=""/><br/>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><span
                                    class="asterisk">* </span>工作描述</label>
                            <div class="col-sm-7">
															<textarea rows="7" style="height: 150.4px;"
                                                                      name="descrip" id="descrip"
                                                                      class="form-control tooltips" data-trigger="hover"
                                                                      data-toggle="tooltip" data-original-title=不超过500字"
                                                                      maxlength="500">${job.descrip}</textarea>
                            </div>
                        </div>
                        <input hidden name="studentId" id="studentId" value="${job.studentId}">
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
    <!-- row -->
</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/my/profile/profile-job.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
</html>