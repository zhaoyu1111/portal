$(function () {
    $("#nav-donation").attr("class", "active");
    // 加载outline信息

    _pageBond(getContextPath() + "/donation");

    $.post("/donation/outline", function (data) {
        $("#donation-outline").html(data);
    });
});