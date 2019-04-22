$(function () {

    $("#unitName").focus();

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

function Submit() {
    errClean();
    /* 表单校验 */
    if (!isValid($("#unitName").val())) {
        errMsg("unitName", "公司名称不能为空");
        return;
    } else if (!isValid($("#industry").val())) {
        errMsg("industry", "公司所属行业不能为空");
        return;
    } else if (!isValid($("#property").val())) {
        errMsg("property", "公司性质不能为空");
        return;
    } else if (!isValid($("#scale").val())) {
        errMsg("scale", "公司规模不能为空");
        return;
    } else if (!isLength($("#direct").val(), 50, 500)) {
        errMsg("direct", "公司描述在50-500字");
        return;
    }else if (!isValid($("#contractor").val())) {
        errMsg("contractor", "联系人不能为空");
        return;
    }else if (!isLength($("#mobile").val(), 11, 11)) {
        errMsg("mobile", "请输入正确的电话号码");
        return;
    }else if (!isValid($("#jobName").val())) {
        errMsg("jobName", "工作名称不能为空");
        return;
    }else if (!isValid($("#post").val())) {
        errMsg("post", "职位名称不能为空");
        return;
    }else if (!isValid($("#dtp_input2").val())) {
        errMsg("dtp_input2", "请选择日期");
        return;
    } else {
        $("#unitForm").submit();
    }

}
