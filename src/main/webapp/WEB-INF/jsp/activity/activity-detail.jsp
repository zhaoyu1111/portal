<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<%@ taglib uri="/ar-taglib" prefix="ar" %>
<!DOCTYPE html>
<html>
<head>
    <title>活动详情-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../portal-common/portal-js.jsp" %>
<%@ include file="../portal-common/header.jsp" %>
<%@ include file="../portal-common/navmenu.jsp" %>
<div class="container higher" id="container">
    <section>
        <!-- 导航栏 -->
        <div class="header">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a></li>
                <li></i>&nbsp;<a href="${pageContext.request.contextPath}/activity">校友活动</a></li>
                <li class="active">活动详情</li>
            </ol>
        </div>

        <div class="col-md-9">
            <div class="row blog-content">
                <div class="panel panel-default panel-blog">
                    <div class="panel-body">
                        <h3 class="blogsingle-title">${detail.activityName}</h3>
                        <ul class="blog-meta">
                            <li><ar:dateTag value="${detail.ctime}" pattern="Y-M-d HH:mm"></ar:dateTag></li>
                            <li><i class="fa fa-eye"></i> 浏览 ${detail.interests} </li>
                        </ul>
                        <br/>
                        <div class="col-sm-12">
                            <h3 class="subtitle subtitle-lined">描述</h3>
                            <div class="row">
                                <div class="col-sm-12">
                                    ${detail.activityDesc}
                                </div>
                            </div>
                            <br/>
                            <h3 class="subtitle subtitle-lined">详情</h3>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-1" style="width: 13.33333%">活动名称:</div>
                                        <div class="col-xs-4">${detail.activityName}</div>
                                        <div class="col-xs-1" style="width: 13.33333%">活动地点:</div>
                                        <div class="col-xs-4">${detail.activityAddr}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-1" style="width: 13.33333%">活动开始时间:</div>
                                        <div class="col-xs-4">${detail.startTime}</div>
                                        <div class="col-xs-1" style="width: 13.33333%">活动结束时间:</div>
                                        <div class="col-xs-4">${detail.endTime}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-1" style="width: 13.33333%">活动人数:</div>
                                        <div class="col-xs-4">${detail.activityNumber}</div>
                                        <div class="col-xs-1" style="width: 13.33333%">感兴趣数:</div>
                                        <div class="col-xs-4">${detail.interests}</div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-xs-1" style="width: 13.33333%">报名人数:</div>
                                        <div class="col-xs-4">${detail.signNumber}</div>
                                        <div class="col-xs-1" style="width: 13.33333%">当前状态:</div>
                                        <div class="col-xs-4">
                                            <c:if test="${detail.status == 2}">
                                                正在进行
                                            </c:if>
                                            <c:if test="${detail.status == 3}">
                                                已结束
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 职位 -->

                            <br/>

                            <h3 class="subtitle subtitle-lined">联系</h3>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-xs-3">联系人:${detail.leaderName }</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3">联系方式:${detail.leaderMobile }</div>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <div class="btn-group mr10">
                                <c:if test="${detail.status == 2}">
                                    <c:if test="${apply == null && SESSION_USER.studentId != null}">
                                        <button class="btn btn-primary" type="button" id="postBtn"
                                                data-toggle="modal" data-target="#resume-selector"
                                                id="postBtn">
                                            <i class="fa fa-user mr5"></i> 活动申请
                                        </button>
                                    </c:if>
                                    <c:if test="${apply == null && SESSION_USER.studentId == null}">
                                        <button class="btn btn-primary" type="button" id="postBtn"
                                                data-toggle="modal" onclick="window.location.href='/login'"
                                                id="postBtn">
                                            <i class="fa fa-user mr5"></i> 活动申请
                                        </button>
                                    </c:if>
                                    <c:if test="${apply != null}">
                                        <button class='btn btn-primary'>
                                            <i class='fa fa-check mr5'></i>已经申请
                                        </button>
                                    </c:if>
                                </c:if>
                                <c:if test="${detail.status == 3}">
                                    <button class='btn btn-primary' disabled>
                                        <i class='fa fa-check mr5'></i>已结束
                                    </button>
                                </c:if>
                            </div>

                            <div class="modal fade" id="resume-selector" tabindex="-1"
                                 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">活动申请</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form" method="post" id="postForm"
                                                  action="${pageContext.request.contextPath}/activity/apply">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-sm-2"><span class="asterisk">*
															</span>手机号</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="mobile" id="mobile" maxlength="11" class="form-control tooltips" data-trigger="hover"
                                                                   data-toggle="tooltip" data-original-title="正确的手机号"/>

                                                            <br/> <br/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2"><span class="asterisk">*
															</span>邮箱</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="email" id="email" class="form-control tooltips" data-trigger="hover"
                                                                   data-toggle="tooltip" data-original-title="正确的邮箱"/>

                                                            <br/> <br/>
                                                        </div>
                                                    </div>
                                                    <input class="text" type="hidden" name="activityId" value="${detail.activityId}"/>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">取消申请
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postApply()"
                                                    id="surePostostBtn">确认申请
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <div class="mb40"></div>
                        </div>
                    </div>
                </div><!-- panel -->
            </div><!-- row -->
        </div>
        <!-- col-md-9 -->

        <input type="hidden" name="activityId" id="activityId" value="${detail.activityId}">
        <div class="col-md-3" id="activity-detail-outline"></div><!-- col-sm-2 -->

    </section>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<script src="/script/activity/activity-detail.js"></script>
</html>