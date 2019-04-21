<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<div class="fm-sidebar">

    <c:if test="${detail != null}">
        <h3 class="subtitle">最新捐赠信息</h3>
        <ul class="folder-list">
            <c:forEach items="${detail}" var="donationUser">
                <li>
                    <div class="media">
                        <a class="pull-left col-sm-4" style="max-height: 40px;"
                           href="${pageContext.request.contextPath}/login/userIndex?studentId=${donationUser.donationUid}">
                            <c:if test="${donationUser.avatar == null}">
                                <img class="thumbnail img-responsive" src="/images/school/nchu-l.png">
                            </c:if>
                            <c:if test="${donationUser.avatar != null}">
                                <img class="thumbnail img-responsive" src="${donationUser.avatar}">
                            </c:if>
                        </a>
                        <div class="media-body" style="max-height: 40px;">
                            <h6>${donationUser.grade}级校友</h6><a class="email-summary"
                               href="${pageContext.request.contextPath}/login/userIndex?studentId=${donationUser.donationUid}">${donationUser.donationName}</a>
                            <small class="text-muted">
                                捐赠时间&nbsp;<ar:dateTag value="${donationUser.utime}" pattern="yyyy-MM-dd"></ar:dateTag>
                            </small>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </c:if>
</div>