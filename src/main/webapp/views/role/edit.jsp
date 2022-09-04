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
					<h4 class="page-title">Chỉnh sửa quyền</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-2 col-12"></div>
				<div class="col-md-8 col-xs-12">
					<div class="white-box">
						<form class="form-horizontal form-material" action="<%= contextPath %>/role/edit" method="post">
							<input type="hidden" value="${role_edit.getId() }" name="id" />
							<div class="form-group">
								<label class="col-md-12">Tên quyền</label>
								<div class="col-md-12">
									<input required type="text" name="rolename" value="${role_edit.getRoleName() }" placeholder="Tên quyền"
										class="form-control form-control-line" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Mô tả</label>
								<div class="col-md-12">
									<input required type="text" name="description" value="${role_edit.getDescription() }" placeholder="Mô tả"
										class="form-control form-control-line" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-success">Edit Role</button>
									<a href="<%= contextPath %>/role" class="btn btn-primary">Quay lại</a>
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
<jsp:include page="/views/layout/script.jsp"></jsp:include>
</body>
</html>