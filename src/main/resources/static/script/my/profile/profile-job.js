$(function () {
    $("#my-profile").attr("class", "active");

    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: 'yyyy-mm-dd'
    });
});

/**
 * TODO 删除用户工作信息
 * @param jobId jobId
 */
function deleteJob(jobId) {
    if (window.confirm('确定删除这条信息？')) {
        // 提交删除
        post(getContextPath() + "/my/profile/job/delete.action", {"jobId": jobId});
    }
}

function updateUserInfo() {
    if (!isLength($("#jobName").val(), 2, 20)) {
        errMsg("jobName", "工作名称在2-20字之间");
    } else if (!isLength($("#post").val(), 2, 20)) {
        errMsg("post", "职位名称在2-20字之间");
    } else if (!isValid($("#unitId").val())) {
        errMsg("unitId", "请选择所在公司");
    }  else if (!isLength($("#dtp_input2").val())) {
        errMsg("dtp_input2", "请选择日期");
    } else if (!isLength($("#descrip").val(), 0, 500)) {
        errMsg("descrip", "个人简介不超过500字");
    } else if (isValid($("#studentId").val())) {
        $('#user-info-form').submit();
    }
}