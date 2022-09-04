<%@page import="duan_crm.model.TaskModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String contextPath = request.getContextPath();
%>
<%
int chuaBatDau, dangThucHien, daHoanThanh, tongTask = 0;
chuaBatDau = (int) request.getAttribute("task_chua_bat_dau");
dangThucHien = (int) request.getAttribute("task_dang_thuc_hien");
daHoanThanh = (int) request.getAttribute("task_da_hoan_thanh");

List<TaskModel> listTask = (List<TaskModel>) request.getAttribute("task_list");
tongTask = listTask.size();
%>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<style>
	.text-muted { color: #8d9ea7; font-size: 11px !important; }
</style>
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
					<h4 class="page-title">Chi tiết thành viên</h4>
				</div>
			</div>
			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-4 col-xs-12">
					<div class="white-box">
						<div class="user-bg">
							<img width="100%" alt="user" src="<%=contextPath%>/views/layout/assets/plugins/images/large/img1.jpg">
							<div class="overlay-box">
								<div class="user-content">
									<a href="javascript:void(0)"><img
										src="<%=contextPath%>/views/layout/assets/plugins/images/users/genu.jpg"
										class="thumb-lg img-circle" alt="img"></a>
									<h4 class="text-white">${user_detail.getFullName()}</h4>
									<h5 class="text-white">${user_detail.getEmail()}</h5>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="col-md-8 col-xs-12">
					<!-- BEGIN THỐNG KÊ -->
					<div class="row">
						<!--col -->
						<!--col -->
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="white-box">
								<div class="col-in row">
									<div class="col-xs-12">
										<h3 class="counter text-right m-t-15 text-danger" style="color: deepskyblue;text-align: center;"><%= tongTask %></h3>
									</div>
									<div class="col-xs-12">
										<i data-icon="E" class="linea-icon linea-basic"></i>
										<h5 class="text-muted vb text-center">CÔNG VIỆC</h5>
									</div>
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="progress">
											<div class="progress-bar progress-bar-danger"
												role="progressbar" aria-valuenow="40" aria-valuemin="0"
												aria-valuemax="100" style="width: 100%;background: deepskyblue;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="white-box">
								<div class="col-in row">
									<div class="col-xs-12">
										<h3 class="counter text-right m-t-15 text-danger"><%= chuaBatDau == 0 ? 0 : (chuaBatDau * 100 / tongTask)%>%</h3>
									</div>
									<div class="col-xs-12">
										<i data-icon="E" class="linea-icon linea-basic"></i>
										<h5 class="text-muted vb text-center">CHƯA BẮT ĐẦU</h5>
									</div>
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="progress">
											<div class="progress-bar progress-bar-danger"
												role="progressbar" aria-valuenow="40" aria-valuemin="0"
												aria-valuemax="100" style="width: <%= chuaBatDau == 0 ? 0 : (chuaBatDau * 100 / tongTask)%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
						<!--col -->
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="white-box">
								<div class="col-in row">
									<div class="col-xs-12">
										<h3 class="counter text-right m-t-15 text-megna"><%= dangThucHien == 0 ? 0 : (dangThucHien * 100 / tongTask)%>%</h3>
									</div>
									<div class="col-xs-12">
										<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
										<h5 class="text-muted vb text-center">ĐANG THỰC HIỆN</h5>
									</div>
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="progress">
											<div class="progress-bar progress-bar-megna"
												role="progressbar" aria-valuenow="40" aria-valuemin="0"
												aria-valuemax="100" style="width: <%= dangThucHien == 0 ? 0 : (dangThucHien * 100 / tongTask)%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
						<!--col -->
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="white-box">
								<div class="col-in row">
									<div class="col-xs-12">
										<h3 class="counter text-right m-t-15 text-primary"><%= daHoanThanh == 0 ? 0 : (daHoanThanh * 100 / tongTask)%>%</h3>
									</div>
									<div class="col-xs-12">
										<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
										<h5 class="text-muted vb text-center">HOÀN THÀNH</h5>
									</div>
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="progress">
											<div class="progress-bar progress-bar-primary"
												role="progressbar" aria-valuenow="40" aria-valuemin="0"
												aria-valuemax="100" style="width: <%= daHoanThanh == 0 ? 0 : (daHoanThanh * 100 / tongTask)%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- END THỐNG KÊ -->
				</div>
			</div>
			<br />
			<!-- /.row -->
			<!-- BEGIN DANH SÁCH CÔNG VIỆC -->
			<h4>DANH SÁCH CÔNG VIỆC</h4>
			<div class="row">
				<div class="col-md-4">
					<div class="white-box">
						<h3 class="box-title">Chưa thực hiện</h3>
						<div class="message-center">
							<c:forEach var="task" items="${task_list}">
								<c:if test="${task.getIdStatus() == 1}">
									<a href="<%=contextPath%>/task/detail?id=${task.getId()}">
										<div class="mail-contnet">
											<h5>${task.getTaskName()}</h5>
											<span class="mail-desc"></span> <span class="time">Bắt
												đầu: ${task.getStartDate()}</span> <span class="time">Kết thúc: ${task.getEndDate()}</span>
										</div>
									</a> 
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="white-box">
						<h3 class="box-title">Đang thực hiện</h3>
						<div class="message-center">
							<c:forEach var="task" items="${task_list}">
								<c:if test="${task.getIdStatus() == 2}">
									<a href="<%=contextPath%>/task/detail?id=${task.getId()}">
										<div class="mail-contnet">
											<h5>${task.getTaskName()}</h5>
											<span class="mail-desc"></span> <span class="time">Bắt
												đầu: ${task.getStartDate()}</span> <span class="time">Kết thúc: ${task.getEndDate()}</span>
										</div>
									</a> 
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="white-box">
						<h3 class="box-title">Đã hoàn thành</h3>
						<div class="message-center">
							<c:forEach var="task" items="${task_list}">
								<c:if test="${task.getIdStatus() == 3}">
									<a href="<%=contextPath%>/task/detail?id=${task.getId()}">
										<div class="mail-contnet">
											<h5>${task.getTaskName()}</h5>
											<span class="mail-desc"></span> <span class="time">Bắt
												đầu: ${task.getStartDate()}</span> <span class="time">Kết thúc: ${task.getEndDate()}</span>
										</div>
									</a> 
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- END DANH SÁCH CÔNG VIỆC -->
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