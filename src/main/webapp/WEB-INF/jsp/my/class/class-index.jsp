<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-信电校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>我的班级</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/login/basic">个人中心</a></li>
                <li class="active">我的班级</li>
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

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">

                    <%--班级列表--%>
                    <div class="people-list">
                            <div class="col-md-6">
                                <div class="people-item">
                                    <div class="media">
                                        <a href="${pageContext.request.contextPath}/class/classDetail?classId=${myclass.classId}"
                                           class="pull-left"
                                           style="color: black">
                                            <h1><i class="fa fa-mortar-board"></i></h1>
                                        </a>
                                        <div class="media-body">
                                            <a href="${pageContext.request.contextPath}/class/classDetail?classId=${myclass.classId}"
                                               style="color: black">
                                                <h4 class="person-name">${myclass.className}</h4>
                                            </a>
                                            <div class="text-muted">
                                                <i class="fa fa-users"></i>班级成员： ${count}
                                            </div>
                                            <div class="text-muted">
                                                <i class="fa fa-calendar"></i>最近活动：
                                                <ar:dateTag value="${myclass.utime}" pattern="YYYY-MM-dd"></ar:dateTag>
                                            </div>
                                            <ul class="social-list">
                                                <c:if test="${myclass==null}">
                                                    <li><a href="javascript:;" class="tooltips" data-toggle="tooltip"
                                                           data-placement="top" title="手机："><i
                                                            class="fa fa-mobile"></i></a></li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- col-md-6 -->
                    </div>

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
<script src="/script/my/class/class-index.js"></script>
</html>