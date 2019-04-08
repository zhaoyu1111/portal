$(function () {
    $("#nav-class").attr("class", "active");
    // 加载outline信息
    $.post("/donation/outline", function (data) {
        $("#donation-outline").html(data);
    });
});