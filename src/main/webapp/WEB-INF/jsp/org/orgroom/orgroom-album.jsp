<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${orgroom.associaName}相册-信电校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>

<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%@ include file="orgroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="orgroom-nav.jsp" %>
    <input type="hidden" value="${orgroom.associaId}" id="associaId">
    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">

        <div class="row filemanager">

            <div class="col-xs-6 col-sm-4 col-md-3 document">
                <div class="thmb" style="height: 228px">
                    <a href="${pageContext.request.contextPath}/origin/album/add?associaId=${orgroom.associaId}">
                        <div class="thmb-prev" style="height: 170px">
                            <img src="${pageContext.request.contextPath}/images/icon/album/timg.jpg"
                                 class="img-responsive center-block"/>
                        </div>
                    </a>
                    <h5 class="fm-title">
                        <a href="${pageContext.request.contextPath}/origin/album/add?associaId=${orgroom.associaId}">新建相册</a>
                    </h5>
                    <small class="text-muted">新建班级相册</small>
                </div><!-- thmb -->
            </div>

            <c:forEach items="${page.records}" var="album">
                <div class="col-xs-6 col-sm-4 col-md-3 document">
                    <div class="thmb" style="height: 228px">
                        <div class="btn-group fm-group">
                            <button type="button" class="btn btn-default dropdown-toggle fm-toggle"
                                    data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu fm-menu" role="menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/origin/album/image?albumId=${album.albumId}&associaId=${orgroom.associaId}">
                                        <i class="fa fa-picture-o"></i> 查看相册</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/origin/album/edit?albumId=${album.albumId}&associaId=${orgroom.associaId}">
                                        <i class="fa fa-edit"></i> 编辑相册</a></li>
                                <li><a href="javascript:;" onclick="deleteOrgAlbum(${album.albumId})"><i
                                        class="fa fa-trash-o"></i>
                                    删除相册</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/origin/album/upload?albumId=${album.albumId}&associaId=${orgroom.associaId}"><i
                                            class="fa fa-upload"></i> 上传照片</a></li>
                            </ul>
                        </div><!-- btn-group -->
                        <a href="${pageContext.request.contextPath}/origin/album/image?albumId=${album.albumId}&associaId=${orgroom.associaId}">
                            <div class="thmb-prev" style="height: 170px">
                                <c:if test="${album.coverImg != null}">
                                    <img src="${album.coverImg}" class="img-responsive center-block"/>
                                </c:if>
                                <c:if test="${album.coverImg == null}">
                                    <img src="${pageContext.request.contextPath}/images/icon/album/nchu_title.jpg" class="img-responsive center-block"/>
                                </c:if>
                            </div>
                        </a>
                        <h5 class="fm-title">
                            <a href="${pageContext.request.contextPath}/origin/album/image?albumId=${album.albumId}&associaId=${orgroom.associaId}">
                                &nbsp;&nbsp;&nbsp;${album.albumName}</a>
                        </h5>
                        <small class="text-muted">&nbsp;&nbsp;&nbsp;&nbsp;更新于:<ar:dateTag value="${album.utime}" pattern="yyyy-MM-dd HH:mm"></ar:dateTag></small>
                    </div><!-- thmb -->
                </div>
                <!-- col-xs-6 -->
            </c:forEach>
        </div><!-- file manager -->
        <%@ include file="../../portal-common/pagination.jsp" %>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/org/orgroom/orgroom-album.js"></script>
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