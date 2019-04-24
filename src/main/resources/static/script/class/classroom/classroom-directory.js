$(function () {
    $("#directory-li").attr("class", "active");
    var classId = $("#classId").val();
    _pageBond(getContextPath() + "/directory?classId=" + classId);
});