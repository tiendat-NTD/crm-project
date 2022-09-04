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
					<h4 class="page-title">Thông tin tài khoản</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-2 col-12"></div>
				<div class="col-md-8 col-xs-12">
					<div class="white-box">
						<form class="form-horizontal form-material" action="<%= contextPath %>/profile?id=${user_edit.getId()}" method="post">
							<div class="form-group">
								<label class="col-md-12">Họ và tên</label>
								<div class="col-md-12">
									<input required type="text" name="fullname" value="${user_edit.getFullName()}" placeholder="Johnathan Doe"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label for="example-email" class="col-md-12">Email</label>
								<div class="col-md-12">
									<input required type="email" placeholder="johnathan@admin.com"
										class="form-control form-control-line" value="${user_edit.getEmail()}" name="email"
										id="example-email">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Mật khẩu</label>
								<div class="col-md-12">
									<input type="password" name="password" placeholder="*****"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Số điện thoại</label>
								<div class="col-md-12">
									<input required type="text" name="phone" value="${user_edit.getPhoneNumber()}" placeholder="123 456 7890"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Địa chỉ</label>
								<div class="col-md-12">
									<input required type="text" name="address" value="${user_edit.getAddress()}" placeholder="Ho Chi Minh City"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-success">Lưu</button>
									<a href="<%= contextPath %>/home" class="btn btn-primary">Quay lại</a>
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
</div>

<!-- /#wrapper -->
<jsp:include page="/views/layout/script.jsp"></jsp:include>
</body>
</html>