<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑相册-昌航校友录</title>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>

<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%@ include file="orgroom-pageheader.jsp" %>
    <div class="mb5"></div>
    <!-- nav tab -->
    <%@ include file="orgroom-nav.jsp" %>
    <!-- Tab panes -->
    <div class="tab-content" style="background-color: #ddd;">
        <form action="${pageContext.request.contextPath}/origin/album/saveOrUpdate" method="post" id="album-form" enctype="multipart/form-data">
            <div class="form-group">
                <label class="col-sm-2 control-label">相册名称 <span class="asterisk">*</span></label>
                <div class="col-sm-4">
                    <input type="text" value="${album.albumName}" name="albumName" id="albumName" class="form-control"
                           required/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">相册描述 <span class="asterisk">*</span></label>
                <div class="col-sm-4">
                    <textarea name="albumDesc" id="albumDesc" rows="5" class="form-control"
                              placeholder="相册描述 ...">${album.albumDesc}
                    </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">相册封面 </label>
                <div class="col-sm-4" id="picUploadBox">
                    <input class="file" type="file" id="coverImg" multiple data-max-file-count="1"
                           name="file" accept=".bmp,.jpg,.gif,.png,.jpeg"> <br>
                </div>
            </div>

            <input type="hidden" value="${orgroom.associaId}" name="originId" id="originId">
            <input type="hidden" value="${album.albumId}" name="albumId" id="albumId">

            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-4">
                    <button class="btn btn-primary" type="button" onclick="editAlbum()">保 &nbsp;&nbsp; 存</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-default" type="button"
                            onclick="location.href='origin/album?associaId=${orgroom.associaId}'">
                        取 &nbsp;&nbsp; 消
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/class/classroom/classroom-album.js"></script>
</html>