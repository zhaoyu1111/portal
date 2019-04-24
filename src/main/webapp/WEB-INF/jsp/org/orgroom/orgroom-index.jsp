<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../portal-common/portal-tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${orgroom.associaName}-昌航校友录</title>
    <%@ include file="../../portal-common/portal-js.jsp" %>
    <%@ include file="../../portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="../../portal-common/header.jsp" %>
<div class="container higher" id="container">
    <%--org pageheader--%>
    <%@include file="orgroom-pageheader.jsp" %>

    <!-- nav tab -->
    <%@ include file="orgroom-nav.jsp" %>

    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane active" id="classroom-content">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">校友会简介：</h4>
                    </div>
                    <div class="panel-body">
                        <blockquote>
                            <i class="fa fa-quote-left"></i>
                            <c:if test="${orgroom.descrip!=''&&orgroom.descrip!=null}">
                                <p>${orgroom.descrip}</p>
                            </c:if>
                            <c:if test="${orgroom.descrip=='' || orgroom.descrip==null}">
                                <p>(暂无简介)</p>
                            </c:if>
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col-sm-3" id="org-other">
                <img src="/images/icon/loading/loader.gif"
                     class="center-block">
            </div>
        </div>
    </div>
    <!-- Tab panes -->
</div>
<!-- container -->
<%@ include file="../../portal-common/footer.jsp" %>
</body>
<script src="/script/org/orgroom/orgroom-index.js"></script>
<script>
    $(function () {
        $.post("/origin/otherOrg", function (data) {
            $("#org-other").html(data);
        });
    });
</script>
</html>