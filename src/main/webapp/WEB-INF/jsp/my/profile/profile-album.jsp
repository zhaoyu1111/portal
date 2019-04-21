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
                <li class="active"><a href="javascript:;"><span
                        class="glyphicon glyphicon-picture"></span>&nbsp;<strong>个人相册</strong></a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="tab-basic">
                    <form class="form" id="user-info-form" method="post"
                          action="${pageContext.request.contextPath}/my/profile/basic/update">
                        <div class="panel panel-default">
                            <h5 class="panel-title">个人相册</h5>
                        </div>

                        <div class="row filemanager">
                            <div class="col-xs-6 col-sm-4 col-md-3 document">
                                <div class="thmb" style="height: 228px">
                                    <a href="${pageContext.request.contextPath}/login/addAlbum">
                                        <div class="thmb-prev" style="height: 110px">
                                            <img src="${pageContext.request.contextPath}/images/icon/album/timg.jpg"
                                                 class="img-responsive center-block"/>
                                        </div>
                                    </a>
                                    <h5 class="fm-title">
                                        <a href="${pageContext.request.contextPath}/login/addAlbum">新建相册</a>
                                    </h5>
                                    <small class="text-muted">新建相册</small>
                                </div><!-- thmb -->
                            </div>
                            <c:forEach items="${album}" var="album">
                                <div class="col-xs-6 col-sm-4 col-md-3 document">
                                    <div class="thmb" style="height: 228px">
                                        <div class="btn-group fm-group">
                                            <button type="button" class="btn btn-default dropdown-toggle fm-toggle"
                                                    data-toggle="dropdown">
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu fm-menu" role="menu">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/login/image?albumId=${album.albumId}">
                                                        <i class="fa fa-picture-o"></i> 查看相册</a></li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/login/edit?albumId=${album.albumId}">
                                                        <i class="fa fa-edit"></i> 编辑相册</a></li>
                                                <li><a href="javascript:;" onclick="deleteUserAlbum(${album.albumId})"><i
                                                        class="fa fa-trash-o"></i>
                                                    删除相册</a></li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/login/upload?albumId=${album.albumId}"><i
                                                            class="fa fa-upload"></i> 上传照片</a></li>
                                            </ul>
                                        </div><!-- btn-group -->
                                        <a href="${pageContext.request.contextPath}/login/image?albumId=${album.albumId}">
                                            <div class="thmb-prev" style="height: 110px">
                                                <c:if test="${album.coverImg != null}">
                                                    <img src="${album.coverImg}" class="img-responsive center-block"/>
                                                </c:if>
                                                <c:if test="${album.coverImg == null}">
                                                    <img src="${pageContext.request.contextPath}/images/icon/album/nchu_title.jpg" class="img-responsive center-block"/>
                                                </c:if>
                                            </div>
                                        </a>
                                        <h5 class="fm-title">
                                            <a href="${pageContext.request.contextPath}/login/image?albumId=${album.albumId}">
                                                &nbsp;&nbsp;&nbsp;${album.albumName}</a>
                                        </h5>
                                        <small class="text-muted">&nbsp;&nbsp;&nbsp;&nbsp;更新于:<ar:dateTag value="${album.utime}" pattern="yyyy-MM-dd HH:mm"></ar:dateTag></small>
                                    </div><!-- thmb -->
                                </div>
                                <!-- col-xs-6 -->
                            </c:forEach>
                        </div><!-- file manager -->
                        <%@ include file="../../portal-common/pagination.jsp" %>
                    </form>
                </div>
            </div>
    </div>
    <!-- row -->
</div>
<%@ include file="../../portal-common/footer.jsp" %>
</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/my/profile/profile-album.js"></script>
<script>
    jQuery(document).ready(function () {

        jQuery('.thmb').hover(function () {
            var t = jQuery(this);
            t.find('.fm-group').show();
        }, function () {
            var t = jQuery(this);
            if (!t.closest('.thmb').hasClass('checked')) {
                t.find('.fm-group').hide();
            }
        });

    });

</script>
</html>