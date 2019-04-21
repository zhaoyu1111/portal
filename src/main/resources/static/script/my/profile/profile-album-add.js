$(function () {
    $("#album-li").attr("class", "active");

});
function addUserAlbum() {
    // 参数校验
    if (!isLength($('#albumName').val(), 2, 20)) {
        errMsg('albumName', '相册名称在2-20字符之间');
    } else if ($('#albumDesc').val().length > 200) {
        errMsg('albumDesc', '相册描述不能多余200字符');
    } else {
        $('#album-form').submit();
    }
}