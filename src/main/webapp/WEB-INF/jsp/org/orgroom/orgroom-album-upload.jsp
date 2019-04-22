<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>上传照片-昌航校友录</title>
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
        <form method="post" action="${pageContext.request.contextPath}/origin/album/image/upload"
              enctype="multipart/form-data">

            <div class="panel-footer" id="picUploadBox">
                <input class="file" type="file" id="uploadInput" multiple data-max-file-count="12"
                       name="images" accept=".bmp,.jpg,.gif,.png,.jpeg"> <br>
                <button class="btn btn-default btn-block" type="submit"><i class="fa fa-upload"></i> 上传照片</button>
                <input hidden id="associaId" name="associaId" value="${orgroom.associaId}">
                <input hidden id="albumId" name="albumId" value="${album.albumId}">
            </div>
        </form>
    </div>
    <!-- Tab panes -->

</div>
<!-- container -->

<%@ include file="../../portal-common/footer.jsp" %>

</body>
<%@ include file="../../portal-common/portal-js.jsp" %>
<script src="/script/class/classroom/classroom-album-upload.js"></script>
</html>