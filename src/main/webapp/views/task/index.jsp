<%@page import="duan_crm.dao.StatusDAO"%>
<%@page import="duan_crm.dao.TaskDAO"%>
<%@page import="duan_crm.dao.Function"%>
<%@page import="duan_crm.dao.UserDAO"%>
<%@page import="duan_crm.dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String contextPath = request.getContextPath();
%>
<%@page import="duan_crm.constant.Constants"%>
<jsp:include page="/views/layout/header.jsp"></jsp:include>
<div class="preloader">
	<div class="cssload-speeding-wheel"></div>
</div>
<div id="wrapper">
	<jsp:include page="/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/views/layout/menu.jsp"></jsp:include>

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title">Danh sách công việc</h4>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
					<a href="<%=contextPath%>/task/add" class="btn btn-sm btn-success">Thêm mới</a>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /row -->
			<div class="row">
				<div class="col-sm-12">
					<div class="white-box">
						<div class="table-responsive">
							<table class="table" id="example">
								<thead>
									<tr>
										<th>STT</th>
										<th>Tên Công Việc</th>
										<th>Dự Án</th>
										<th>Người Thực Hiện</th>
										<th>Ngày Bắt Đầu</th>
										<th>Ngày Kết Thúc</th>
										<th>Trạng Thái</th>
										<th>Hành Động</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="stt" value="0"></c:set>
									<c:forEach var="task" items="${list_task}">
										<c:set var="stt" value="${stt+1}"></c:set>
									<tr>
										<td>${stt}</td>
										<td>${task.getTaskName()}</td>
										<td>${ProjectDAO.getProjectById(task.getIdProject()).getProjectName()}</td>
										<td>${UserDAO.getUserById(task.getIdUser()).getFullName()}</td>
										<td>${Function.formatDate(task.getStartDate())}</td>
										<td>${Function.formatDate(task.getEndDate())}</td>
										<td>${StatusDAO.getStatusById(task.getIdStatus()).getStatusName()}</td>
										<td>
											<a href="<%= contextPath %>/task/edit?id=${task.getId()}" class="btn btn-sm btn-primary">Sửa</a> 
											<a href="<%= contextPath %>/task/delete?id=${task.getId()}" onclick="return confirm('Bạn có muốn xóa công việc này?')" class="btn btn-sm btn-danger">Xóa</a> 
											<!-- <a href="#" class="btn btn-sm btn-info">Xem</a> -->
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	</div>
</div>
<jsp:include page="/views/layout/script.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</body>

</html>