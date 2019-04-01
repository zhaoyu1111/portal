$(function () {
    $("#nav-recruit").attr("class", "active grid");

    var property = [{
        "title": "通信/电信",
        "value": 13
    },{
        "title": "财务/金融/保险",
        "value": 14
    },{
        "title": "专业服务",
        "value": 15
    },{
        "title": "服务业",
        "value": 16
    },{
        "title": "互联网/计算机",
        "value": 17
    },{
        "title": "零售/租赁",
        "value": 18
    },{
        "title": "房产",
        "value": 19
    },{
        "title": "重工/制造业",
        "value": 20
    },{
        "title": "通信/电子/电信",
        "value": 21
    },{
        "title": "能源/矿业/环保",
        "value": 22
    },{
        "title": "其他",
        "value": 23
    }];

    var propertyData = [{
        "title": "国企",
        "value": 1
    }, {
        "title": "私企",
        "value": 2
    }, {
        "title": "合资",
        "value": 3
    }, {
        "title": "其他",
        "value": 4
    }];

    var scale = [{
        "title": "50人以下",
        "value": 1
    }, {
        "title": "50-150人",
        "value": 2
    }, {
        "title": "150-500人",
        "value": 3
    }, {
        "title": "500-1000人",
        "value": 4
    }, {
        "title": "1000人以上",
        "value": 5
    }];


});

/* 投递简历 */
function postResume(recruitId) {
    if (!isValid($("#resumeId").val())) {
        errMsg("resumeId", "必选");
    } else {
        // 获取 resumeId
        var resumeId = $("#resumeId").val();
        // 投递简历, ajax异步刷新
        if (isValid(resumeId) && isValid(resumeId)) {
            // $.ajax({
            // type : 'POST',
            // url : 'resume/postResume.action',
            // data : "resumeId=" + resumeId + "&recruitId=" + recruitId,
            // success : function(data) {
            // location.href = data;
            // $("#postBtn").attr("onclick", "");
            // $("#postBtn").html("<i class='fa fa-check mr5'></i>申请成功");
            // },
            // error : function() {
            // alert("申请失败");
            // },
            // dataType : "json"
            // });
            // $.post('resume/postResume.action',{"resumeId":resumeId,"recruitId":
            // recruitId},function(data){
            // $('body').html(data);
            // });
            disableBtn("surePostostBtn");
            disableBtn("postBtn");
            $("#postForm").submit();
        }
    }
}

/* 投递简历 */
function cancelPostResume(recruitId) {
    if (!isValid($("#resumeId").val())) {
        errMsg("resumeId", "必选");
    } else {
        // 获取 resumeId
        var resumeId = $("#resumeId").val();
        // 投递简历, ajax异步刷新
        if (isValid(resumeId) && isValid(resumeId)) {
            disableBtn("surePostostBtn");
            disableBtn("postBtn");
            $("#postForm").submit();
        }
    }
}