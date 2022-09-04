<%@page import="duan_crm.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String contextPath = request.getContextPath();
User userLogin = (User) request.getSession().getAttribute(Constants.USER_LOGIN);
%>
<%@page import="duan_crm.constant.Constants"%>
<style>
#crm{
	-webkit-text-stroke: 1.5px red;
	font-size: 20px;
}
#crm:hover{
	color: black;
	-webkit-text-stroke: 1.5px yellow;
	font-size: 23px;
	transition: 1.5s;
}
</style>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top m-b-0">
	<div class="navbar-header">
		<a class="navbar-toggle hidden-sm hidden-md hidden-lg "
			href="javascript:void(0)" data-toggle="collapse"
			data-target=".navbar-collapse"> <i class="fa fa-bars"></i>
		</a>
		<div class="top-left-part">
			<a class="logo"
				href="<%=contextPath%>/home"> <b>
					<img
					src="<%=contextPath%>/views/layout/assets/plugins/images/pixeladmin-logo.png"
					alt="home" />
			</b> <span class="hidden-xs"> 
			<b id="crm" style="width: auto;">DỰ ÁN CRM</b>
			</span>
			</a>
		</div>
		<!-- <ul class="nav navbar-top-links navbar-left m-l-20 hidden-xs">
			<li>
				<form role="search" class="app-search hidden-xs">
					<input type="text" placeholder="Search..." class="form-control">
					<a href="#"> <i class="fa fa-search"></i>
					</a>
				</form>
			</li>
		</ul> -->
		<ul class="nav navbar-top-links navbar-right pull-right">
			<li>
				<div class="dropdown">
					<a class="profile-pic dropdown-toggle" data-toggle="dropdown"
						href="#"> <img
						src="<%=contextPath%>/views/layout/assets/plugins/images/users/varun.jpg"
						alt="user-img" width="36" class="img-circle" /> <b
						class="hidden-xs"><%= userLogin.getFullName() %></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="<%=contextPath%>/profile">Thông tin cá nhân</a></li>
						<li><a href="<%=contextPath%>/profile/task">Thống kê công việc</a></li>
						<li class="divider"></li>
						<li><a href="<%=contextPath + Constants.URL_LOGOUT%>">Đăng
								xuất</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
	<!-- /.navbar-header -->
	<!-- /.navbar-top-links -->
	<!-- /.navbar-static-side -->
</nav>