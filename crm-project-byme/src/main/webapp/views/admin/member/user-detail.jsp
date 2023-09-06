<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/lib/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
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
                            <div class="user-bg"> <img width="100%" alt="user" src='<c:url value="/template/admin/plugins/images/large/img1.jpg" />'>
                                <div class="overlay-box">
                                    <div class="user-content">
                                    <c:if test="${not empty users}">
                                    	<a href="javascript:void(0)"><img src='<c:url value="/template/admin/plugins/images/users/genu.jpg" />'
                                                class="thumb-lg img-circle" alt="img"></a>
                                        <h4 class="text-white">${users.fullName}</h4>
                                        <h5 class="text-white">${users.email}</h5>s
                                    </c:if>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <!-- BEGIN THỐNG KÊ -->
	<div class="row">
		<!--col -->
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="white-box">
				<div class="col-in row">
					<div class="col-xs-12">
						<h3 class="counter text-right m-t-15 text-danger">20%</h3>
                    </div>
                    <div class="col-xs-12">
						<i data-icon="E" class="linea-icon linea-basic"></i>
						<h5 class="text-muted vb text-center">CHƯA BẮT ĐẦU</h5>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="progress">
							<div class="progress-bar progress-bar-danger" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 20%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col -->
		<!--col -->
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="white-box">
				<div class="col-in row">
					<div class="col-xs-12">
						<h3 class="counter text-right m-t-15 text-megna">50%</h3>
                    </div>
                    <div class="col-xs-12">
						<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
						<h5 class="text-muted vb text-center">ĐANG THỰC HIỆN</h5>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="progress">
							<div class="progress-bar progress-bar-megna" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 50%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col -->
		<!--col -->
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="white-box">
				<div class="col-in row">
					<div class="col-xs-12">
						<h3 class="counter text-right m-t-15 text-primary">30%</h3>
                    </div>
                    <div class="col-xs-12">
						<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
						<h5 class="text-muted vb text-center">HOÀN THÀNH</h5>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="progress">
							<div class="progress-bar progress-bar-primary" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 30%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col -->
	</div>
	<!-- END THỐNG KÊ -->

                    </div>
                </div><br />
                <!-- /.row -->
                <!-- BEGIN DANH SÁCH CÔNG VIỆC -->
                <h4>DANH SÁCH CÔNG VIỆC</h4>
                <div class="row">
                       <div class="col-md-4">
                        <div class="white-box">
                            <h3 class="box-title">Chưa thực hiện</h3>
                            <div class="message-center">
                            <c:forEach items="${listJob}" var="item">
                            	<c:if test="${item.userId == model.id && item.statusId == 1}">
                            	<a href="#">
                                    <div class="mail-contnet">
                                        <h5>${item.name}</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">${item.startedDate}</span>
                                        <span class="time">${item.endedDate}</span>
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
                               <c:forEach items="${listJob}" var="item">
                            	<c:if test="${item.userId == model.id && item.statusId == 2}">
                            	<a href="#">
                                    <div class="mail-contnet">
                                        <h5>${item.name}</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">${item.startedDate}</span>
                                        <span class="time">${item.endedDate}</span>
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
                               <c:forEach items="${listJob}" var="item">
                            	<c:if test="${item.userId == model.id && item.statusId == 3}">
                            	<a href="#">
                                    <div class="mail-contnet">
                                        <h5>${item.name}</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">${item.startedDate}</span>
                                        <span class="time">${item.endedDate}</span>
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
        </div>
        <!-- /#page-wrapper -->
</body>
</html>