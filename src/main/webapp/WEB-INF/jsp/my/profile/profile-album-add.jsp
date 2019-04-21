<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                <form action="${pageContext.request.contextPath}/login/saveOrUpdate" method="post" id="album-form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">相册名称 <span class="asterisk">*</span></label>
                        <div class="col-sm-4">
                            <input type="text" name="albumName" id="albumName" class="form-control" required value="${album.albumName}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">相册描述 <span class="asterisk">*</span></label>
                        <div class="col-sm-4">
                            <textarea name="albumDesc" id="albumDesc" rows="5" class="form-control">${album.albumDesc}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">相册封面 </label>
                        <div class="col-sm-4" id="picUploadBox">
                            <input class="file" type="file" id="coverImg" multiple data-max-file-count="1"
                                   name="file" accept=".bmp,.jpg,.gif,.png,.jpeg"> <br>
                        </div>
                    </div>

                    <input type="hidden" value="${album.albumId}" name="albumId" id="albumId">

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-4">
                            <button class="btn btn-primary" type="button" onclick="addUserAlbum()"><c:if test="${album == null}">创 &nbsp;&nbsp; 建</c:if>
                                <c:if test="${album != null}">修 &nbsp;&nbsp; 改</c:if></button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-default" type="button"
                                    onclick="location.href='/login/album'">
                                取 &nbsp;&nbsp; 消
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- row -->
    </div>
    <%@ include file="../../portal-common/footer.jsp" %>
</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/my/profile/profile-album-add.js"></script>
</html>