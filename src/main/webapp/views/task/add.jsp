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
					<h4 class="page-title">Thêm mới công việc</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-2 col-12"></div>
				<div class="col-md-8 col-xs-12">
					<div class="white-box">
						<form id="formAdd" class="form-horizontal form-material"
							action="<%=contextPath%>/task/add" method="post">
							<input type="hidden" id="url" value="<%=contextPath%>/task/getuser" />
							<div class="form-group">
								<label class="col-md-12">Dự án</label>
								<div class="col-md-12">
									<select onchange="show_user_of_project(this.value)" required class="form-control form-control-line" name="project">
										<option value="">Chọn dự án</option>
										<c:forEach var="project" items="${list_project}">
											<option value="${project.getId()}">${project.getProjectName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Tên công việc</label>
								<div class="col-md-12">
									<input required type="text" name="task_name" placeholder="Tên công việc"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Mô tả công việc</label>
								<div class="col-md-12">
									<textarea name="description" class="form-control form-control-line" placeholder="Mô tả dự án" rows="3"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Người thực hiện</label>
								<div class="col-md-12">
									<select id="ds_user" required class="form-control form-control-line" name="user_id">
										<option class="user_select" value="">Chọn nhân viên thực hiện</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Ngày bắt đầu</label>
								<div class="col-md-12">
									<input required type="date" placeholder="dd/MM/yyyy" name="startdate"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Ngày kết thúc</label>
								<div class="col-md-12">
									<input required type="date" placeholder="dd/MM/yyyy" name="enddate"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-success">Thêm mới</button>
									<a href="<%=contextPath%>/task" class="btn btn-primary">Quay lại</a>
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
<script>
	function show_user_of_project(val){
		$('#ds_user').html("");
		$('#ds_user').append(`<option value="">Chọn nhân viên thực hiện</option>`);
		let link = $("#url").val();
		$.ajax({
			type: "post",
			url: link,
			data: {
				id: val
			}
		})
		.done(function(resp){
			resp.forEach(function(item) {  
			   $('#ds_user').append("<option value="+item.id+">"+item.fullName+"</option>");
			}); 
		});
	}
</script>
</body>
</html>