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
					<h4 class="page-title">Chỉnh sửa dự án</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-2 col-12"></div>
				<div class="col-md-8 col-xs-12">
					<div class="white-box">
						<form class="form-horizontal form-material" method="post"
							action="<%=contextPath%>/project/edit?id=${project_edit.getId() }">
							<input type="hidden" name="id" value="${project_edit.getId() }"/>
							<div class="form-group">
								<label class="col-md-12">Tên dự án</label>
								<div class="col-md-12">
									<input required type="text" name="project_name" placeholder="Tên dự án"
										value="${project_edit.getProjectName() }" class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Mô tả dự án</label>
								<div class="col-md-12">
									<textarea required name="project_des"
										class="form-control form-control-line"
										placeholder="Mô tả dự án" rows="3">${project_edit.getDescription() }</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Ngày bắt đầu</label>
								<div class="col-md-12">
									<input required type="date" name="project_start" value="${project_edit.getStartDate() }"
										placeholder="dd/MM/yyyy"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Ngày kết thúc</label>
								<div class="col-md-12">
									<input required type="date" name="project_end" value="${project_edit.getEndDate() }" placeholder="dd/MM/yyyy"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Quản lý dự án</label>
								<div class="col-md-12">
									<select class="form-control form-control-line"
										name="project_user">
										<option value="0">Chọn quản lý</option>
										<c:forEach var="user" items="${list_user}">
											<option ${project_edit.getIdUser() ==  user.getId() ? "selected" : "" } value="${user.getId() }">${user.getFullName() }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Trạng thái dự án</label>
								<div class="col-md-12">
									<select class="form-control form-control-line"
										name="project_status">
										<option value="0">Chọn trạng thái</option>
										<c:forEach var="status" items="${list_status}">
											<option ${project_edit.getIdStatus() ==  status.getId() ? "selected" : "" } value="${status.getId() }">${status.getStatusName() }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-success">Chỉnh sửa</button>
									<a href="<%=contextPath%>/project" class="btn btn-primary">Quay
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