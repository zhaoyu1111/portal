<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<div class="fm-sidebar">

    <h3 class="subtitle">其他组织</h3>
    <ul class="folder-list">
        <c:forEach items="${other}" var="other">
            <li>
                <div class="media">
                    <div class="media-body" style="max-height: 40px;">
                        <a class="email-summary" href="${pageContext.request.contextPath}/origin/index?associaId=${other.associaId}">
                            <ar:sub value="${other.associaName}" length="20"></ar:sub>
                        </a>
                        <small class="text-muted">
                            创建于 ：<ar:dateTag value="${other.ctime}" pattern="yyyy-MM-dd"></ar:dateTag>
                        </small>
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