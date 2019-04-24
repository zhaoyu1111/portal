$(function () {
    $("#nav-class").attr("class", "active");
    // 加载outline信息
    $.post("/class/outline", function (data) {
        $("#class-outline").html(data);
    });
});