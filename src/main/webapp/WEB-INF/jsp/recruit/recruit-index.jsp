<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../portal-common/portal-tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>职业招聘-信电校友录</title>
<%@ include file="../portal-common/portal-meta.jsp"%>
</head>
<body>
	<%@ include file="../portal-common/header.jsp"%>

	<%@ include file="../portal-common/navmenu.jsp"%>


	<div class="banner-bottom">
		<div class="container higher" id="container">
			<section>
				<!-- 导航栏 -->
				<div class="header">
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath}/index">主页</a></li>
						<li class="active">职业招聘</li>
					</ol>
				</div>

				<div class="page-header">
					<%@ include file="recruit-button.jsp"%>
					<h3>招聘信息</h3>
				</div>

				<!-- 	<p>招聘信息</p> -->
				<div class="table-responsive">
					<div class="dataTables_wrapper no-footer">
						<table class="table table-striped" id="table">

							<thead>
								<tr>
									<th>标题</th>
									<th>招聘单位</th>
									<th>薪水</th>
									<th>发布时间</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.records}" var="recruit">
									<tr>
										<td id="${recruit.title}">&nbsp;
											<a href="${pageContext.request.contextPath}/recruit/detailRecruit?recuritId=${recruit.recuritId}"> ${recruit.title}</a>
											<%--<ar:top value="${recruit.isTop}" />--%></td>
										<td>${recruit.unitName}</td>
										<td>${recruit.salary}</td>
										<td><ar:dateTag value="${recruit.ctime}" pattern="M月d日"></ar:dateTag></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<%@ include file="../portal-common/pagination.jsp"%>
			</section>
		</div>
	</div>

	<%@ include file="../portal-common/footer.jsp"%>

</body>
<%@ include file="../portal-common/portal-js.jsp"%>
<script src="/script/recruit/recruit-index.js"></script>
</html>