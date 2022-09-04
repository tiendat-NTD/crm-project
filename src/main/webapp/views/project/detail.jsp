<%@page import="duan_crm.pojo.User"%>
<%@page import="duan_crm.model.TaskModel"%>
<%@page import="duan_crm.pojo.Task"%>
<%@page import="java.util.List"%>
<%@page import="duan_crm.dao.Function"%>
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

List<Task> listTask = (List<Task>) request.getAttribute("task_list");
tongTask = listTask.size();
%>

<jsp:include page="/views/layout/header.jsp"></jsp:include>
<style>
.text-muted {
	color: #8d9ea7;
	font-size: 11px !important;
}
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
					<h4 class="page-title">Chi tiết công việc của dự án</h4>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- BEGIN THỐNG KÊ -->
			<div class="row">
				<!--col -->
				<!--col -->
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="white-box">
						<div class="col-in row">
							<div class="col-xs-12">
								<h3 class="counter text-right m-t-15 text-danger"
									style="color: deepskyblue; text-align: center;"><%=tongTask%></h3>
							</div>
							<div class="col-xs-12">
								<i data-icon="E" class="linea-icon linea-basic"></i>
								<h5 class="text-muted vb text-center">CÔNG VIỆC</h5>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"
										style="width: 100%; background: deepskyblue;"></div>
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
								<h3 class="counter text-right m-t-15 text-danger"><%=chuaBatDau == 0 ? 0 : (chuaBatDau * 100 / tongTask)%>%
								</h3>
							</div>
							<div class="col-xs-12">
								<i data-icon="E" class="linea-icon linea-basic"></i>
								<h5 class="text-muted vb text-center">CHƯA BẮT ĐẦU</h5>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"
										style="width: <%=chuaBatDau == 0 ? 0 : (chuaBatDau * 100 / tongTask)%>%"></div>
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
								<h3 class="counter text-right m-t-15 text-megna"><%=dangThucHien == 0 ? 0 : (dangThucHien * 100 / tongTask)%>%
								</h3>
							</div>
							<div class="col-xs-12">
								<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
								<h5 class="text-muted vb text-center">ĐANG THỰC HIỆN</h5>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="progress">
									<div class="progress-bar progress-bar-megna" role="progressbar"
										aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
										style="width: <%=dangThucHien == 0 ? 0 : (dangThucHien * 100 / tongTask)%>%"></div>
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
								<h3 class="counter text-right m-t-15 text-primary"><%=daHoanThanh == 0 ? 0 : (daHoanThanh * 100 / tongTask)%>%
								</h3>
							</div>
							<div class="col-xs-12">
								<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
								<h5 class="text-muted vb text-center">HOÀN THÀNH</h5>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="progress">
									<div class="progress-bar progress-bar-primary"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"
										style="width: <%=daHoanThanh == 0 ? 0 : (daHoanThanh * 100 / tongTask)%>%"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- END THỐNG KÊ -->

			<!-- BEGIN DANH SÁCH CÔNG VIỆC -->
			<c:forEach var="user" items="${list_user_of_project}">
				
				<div class="row">
					<!-- tên nv  -->
					<div class="col-xs-12">
						<a href="#" class="group-title"> <img width="30"
							src="<%=contextPath%>/views/layout/assets/plugins/images/users/pawandeep.jpg" class="img-circle" /> <span>${user.getFullName()}</span>
						</a>
					</div>

					<!-- chưa thực hiện -->
					<div class="col-md-4">
						<div class="white-box">
							<h3 class="box-title">Chưa thực hiện</h3>
							<div class="message-center">
								<c:forEach var="task" items="${task_list}">
									<c:if test="${task.getIdStatus() == 1 && user.getId() == task.getIdUser()}">
										<a href="<%=contextPath%>/task/details?id=${task.getId()}">
											<div class="mail-contnet">
												<h5>${task.getTaskName()}</h5>
												<span class="mail-desc">=> Dự án: ${task.getProjectName()}</span> 
												<span class="time">- Bắt
													đầu: ${Function.formatDate(task.getStartDate())}</span> 
												<span class="time">- Kết
													thúc: ${Function.formatDate(task.getEndDate())}</span>
											</div>
										</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- đang thực hiện -->
					<div class="col-md-4">
						<div class="white-box">
							<h3 class="box-title">Đang thực hiện</h3>
							<div class="message-center">
								<c:forEach var="task" items="${task_list}">
									<c:if test="${task.getIdStatus() == 2 && user.getId() == task.getIdUser()}">
										<a href="<%=contextPath%>/task/details?id=${task.getId()}">
											<div class="mail-contnet">
												<h5>${task.getTaskName()}</h5>
												<span class="mail-desc">=> Dự án: ${task.getProjectName()}</span> 
												<span class="time">- Bắt
													đầu: ${Function.formatDate(task.getStartDate())}</span> <span class="time">- Kết
													thúc: ${Function.formatDate(task.getEndDate())}</span>
											</div>
										</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- đã hoàn thành -->
					<div class="col-md-4">
						<div class="white-box">
							<h3 class="box-title">Đã hoàn thành</h3>
							<div class="message-center">
								<c:forEach var="task" items="${task_list}">
									<c:if test="${task.getIdStatus() == 3 && user.getId() == task.getIdUser()}">
										<a href="<%=contextPath%>/task/details?id=${task.getId()}">
											<div class="mail-contnet">
												<h5>${task.getTaskName()}</h5>
												<span class="mail-desc">=> Dự án: ${task.getProjectName()}</span>
												<span class="time">- Bắt
													đầu: ${Function.formatDate(task.getStartDate())}</span> <span class="time">- Kết
													thúc: ${Function.formatDate(task.getEndDate())}</span>
											</div>
										</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
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