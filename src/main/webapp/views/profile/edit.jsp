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
					<h4 class="page-title">Cập nhật công việc</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-2 col-12"></div>
				<div class="col-md-8 col-xs-12">
					<div class="white-box">
						<form id="formAdd" class="form-horizontal form-material"
							action="<%=contextPath%>/profile/task/update?id=${task_edit.getId()}" method="post">
							<div class="form-group">
								<label class="col-md-12">Dự án</label>
								<div class="col-md-12">
									<select style="pointer-events: none;"
										class="form-control form-control-line" name="project">
										<option value="">Chọn dự án</option>
										<c:forEach var="project" items="${list_project}">
											<option ${project.getId() == task_edit.getIdProject() ? "selected" : ""} value="${project.getId()}">${project.getProjectName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Tên công việc</label>
								<div class="col-md-12">
									<input required style="pointer-events: none;" type="text" name="task_name"
										placeholder="Tên công việc"
										class="form-control form-control-line" value="${task_edit.getTaskName()}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Mô tả công việc</label>
								<div class="col-md-12">
									<textarea style="pointer-events: none;" name="description"
										class="form-control form-control-line"
										placeholder="Mô tả dự án" rows="3">${task_edit.getDescription()}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Người thực hiện</label>
								<div class="col-md-12">
									<select id="ds_user" required style="pointer-events: none;"
										class="form-control form-control-line" name="user_id">
										<option value="">Chọn nhân viên
											thực hiện</option>
										<c:forEach var="user" items="${list_user}">
											<option ${user.getId() == task_edit.getIdUser() ? "selected" : ""} value="${user.getId()}">${user.getFullName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Ngày bắt đầu</label>
								<div class="col-md-12">
									<input required type="date" placeholder="dd/MM/yyyy"
										name="startdate" class="form-control form-control-line" value="${task_edit.getStartDate()}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Ngày kết thúc</label>
								<div class="col-md-12">
									<input required type="date" placeholder="dd/MM/yyyy"
										name="enddate" class="form-control form-control-line" value="${task_edit.getEndDate()}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Trạng thái</label>
								<div class="col-md-12">
									<select required
										class="form-control form-control-line" name="status_id">
										<option value="">Chọn trạng thái</option>
										<c:forEach var="status" items="${list_status}">
											<option ${status.getId() == task_edit.getIdStatus() ? "selected" : ""} value="${status.getId()}">${status.getStatusName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-success">Cập nhật</button>
									<a href="<%=contextPath%>/profile/task" class="btn btn-primary">Quay
										lại</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-2 col-12"></div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	</div>
	<!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<jsp:include page="/views/layout/script.jsp"></jsp:include>
</body>
</html>