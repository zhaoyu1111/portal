$(function () {
    $("#member-li").attr("class", "active");
    var classId = $("#classId").val();
    _pageBond(getContextPath() + "/member?classId=" + classId);
});