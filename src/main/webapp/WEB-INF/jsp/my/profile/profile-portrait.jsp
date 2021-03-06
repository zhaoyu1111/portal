<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
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
            <!-- Navigation tabs -->
            <ul class="nav nav-tabs">
                <li><a href="${pageContext.request.contextPath}/login/basic"><span
                        class="glyphicon glyphicon-th-list"></span>&nbsp;<strong>基本资料</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/job"><span
                        class="glyphicon glyphicon-briefcase"></span>&nbsp;<strong>工作信息</strong></a></li>
                <li class="active"><a href="javascript:;"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>头像设置</strong></a></li>
                <li><a href="${pageContext.request.contextPath}/login/album"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>个人相册</strong></a></li>
            </ul>
            <!-- Navigation Tab -->

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="tab-portrait">
                    <div class="col-md-5">
                        <form method="post" action="/login/avatar/upload" enctype="multipart/form-data">
                            <div class="panel-footer" id="picUploadBox">
                                <input class="file" type="file" id="uploadInput" multiple data-max-file-count="1"
                                       name="portrait" accept=".bmp,.jpg,.gif,.png,.jpeg"> <br>
                                <button class="btn btn-default btn-block" type="submit"><i class="fa fa-upload"></i>
                                    上传照片
                                </button>
                            </div>
                        </form>
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
<script src="/script/my/profile/profile-portrait.js"></script>
</html>