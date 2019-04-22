$(function () {
    $("#nav-recruit").attr("class", "active grid");

    // 文本框获取焦点
    $("#title").focus();
    $("#posDesc").html("岗位职责: \n任职资格: \n工作时间: ");

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

function addRecruitSubmit() {
    if (!isLength($("#title").val(), 2, 20)) {
        errMsg("title", "招聘标题在2-20字之间");
    } else if (!isNumber($("#members").val()) || $("#members").val() < 1) {
        errMsg("members", "请正确输入招聘人数");
    } else if (!isValid($("#salary").val())) {
        errMsg("salary", "请选择每月薪资");
    } else if (!isLength($("#posName").val(), 2, 20)) {
        errMsg("posName", "职位名称在2-20字之间");
    } else if (!isLength($("#posDescript").val(), 20, 500)) {
        errMsg("posDescript", "职位描述在20-500字之间");
    } else if (!isLength($("#workPlace").val(), 2, 50)) {
        errMsg("workPlace", "工作地点在2-50字之间");
    } else if (!isLength($("#contractor").val(), 2, 20)) {
        errMsg("contractor", "联系人称呼在2-20字之间");
    } else if (!isLength($("#mobile").val(), 8, 30)) {
        errMsg("mobile", "联系方式在8-30字之间");
    }else if (!isLength($("#email").val(), 8, 30)) {
        errMsg("email", "联系方式在8-30字之间");
    }else if (!isValid($("#dtp_input2").val())) {
        errMsg("dtp_input2", "请选择日期");
    } else {
        $("#recruitForm").submit();
    }
}