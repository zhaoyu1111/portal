<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>职业招聘-昌航校友录</title>
    <%@ include file="../portal-common/portal-meta.jsp" %>
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<%@ include file="../portal-common/header.jsp" %>
<%@ include file="../portal-common/navmenu.jsp" %>
<div class="banner-bottom">
    <div class="container higher" id="container">
        <section>
            <!-- 导航栏 -->
            <div class="header">
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/recruit">职业招聘</a></li>
                    <li class="active">发布招聘</li>
                </ol>
            </div>

            <div class="contentpane1">
                <div class="row">
                    <div class="col-md-12">
                        <%@ include file="../portal-common/instruction.jsp" %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">招聘信息</h4>
                            </div>
                            <div class="panel-body panel-body-nopadding">

                                <div id="progressWizard" class="basic-wizard">

                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="javascript:;" data-toggle=""><span>公司信息</span></a></li>
                                        <li class="active">
                                            <a href="#tab-recruit" data-toggle="tab"><span>招聘信息</span></a></li>
                                        <li><a href="javascript:;" data-toggle=""><span>完成发布</span></a></li>
                                    </ul>

                                    <div class="tab-content">
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-primary"
                                                 style="width: 67%" aria-valuemax="100" aria-valuemin="0"
                                                 aria-valuenow="40" role="progressbar"></div>
                                        </div>
                                        <div class="tab-pane active" id="tab-recruit">
                                            <form class="form" id="recruitForm" method="post"
                                                  action="${pageContext.request.contextPath}/recruit/addRecruit">
                                                <div class="panel panel-default">
                                                    <h5 class="panel-title">基本信息</h5>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3"><span class="asterisk">*
														</span>招聘标题</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="title" id="title" maxlength="20"
                                                               class="form-control tooltips" data-trigger="hover"
                                                               data-toggle="tooltip" data-original-title="2-20字"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3"><span class="asterisk">*
														</span>所招人数</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="members" id="members"
                                                               class="form-control" maxlength="4"
                                                               onkeyup='this.value=this.value.replace(/\D/gi,"")'/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3"><span class="asterisk">*
														</span>每月薪资</label>
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">￥</span><select
                                                                class="select2" name="salary" id="salary">
                                                            <option value="">--</option>
                                                            <c:forEach items="${salary}" var="salary">
                                                                <option value="${salary.dictdataValue}">${salary.dictdataName}</option>
                                                            </c:forEach>
                                                        </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="panel panel-default">
                                                    <h5 class="panel-title">职位信息</h5>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3"><span class="asterisk">*
														</span>职位名称</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="posName" id="posName"
                                                               class="form-control tooltips" data-trigger="hover"
                                                               data-toggle="tooltip" data-original-title="2-20字"
                                                               maxlength="20"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label"><span
                                                            class="asterisk">* </span>职位描述</label>
                                                    <div class="col-sm-9">
															<textarea rows="7" style="height: 150.4px;"
                                                                      name="posDescript" id="posDescript"
                                                                      class="form-control tooltips" data-trigger="hover"
                                                                      data-toggle="tooltip"
                                                                      data-original-title="20-500字"
                                                                      maxlength="500"></textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">职位福利</label>
                                                    <div class="col-sm-9">
                                                        <c:forEach items="${benefit}" var="benefit">
                                                            <div class="ckbox ckbox-primary"
                                                                 style="width: 20%; float: left;">
                                                                <input id="${benefit.dictdataValue}" name="welfare"
                                                                       type="checkbox"
                                                                       value="${benefit.dictdataName}">
                                                                <label for="${benefit.dictdataValue}">${benefit.dictdataName}</label>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3"><span class="asterisk">*
														</span>工作地点</label>
                                                    <div class="col-sm-9">
                                                        <div class="col-sm-12">
                                                            <input type="text" name="workPlace" id="workPlace"
                                                                   class="form-control tooltips" data-trigger="hover"
                                                                   data-toggle="tooltip" data-original-title="不超过50字"
                                                                   maxlength="50"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3">
                                                            <span class="asterisk">* </span>开始时间</label>
                                                        <div class="input-group date form_date col-sm-4" data-date="" data-date-format="dd MM yyyy"
                                                             data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                            <input type="text" name="endTime" readonly
                                                                   class="form-control" size="16">
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                            <span class="input-group-addon"><span
                                                                    class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input2" value=""/><br/>
                                                    </div>

                                                    <div class="panel panel-default">
                                                        <h5 class="panel-title">联系方式</h5>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3"><span class="asterisk">*
														</span>联系人</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="contractor" id="contractor"
                                                                   class="form-control tooltips" data-trigger="hover"
                                                                   data-toggle="tooltip" data-original-title="不超过20字"
                                                                   placeholder="联系人姓名" maxlength="20"/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3"><span class="asterisk">*
														</span>联系方式</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="mobile" id="mobile"
                                                                   class="form-control tooltips" data-trigger="hover"
                                                                   data-toggle="tooltip" data-original-title="不超过30字"
                                                                   placeholder="手机/固定电话" maxlength="30"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3"><span class="asterisk">*
														</span>投递邮箱</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="email" id="email"
                                                                   class="form-control tooltips" data-trigger="hover"
                                                                   data-toggle="tooltip" data-original-title="不超过30字"
                                                                   placeholder="手机/固定电话" maxlength="30"/>
                                                        </div>
                                                    </div>
                                            </form>
                                        </div>

                                    </div>
                                    <!-- tab-content -->

                                    <ul class="pager wizard">
                                        <li class="next">
                                            <a href="javascript:;" onclick="addRecruitSubmit()" id="submitBtn">提交审核</a>
                                        </li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<%@ include file="../portal-common/footer.jsp" %>
</body>
<%@ include file="../portal-common/portal-js.jsp" %>
<script src="/script/recruit/recruit-add.js"></script>
<script src="/script/portal-common/area.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>

<!--js初始化函数-->
<script type="text/javascript">
    //setup_address();
    $(function () {
        /* modal */
        $(".modal").click(function () {
            $('body').css({
                'margin-right': '0px'
            });
        });

        /* center modal */
        function centerModals() {
            $('.modal').each(
                function (i) {
                    var $clone = $(this).clone().css('display', 'block')
                        .appendTo('body');
                    var top = Math.round(($clone.height() - $clone.find(
                        '.modal-content').height()) / 3);
                    top = top > 0 ? top : 0;
                    $clone.remove();
                    $(this).find('.modal-content').css("margin-top", top);
                });
        }

        $('.modal').on('show.bs.modal', centerModals);
        setTimeout(function () {
            $(".goaway").fadeOut(1000);
        }, 2300);
        $(window).on('resize', centerModals);
    });
</script>

</html>