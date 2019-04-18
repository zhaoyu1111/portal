<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${classInfo.className}相册-信电校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
    <link rel="stylesheet" href="/css/prettyPhoto.css"/>
</head>

<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">

    <%@ include file="classroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="classroom-nav.jsp" %>
    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">

        <ul class="filemanager-options">
            <li>
                <div class="ckbox ckbox-default">
                    <input type="checkbox" id="selectall" value="1"/>
                    <label for="selectall">全选</label>
                </div>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/album/upload?albumId=${album.albumId}&classId=${classInfo.classId}"
                   class=""><i class="fa fa-upload"></i> 上传照片</a></li>
            <li><a href="javascript:;" class="itemopt disabled"><i class="fa fa-download"></i> 下载选中</a></li>
            <li><a href="javascript:;" class="itemopt disabled"><i class="fa fa-trash-o"></i> 删除选中</a></li>
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
                                    <a href="${pageContext.request.contextPath}/album/download?fileRelPath=${image.imageUrl}&fileName=${image.imageName}">
                                        <i class="fa fa-download"></i> 下载照片</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/album/image/delete?classId=${classInfo.classId}&albumId=${album.albumId}&imageId=${image.imageId}">
                                        <i class="fa fa-trash-o"></i> 删除照片</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/album/coverImg?classId=${classInfo.classId}&albumId=${album.albumId}&imageId=${image.imageId}">
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

        <input type="hidden" value="${classInfo.classId}" id="classId">
        <input type="hidden" value="${album.albumId}" id="albumId">
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/js/jquery.prettyPhoto.js"></script>
<script src="/script/class/classroom/classroom-album-image.js"></script>
</html>