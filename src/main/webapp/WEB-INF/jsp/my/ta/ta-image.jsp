<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>${user.userName}的主页-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>${user.userName}的主页</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                <li class="active">个人中心</li>
            </ol>
        </div>
    </div>
    <div class="mb5"></div>
    <div class="row">
        <div class="col-sm-3">
            <img src="${user.avatar}" class="thumbnail img-responsive" alt=""/>

            <div class="mb30"></div>

            <h5 class="subtitle">关于${user.userName}</h5>
            <p class="mb30">${user.introduce}</p>

            <h5 class="subtitle">联系方式</h5>
            <ul class="profile-social-list">
                <li><i class="fa fa-qq"></i> <a href="javascript:;">${user.qq}</a></li>
                <li><i class="fa fa-wechat"></i> <a href="javascript:;">${user.wechat}</a></li>
                <li><i class="fa fa-weibo"></i> <a href="javascript:;">${user.tikTok}</a></li>
            </ul>

            <div class="mb30"></div>

            <h5 class="subtitle">地址</h5>
            <address>
                ${user.homeAddress}<br>
                <abbr title="电话">电话:</abbr> ${user.mobile}
            </address>

        </div><!-- col-sm-3 -->
        <div class="col-sm-9">

            <div class="profile-header">
                <h2 class="profile-name">${user.userName}</h2>
                <div class="profile-location"><i class="fa fa-map-marker"></i> ${user.currentCity}</div>
                <div class="profile-position"><i class="fa fa-briefcase"></i> ${job.post} 任职于 <a href="">${unit.unitName}</a></div>

                <div class="mb20"></div>

            </div><!-- profile-header -->

            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified nav-profile">
                <li><a href="#activities" data-toggle="tab"><strong>主页</strong></a></li>
                <li><a href="#followers" data-toggle="tab"><strong>工作信息</strong></a></li>
                <li class="active"><a href="javascript:history.back(-1)<%--${pageContext.request.contextPath}/login/userIndex?studentId=${user.studentId}--%>"><strong>个人相册</strong></a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane" id="activities">
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
                                        <div class="col-xs-3">
                                            <h4>${job.jobName }</h4>
                                        </div>
                                    </div>
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
                                        <div class="col-xs-2">离职时间:</div>
                                        <div class="col-xs-3">${job.endTime}</div>
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
                <div class="tab-pane active" id="following">

                    <div class="row filemanager">
                        <div class="row filemanager">
                            <c:forEach items="${images}" var="image">
                                <div class="col-xs-6 col-sm-4 col-md-3 document">
                                    <div class="thmb" style="min-height: 200px; text-align: center">
                                        <div class="ckbox ckbox-default">
                                            <input type="checkbox" id="check${image.imageId}" name="imageId" value="${image.imageId}"/>
                                            <label for="check${image.imageId}"></label>
                                        </div>
                                        <div class="btn-group fm-group">
                                            <button type="button" class="btn btn-default dropdown-toggle fm-toggle"
                                                    data-toggle="dropdown">
                                                <span class="caret"></span>
                                            </button>
                                        </div><!-- btn-group -->
                                        <a href="${image.imageUrl}" id="image_pre_${image.imageId}" data-rel="prettyPhoto">
                                            <div class="thmb-prev" style="height: 110px">
                                                <img src="${image.imageUrl}" class="img-responsive"/>
                                            </div>
                                        </a>
                                        <small class="text-muted">上传于:<ar:dateTag value="${image.ctime}" pattern="yyyy-MM-dd HH:m"></ar:dateTag></small>
                                    </div><!-- thmb -->
                                </div>
                                <!-- col-xs-6 -->
                            </c:forEach>
                        </div>
                        <%@ include file="../../portal-common/pagination.jsp" %>
                </div>
            </div><!-- tab-content -->

        </div><!-- col-sm-9 -->
    </div>
    <!-- row -->
</div>

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/my/ta/ta-index.js"></script>
</html>