$(function () {
    $("#album-li").attr("class", "active");
    var originId = $("#originId").val();
    _pageBond(getContextPath() + "/orgroom/album.action?originId=" + originId);
});

function deleteOrgAlbum(albumId) {
    // 确认框
    if (window.confirm("确定要删除这个相册吗？")) {
        // 参数校验
        if (isValid(albumId)) {
            var associaId = $('#originId').val();
            //调用方法 如  e
            post('/origin/album/delete', {'albumId': albumId, 'associaId': associaId});
        }
    }
}