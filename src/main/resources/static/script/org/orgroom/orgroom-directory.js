$(function () {
    $("#directory-li").attr("class", "active");
    var originAddress = $("#originAddress").val();
    _pageBond(getContextPath() + "/directory?address=" + originAddress);
});