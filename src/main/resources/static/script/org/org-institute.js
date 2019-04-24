$(function () {
    $("#nav-origin").attr("class", "active");
    $("#org-tab-li-institute").attr("class", "active");
    // 加载outline信息
    $.post("/origin/outline", function (data) {
        $("#org-outline").html(data);
    });
});










