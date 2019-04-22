<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>发布招聘-昌航校友录</title>
	<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
	<%@ include file="../../portal-common/portal-meta.jsp"%>
	<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../../portal-common/header.jsp"%>

	<%@ include file="../../portal-common/navmenu.jsp"%>


	<div class="banner-bottom">
		<div class="container higher" id="container">
			<section>
				<!-- 导航栏 -->
				<div class="header">
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a href="index">主页</a></li>
						<li><a href="${pageContext.request.contextPath}/recruit">职业招聘</a></li>
						<li class="active">发布招聘</li>
					</ol>
				</div>

				<div class="contentpanel">

					<div class="row">

						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">填写招聘信息</h4>
									<p>公司信息</p>
								</div>
								<div class="panel-body panel-body-nopadding">

									<!-- BASIC WIZARD -->
									<div id="progressWizard" class="basic-wizard">

										<ul class="nav nav-pills nav-justified">
											<li class="active"><a href="#tab-unit" data-toggle="tab"><span>公司信息</span></a></li>
											<li><a href="javascript:;" data-toggle="tab"><span>招聘信息</span></a></li>
											<li><a href="javascript:;" data-toggle="tab"><span>完成发布</span></a></li>
										</ul>

										<div class="tab-content">
											<div class="progress progress-striped active">
												<div class="progress-bar progress-bar-primary"
													style="width: 33%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="40" role="progressbar"></div>
											</div>

											<div class="tab-pane active" id="tab-unit">
												<form class="form" id="unitForm" method="post"
													action="${pageContext.request.contextPath}/recruitUnit/addUnit">
													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司名称</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text" value="${unit.unitName}"
																name="unitName" id="unitName" data-trigger="hover"
																data-toggle="tooltip" data-original-title="公司名称不超过30字符"
																maxlength="30" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>所属行业</label>
														<div class="col-sm-4">
															<select class="select2" name="industry" id="industry">
																<option value="">--</option>
																<c:forEach items="${industry}" var="industry">
																	<option value="${industry.dictdataValue }"
																			<c:if test="${unit.industry == industry.dictdataValue}">selected</c:if>>${industry.dictdataName }</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司性质</label>
														<div class="col-sm-4">
															<select class="select2" name="property" id="property">
																<option value="">--</option>
																<c:forEach items="${property}" var="property">
																	<option value="${property.dictdataValue}"
																			<c:if test="${unit.property == property.dictdataValue}">selected</c:if>>${property.dictdataName}</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司规模</label>
														<div class="col-sm-4">
															<select class="select2" name="scale" id="scale">
																<option value="">--</option>
																<c:forEach items="${scale}" var="scale">
																	<option value="${scale.dictdataValue }"
																			<c:if test="${unit.scale == scale.dictdataValue}">selected</c:if>>${scale.dictdataName }</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label"><span
															class="asterisk">* </span>公司描述</label>
														<div class="col-sm-7">
															<textarea rows="7" style="height: 150.4px;"
																name="direct" id="direct" placeholder="50-500字"
																class="form-control tooltips" data-trigger="hover"
																data-toggle="tooltip" data-original-title="50-500字"
																maxlength="500">${unit.direct}</textarea>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4">公司网站</label>
														<div class="col-sm-7">
															<div class="input-group mb15">
																<span class="input-group-addon">HTTP://</span><input
																	class="form-control tooltips" type="text" value="${unit.unitWeb}"
																	name="unitWeb" id="unitWeb" data-trigger="hover"
																	data-toggle="tooltip" data-original-title="公司网站不超过30字符"
																	maxlength="30">
															</div>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>公司地址</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text" value="${unit.address}"
																   name="address" id="address" data-trigger="hover"
																   data-toggle="tooltip" data-original-title="公司地址不超过30字符"
																   maxlength="30" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>联系人</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text" value="${unit.contractor}"
																   name="contractor" id="contractor" data-trigger="hover"
																   data-toggle="tooltip" data-original-title="请输入正确的联系人"
																   maxlength="5" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>联系人电话</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text" value="${unit.mobile}"
																   name="mobile" id="mobile" data-trigger="hover"
																   data-toggle="tooltip" data-original-title="请输入正确的电话"
																   maxlength="11" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>工作名称</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text" value="${job.jobName}"
																   name="jobName" id="jobName" data-trigger="post"
																   data-toggle="tooltip" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4"><span class="asterisk">*
														</span>职位名称</label>
														<div class="col-sm-4">
															<input class="form-control tooltips" type="text" value="${job.post}"
																   name="post" id="post" data-trigger="post"
																   data-toggle="tooltip" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4">
															<span class="asterisk">* </span>开始时间</label>
														<div class="input-group date form_date col-sm-4" data-date="" data-date-format="dd MM yyyy"
															 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
															<input type="text" name="startTime" readonly
																   value="${job.startTime}"
																   class="form-control" size="16">
															<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
															<span class="input-group-addon"><span
																	class="glyphicon glyphicon-calendar"></span></span>
														</div>
														<input type="hidden" id="dtp_input2" value="${job.startTime}"/><br/>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label"><span
																class="asterisk">* </span>职位描述</label>
														<div class="col-sm-7">
															<textarea rows="7" style="height: 150.4px;"
																	  name="descrip" id="descrip" placeholder="50-500字"
																	  class="form-control tooltips" data-trigger="hover"
																	  data-toggle="tooltip" data-original-title="50-500字"
																	  maxlength="500">${job.descrip}</textarea>
														</div>
													</div>

													<c:if test="${unit != null}">
														<div class="form-group">
															<label class="col-sm-4"><span class="asterisk">*
														</span>当前状态</label>
															<div class="col-sm-4">
																<h5 style="color: red"><c:if test="${unit.status == 1}">
																	公司信息正在审核
																</c:if> </h5>
															</div>
														</div>
													</c:if>

													<input type="hidden" value="1" name="isRecruiting">
													<input type="hidden" value="${unit.unitId}" name="unitId" id="unitId"/>
												</form>
											</div>


										</div>
										<!-- tab-content -->

										<ul class="pager wizard">
											<li class="next"><a href="javascript:;"
												onclick="Submit()">下一步</a></li>
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

	<%@ include file="../../portal-common/footer.jsp"%>

</body>
<%@ include file="../../portal-common/portal-js.jsp"%>
<script src="/script/recruit/unit/unit-add.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
</html>