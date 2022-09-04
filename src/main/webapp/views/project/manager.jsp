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
					<h4 class="page-title">Thêm nhân viên vào dự án</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-2 col-12"></div>
				<div class="col-md-8 col-xs-12">
					<div class="white-box">
						<form class="form-horizontal form-material" method="post" action="<%= contextPath %>/project/manager?id=${id_project}">
							<div class="form-group">
								<label class="col-md-12">Quản lý dự án</label>
								<div class="col-md-12">
									<select class="form-control form-control-line" name="add_user">
										<option value="0">Chọn nhân viên</option>
										<c:forEach var="user" items="${list_user}">
											<option value="${user.getId() }">${user.getFullName() }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-success">Thêm</button>
									<a href="<%= contextPath %>/project" class="btn btn-primary">Quay lại</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-2 col-12"></div>
			</div>
			<!-- /.row -->
			<!-- /row -->
			<div class="row">
				<div class="col-sm-12">
					<div class="white-box">
						<div class="table-responsive">
							<table class="table" id="example">
								<thead>
									<tr>
										<th>STT</th>
										<th>Tên Nhân Viên</th>
										<th>Email</th>
										<th>Số Điện Thoại</th>
										<th>Hành Động</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="stt" value="0"></c:set>
									<c:forEach var="users" items="${list_user_of_project}">
									<c:set var="stt" value="${stt+1}"></c:set>
										
										<tr>
											<td>${ stt }</td>
											<td>${ users.getFullName() }</td>
											<td>${ users.getEmail() }</td>
											<td>${ users.getPhoneNumber() }</td>
											<td>
												<a onclick="return confirm('Bạn có muốn xóa nhân viên này khỏi dự án?')" href="<%= contextPath %>/project/manager_delete?id_user=${users.getId()}&id_project=${id_project}" class="btn btn-sm btn-danger">Xóa</a> 
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
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