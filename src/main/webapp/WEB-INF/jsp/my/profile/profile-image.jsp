<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
    <link rel="stylesheet" href="/css/prettyPhoto.css"/>
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
                <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
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
                <li><a href="${pageContext.request.contextPath}/login/job"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/avatar"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/login/album"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>个人相册</strong></a></li>
            </ul>

            <div class="tab-content">
                <ul class="filemanager-options">
                    <li>
                        <div class="ckbox ckbox-default">
                            <input type="checkbox" id="selectall" value="1"/>
                            <label for="selectall">全选</label>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/login/upload?albumId=${album.albumId}"
                           class=""><i class="fa fa-upload"></i> 上传照片</a></li>
                    <%--<li><a href="javascript:;" class="itemopt disabled"><i class="fa fa-download"></i> 下载选中</a></li>--%>
                    <li><a href="javascript:;" class="itemopt disabled" onclick="deleteChexkImage('${album.albumId}')"><i class="fa fa-trash-o"></i> 删除选中</a></li>
                    <li class="filter-type"><span style="font-size: 16px">${album.albumName} &nbsp; | &nbsp;
                <ar:dateTag value="${album.ctime}" pattern="yyyy-MM-dd HH:mm"></ar:dateTag>
                </span></li>
                </ul>

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
                                    <ul class="dropdown-menu fm-menu" role="menu">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/login/download?fileRelPath=${image.imageUrl}&fileName=${image.imageName}">
                                                <i class="fa fa-download"></i> 下载照片</a></li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/login/image/delete?albumId=${album.albumId}&imageId=${image.imageId}">
                                                <i class="fa fa-trash-o"></i> 删除照片</a></li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/login/coverImg?albumId=${album.albumId}&imageId=${image.imageId}">
                                                <i class="fa fa-trash-o"></i> 设为封面</a></li>
                                    </ul>
                                </div><!-- btn-group -->
                                <a href="${image.imageUrl}" id="image_pre_${image.imageId}" data-rel="prettyPhoto">
                                    <div class="thmb-prev" style="height: 170px">
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

                <input type="hidden" value="${album.albumId}" id="albumId">
            </div>
        </div>
        <!-- row -->
    </div>
    <%@ include file="../../portal-common/footer.jsp" %>
</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/js/jquery.prettyPhoto.js"></script>
<script src="/script/my/profile/profile-image.js"></script>
</html>