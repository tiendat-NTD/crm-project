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
					<h4 class="page-title">Danh sách quyền</h4>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
					<a href="<%= contextPath %>/role/add" class="btn btn-sm btn-success">Thêm mới</a>
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
										<th>Tên Quyền</th>
										<th>Mô Tả</th>
										<th>Hành Động</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="stt" value="0"></c:set>
								<c:forEach var="role" items="${list_role}">
									<c:set var="stt" value="${stt+1}"></c:set>
									<tr>
										<td>${stt}</td>
										<td>${role.getRoleName()}</td>
										<td>${role.getDescription()}</td>
										<td>
											<a href="<%= contextPath %>/role/edit?id=${role.getId()}" class="btn btn-sm btn-primary">Sửa</a> 
											<a href="<%= contextPath %>/role/delete?id=${role.getId()}" onclick="return confirm('Bạn có muốn xóa quyền này?')" class="btn btn-sm btn-danger">Xóa</a>
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
<!-- jQuery -->
<jsp:include page="/views/layout/script.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</body>

</html>