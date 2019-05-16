<form class="form" id="resumeForm" method="post"
                                      action="${pageContext.request.contextPath}/resume/addResumeSubmit">

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">职位信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">简历标题：</label>
                                        <div class="col-sm-4">${resume.resumeTitle}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">职业类型：</label>
                                        <div class="col-sm-4">${resume.careerType}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">期望工资：</label>
                                        <div class="col-sm-4">
                                            <c:forEach items="${salary}" var="salary">
                                                <c:if test="${resume.salary==salary.dictdataValue}">${salary.dictdataName}</c:if>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="panel panel-default">
                                        <h5 class="panel-title">个人信息</h5>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">姓名</label>
                                        <div class="col-sm-4">${resume.userName}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">性别</label>
                                        <div class="col-sm-4">
                                            <c:forEach items="${gender}" var="gender">
                                                <c:if test="${resume.gender==gender.dictdataValue}">${gender.dictdataName}</c:if>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">现居住地</label>
                                        <div class="col-sm-7">${resume.currentCity}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2">联系方式</label>
                                        <div class="col-sm-4">${resume.mobile}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">个人简介</label>
                                        <div class="col-sm-7">${resume.descrip}</div>
                                    </div>

                                </form>
