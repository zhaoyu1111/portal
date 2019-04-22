<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>个人主页</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="index">首页</a></li>
                <li class="active">个人中心</li>
            </ol>
        </div>
    </div>
    <div class="mb5"></div>
    <div class="row">
        <!-- 侧边栏 -->
        <div class="col-sm-4 col-lg-2">
            <%@ include file="my-side.jsp" %>
        </div>
        <!-- 侧边栏 -->

        <div class="col-sm-10">

            <div class="profile-header">
                <h2 class="profile-name">${user.userName}</h2>
                <div class="profile-location"><i class="fa fa-map-marker"></i> ${user.currentCity}</div>
                <div class="profile-position"><i class="fa fa-briefcase"></i> ${job.post} 任职于 <a href="">${unit.unitName}</a></div>

                <div class="mb20"></div>

            </div><!-- profile-header -->

            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified nav-profile">
                <li class="active"><a href="#activities" data-toggle="tab"><strong>主页</strong></a></li>
                <li><a href="#followers" data-toggle="tab"><strong>工作信息</strong></a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="activities">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-1">姓名:</div>
                                        <div class="col-xs-3">${user.userName}</div>
                                        <div class="col-xs-1">学号:</div>
                                        <div class="col-xs-3">${user.studentId}</div>

                                    </div>

                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-1">生日:</div>
                                        <div class="col-xs-3">${user.birthday}</div>
                                        <div class="col-xs-1">学院:</div>
                                        <div class="col-xs-3">${user.collegeId}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- 公司 -->

                            <br/>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-1">专业:</div>
                                        <div class="col-xs-3">${user.majorId}</div>
                                        <div class="col-xs-1">班级:</div>
                                        <div class="col-xs-3">${user.classId}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-1">邮箱:</div>
                                        <div class="col-xs-3">${user.email}</div>
                                        <div class="col-xs-2">所在城市:</div>
                                        <div class="col-xs-3">${user.currentCity}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-2">个人简介:</div>
                                        <div class="col-xs-4">${user.introduce}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- 职位 -->

                            <div class="mb40"></div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane" id="followers">

                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="subtitle subtitle-lined">公司</h3>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-2">所在公司:</div>
                                        <div class="col-sm-3">${unit.unitName}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- 公司 -->

                            <br/>

                            <h5 class="subtitle subtitle-lined">职位</h5>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-2">工作名称:</div>
                                        <div class="col-xs-3">${job.jobName}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-2">职位名称:</div>
                                        <div class="col-xs-3">${job.post}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-2">入职时间:</div>
                                        <div class="col-xs-3">${job.startTime}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-2">工作描述:</div>
                                        <div class="col-xs-9">${job.descrip}</div>
                                    </div>
                                </div>
                            </div>
                            <!-- 职位 -->
                            <br/>
                            <div class="mb40"></div>
                        </div>
                    </div>

                </div>
            </div><!-- tab-content -->

        </div><!-- col-sm-9 -->
        <!-- col-lg-10 -->
    </div>
    <!-- row -->
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<%@ include file="../portal-common/portal-js.jsp" %>
<script src="/script/my/my-index.js"></script>
</html>