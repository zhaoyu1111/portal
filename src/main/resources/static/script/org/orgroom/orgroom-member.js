$(function () {
    $("#member-li").attr("class", "active");
    var originAddress = $("#originAddress").val();
    _pageBond(getContextPath() + "/member?address=" + originAddress);
});