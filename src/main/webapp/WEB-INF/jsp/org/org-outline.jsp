<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<div class="fm-sidebar">
    <h3 class="subtitle">校友组织信息</h3>
    <ul class="folder-list">
        <li><i class="fa fa-institution"></i>
            院系分会总数&nbsp;:&nbsp;${alumniCount}&nbsp;个</li>
        <li><i class="fa fa-users"></i>已加入校友&nbsp;:&nbsp;${userCount}&nbsp;位校友</li>
    </ul>

    <div class="mb30"></div>

    <h3 class="subtitle">人气排行</h3>
    <ul class="folder-list">
        <c:forEach items="${orgSort}" var="orgSort">
            <li><a href="orgroom/index?originId=${orgSort.associaId}">
                <i class="fa fa-graduation-cap"></i>${orgSort.associaName} (${orgSort.count}人)</a>
            </li>
        </c:forEach>
    </ul>

    <div class="mb30"></div>

    <h3 class="subtitle">最新活动</h3>
    <ul class="folder-list">
        <c:forEach items="${activity}" var="activity">
            <li>
                <div class="media">

                    <div class="media-body" style="max-height: 40px;">
                        <a class="email-summary" href="${pageContext.request.contextPath}/activity/detail?activityId=${activity.activityId}">
                            <ar:sub value="${activity.activityName}" length="20"></ar:sub>
                        </a>
                        <small class="text-muted">
                            发布于 ：<ar:dateTag value="${activity.ctime}" pattern="yyyy-MM-dd"></ar:dateTag>
                        </small>
                        <a class="email-summary" href="${pageContext.request.contextPath}/activity/detail?activityId=${activity.activityId}">
                            地址：<ar:sub value="${activity.activityAddr}" length="20"></ar:sub>
                        </a>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
    <%--<h3 class="subtitle">我加入的</h3>
    <c:if test="${SESSION_USER != null && myOrgs != null}">
        <ul class="folder-list">
            <c:forEach items="${myOrgs}" var="myOrg">
                <li><a href="${pageContext.request.contextPath}/orgroom.action?originId=${myOrg.originId}">
                    <i class="fa fa-graduation-cap"></i>${myOrg.originName}</a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${SESSION_USER != null && (myOrgs == null || myOrgs.size()==0)}">
        <div class="alert alert-info">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>您尚未加入<ar:dictdata dictdata="${originType}" dict="ot"></ar:dictdata>！</strong>
        </div>
    </c:if>

    <div class="mb30"></div>

    <c:if test="${latestMembers!=null}">
        <h3 class="subtitle">最新加入校友</h3>
        <ul class="folder-list">
            <c:forEach items="${latestMembers}" var="member">
                <li>
                    <div class="media">
                        <a class="pull-left col-sm-4" style="max-height: 40px;"
                           href="${pageContext.request.contextPath}/ta/show.action?userId=${member.userId}">
                            <img class="thumbnail img-responsive" src="${member.imgPath}"></a>
                        <div class="media-body" style="max-height: 40px;">
                            <a class="email-summary"
                               href="${pageContext.request.contextPath}/ta/show.action?userId=">${member.trueName}</a>
                            <small class="text-muted">
                                <fmt:formatDate value="${member.createTime}" pattern="yyyy-MM-dd HH:mm"/>&nbsp; 加入
                            </small>
                            <a class="email-summary"
                               href="${pageContext.request.contextPath}/classroom.action?classId=${member.originId}">${member.originName}</a>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </c:if>--%>
</div>