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
tongTask = (int) request.getAttribute("task_list");

int prochuaBatDau = (int) request.getAttribute("project_chua_bat_dau");
int prodangThucHien = (int) request.getAttribute("project_dang_thuc_hien");
int prodaHoanThanh = (int) request.getAttribute("project_da_hoan_thanh");
int tongProject = (int) request.getAttribute("project_list");
%>

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
					<h4 class="page-title">Dashboard</h4>
				</div>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- row -->
		<!-- <h3 class="page-title" style="font-weight: 700; margin-left: 20px; color: #1d5df2;">Project</h3> -->
		<div class="row">
			<!--col -->
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="white-box">
					<div class="col-in row">
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i data-icon="E" class="linea-icon linea-basic"></i>
							<h5 class="text-muted vb">DỰ ÁN</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-danger" style="color: deepskyblue"><%=tongProject%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: <%=(tongProject * 100 / tongProject)%>%;background: deepskyblue;">
									<span class="sr-only" style="color: #9bd29c!important;">40% Complete (success)</span>
								</div>
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
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i data-icon="E" class="linea-icon linea-basic"></i>
							<h5 class="text-muted vb">CHƯA BẮT ĐẦU</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-danger" style="color: red"><%=prochuaBatDau%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: <%=(prochuaBatDau * 100 / tongProject)%>%; background: red;">
									<span class="sr-only">40% Complete (success)</span>
								</div>
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
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
							<h5 class="text-muted vb">ĐANG THỰC HIỆN</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-megna" style="color: orange"><%=prodangThucHien%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-megna" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: <%=prodangThucHien * 100 / tongProject%>%; background: orange;">
									<span class="sr-only">40% Complete (success)</span>
								</div>
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
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
							<h5 class="text-muted vb">ĐÃ HOÀN THÀNH</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-primary" style="color: green"><%=prodaHoanThanh%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-primary"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width: <%=prodaHoanThanh * 100 / tongProject%>%; background: green;">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		
		<!-- row -->
		<!-- <h3 class="page-title" style="font-weight: 700; margin-left: 20px; color: #1d5df2;">Task</h3> -->
		<div class="row">
			<!--col -->
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="white-box">
					<div class="col-in row">
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i data-icon="E" class="linea-icon linea-basic"></i>
							<h5 class="text-muted vb">CÔNG VIỆC</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-danger" style="color: #9bd29c"><%=tongTask%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: <%=(tongTask * 100 / tongTask)%>%;background: #9bd29c;">
									<span class="sr-only">40% Complete (success)</span>
								</div>
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
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i data-icon="E" class="linea-icon linea-basic"></i>
							<h5 class="text-muted vb">CHƯA BẮT ĐẦU</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-danger" style="color: deeppink"><%=chuaBatDau%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: <%=(chuaBatDau * 100 / tongTask)%>%; background: deeppink">
									<span class="sr-only">40% Complete (success)</span>
								</div>
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
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
							<h5 class="text-muted vb">ĐANG THỰC HIỆN</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-megna" style="color: violet"><%=dangThucHien%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-megna" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: <%=dangThucHien * 100 / tongTask%>%; background: violet">
									<span class="sr-only">40% Complete (success)</span>
								</div>
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
						<div class="col-md-6 col-sm-6 col-xs-6">
							<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
							<h5 class="text-muted vb">ĐÃ HOÀN THÀNH</h5>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h3 class="counter text-right m-t-15 text-primary" style="color: aqua"><%=daHoanThanh%></h3>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-primary"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100"
									style="width: <%=daHoanThanh * 100 / tongTask%>%; background: aqua">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!--row -->
		<div class="row">
			<div class="col-md-12">
				<div class="white-box">
					<h3 class="box-title">Sales Difference</h3>
					<ul class="list-inline text-right">
						<li>
							<h5>
								<i class="fa fa-circle m-r-5" style="color: #dadada;"></i>Site A
								View
							</h5>
						</li>
						<li>
							<h5>
								<i class="fa fa-circle m-r-5" style="color: #aec9cb;"></i>Site B
								View
							</h5>
						</li>
					</ul>
					<div id="morris-area-chart2" style="height: 370px;"></div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="/views/layout/footer.jsp"></jsp:include>
</div>
<jsp:include page="/views/layout/script.jsp"></jsp:include>
</body>

</html>