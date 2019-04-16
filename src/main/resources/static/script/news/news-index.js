$(function () {
    $("#nav-news").attr("class", "active grid");

    // 分页器绑定
    /*_pageBond(getContextPath() + "/article");*/

    $.post("/article/newsOutline", function (data) {
        $('#news-outline').html(data);
    })
});
