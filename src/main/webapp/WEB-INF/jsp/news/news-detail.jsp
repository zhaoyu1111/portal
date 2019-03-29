<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<%@ taglib uri="/ar-taglib" prefix="ar" %>
<!DOCTYPE html>
<html>
<head>
    <title>新闻中心-昌航校友录</title>
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
                <li class="active">新闻中心</li>
            </ol>
        </div>

        <div class="col-md-9">
            <div class="row blog-content">
                <div class="panel panel-default panel-blog">
                    <div class="panel-body">
                        <h3 class="blogsingle-title">${article.title}</h3>
                        <ul class="blog-meta">
                            <li><ar:dateTag value="${article.ctime}" pattern="Y-M-d HH:mm"></ar:dateTag></li>
                            <li><i class="fa fa-eye"></i> 浏览 ${article.count} </li>
                            <li>作者:${article.author} </li>
                            <li>来源:${article.source} </li>
                        </ul>
                        <br/>
                        <p>${article.context}</p><%-- postId --%>
                    </div>
                </div><!-- panel -->
            </div><!-- row -->
        </div>
        <!-- col-md-9 -->

        <div class="col-md-3" id="news-detail-outline"></div><!-- col-sm-2 -->

    </section>
</div>

<%@ include file="../portal-common/footer.jsp" %>

</body>
<script src="/script/news/news-detail.js"></script>
</html>