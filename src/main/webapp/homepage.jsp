<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${APP_PATH}/static/jQuery/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM_CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>


		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped">
					<tr>
						<td>empId</td>
						<td>empName</td>
						<td>gender</td>
						<td>email</td>
						<td>dId</td>
						<td>deptName</td>
					</tr>
					<c:forEach var="emp" items="${pageInfo.list}" varStatus="state">
						<tr>
							<td>${ emp.empId }</td>
							<td>${ emp.empName }</td>
							<td>${ emp.gender }</td>
							<td>${ emp.dId }</td>
							<td>${ emp.department.deptName }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				【当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}记录】
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="javascript:jumpPage(1)" title="">首页</a></li>
					<li><a href="javascript:jumpPage(${pageInfo.prePage})"
						aria-label="Previous"> <span aria-hidden="true">上一页</span>
					</a></li>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="javascript:jumpPage(${page_Num })">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<li><a href="javascript:jumpPage(${pageInfo.nextPage})"
						aria-label="Next"> <span aria-hidden="true">下一页</span>
					</a></li>
					<li><a href="javascript:jumpPage(${pageInfo.pages})" title="">尾页</a></li>
				</ul>
				</nav>
			</div>
		</div>
		<script type="text/javascript">
			function jumpPage(pagenum) {
				location = "${APP_PATH}/emps?pn=" + pagenum
			}
		</script>
	</div>
</body>
</html>