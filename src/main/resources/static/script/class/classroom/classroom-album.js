$(function () {
    $("#album-li").attr("class", "active");

    $("#coverImg").fileinput({//初始化uploadfile控件
        language:'zh',
        uploadUrl:'/album/saveOrUpdate',//初始化url参数能否重新赋值
        allowedFileExtensions:['txt'],
        uploadAsync:true,//默认异步上传
        showUpload:true,//是否显示上传按钮
        showRemove:true,//显示移除按钮
        showPreview:true,//是否显示预览
        showCaption:false,
        browseClass:"btn btn-primary",//按钮样式
        dropZoneEnable:true,//是否显示拖拽区域
        maxFileCount:1,//允许同时上传的最大文件数
        enctype:'multipart/form-data',
        validateInitialCount:true,

        uploadExtraData:function(){//向后台传递参数
            var data={
                originId:$("#originId").val(),
                albumName:$("#albumName").val(),
                albumDesc:$("#albumDesc").val()
            };
            return data;
        },

    });

    // 相册翻页
    var classId = $("#classId").val();
    _pageBond(getContextPath() + "/classroom/album.action?classId=" + classId);
});

/**
 * 相册创建校验
 */
function addAlbum() {
    // 参数校验
    if (!isLength($('#albumName').val(), 2, 20)) {
        errMsg('albumName', '相册名称在2-20字符之间');
    } else if ($('#albumDesc').val().length > 200) {
        errMsg('albumDesc', '相册描述不能多余200字符');
    } else {
        $('#album-form').submit();
    }
}

/**
 * 相册编辑校验
 */
function editAlbum() {
    // 长度校验
    if (!isLength($('#albumName').val(), 2, 20)) {
        errMsg('albumName', '相册名称在2-20字符之间');
    } else if (!isLength($('#albumDesc').val(), 2, 200) || !isValid($('#albumDesc').val())) {
        errMsg('albumDesc', '相册描述在2-200字符之间');
    } else {
        $('#album-form').submit();
    }
}

/**
 * TODO 删除相册
 * @param albumId
 */
function deleteAlbum(albumId) {
    // 确认框
    if (window.confirm("确定要删除这个相册吗？")) {
        // 参数校验
        if (isValid(albumId)) {
            var classId = $('#classId').val();
            //调用方法 如  e
            post('/album/delete', {'albumId': albumId, 'classId': classId});
        }
    }
}

function deleteOrgAlbum(albumId) {
    // 确认框
    if (window.confirm("确定要删除这个相册吗？")) {
        // 参数校验
        if (isValid(albumId)) {
            var associaId = $('#associaId').val();
            //调用方法 如  e
            post('/origin/album/delete', {'albumId': albumId, 'associaId': associaId});
        }
    }
}