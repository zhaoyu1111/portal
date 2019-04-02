<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../portal-common/portal-tag.jsp" %>
<form action="${pageContext.request.contextPath}/class/queryClasses?grade=${grade}" method="post">
    <div class="form-group">
        <div class="col-sm-5">
            <div class="input-group">
                <input type="text" name="queryStr" id="queryStr"
                       class="form-control col-xs-3" size="10" value="${query}"
                       placeholder="班级名/专业关键字"
                       onkeypress="if(event.keyCode==13){queryBtn.click();return false;}"/>
                <span class="input-group-btn">
					<button type="submit" id="queryBtn" class="btn btn-default">找班级</button>
				</span>
            </div>
        </div>
    </div>
</form>