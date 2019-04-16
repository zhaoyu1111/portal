<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<%@ taglib uri="/ar-taglib" prefix="ar" %>


<h3 class="subtitle">热门新闻</h3>
<ul class="folder-list">
    <c:forEach items="${hotnews}" var="news">
        <li>
            <div class="media">
                <%--<c:if test="${hot.thumbImage != null && hot.thumbImage !=''}">
                    <a class="pull-left col-sm-4" style="max-height: 40px;"
                       href="news/detail.action?infoId=${hot.infoId}">
                        <img class="img-responsive" src="${hot.thumbImage}"></a>
                </c:if>--%>
                <div class="media-body" style="max-height: 40px;">
                    <a class="email-summary" href="${pageContext.request.contextPath}/article/detail?articleId=${news.articleId}">
                        <ar:sub value="${news.title}" length="20"></ar:sub>
                    </a>
                    <small class="text-muted">
                        发布于 ：<ar:dateTag value="${news.ctime}" pattern="yyyy-MM-dd"></ar:dateTag>
                    </small>
                    <a class="email-summary" href="${pageContext.request.contextPath}/article/detail?articleId=${news.articleId}">
                        <ar:sub value="${news.context}" length="20"></ar:sub>
                    </a>
                </div>
            </div>
        </li>
    </c:forEach>
</ul>
