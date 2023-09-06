<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/lib/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-role" />
<c:url var="RoleURL" value="/admin-role" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
    <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Danh sách quyền</h4>
                    </div>
                   	<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                        <a href='<c:url value="/admin-role?type=addnew" />' class="btn btn-sm btn-success">Thêm mới</a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                    <c:if test="${not empty messageResponse}">
							<div class="alert alert-${alert}">
								<strong>${messageResponse}</strong>
							</div>
						</c:if>
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
                                     <c:forEach items="${listRoles}" var="item" varStatus="loop">
                                    	<tr>
                                            <td>${loop.count}</td>
                                            <td>${item.name}</td>
                                            <td>${item.description}</td>
                                             <td>
                                             <c:url var="editURl" value="/admin-role">
														<c:param name="type" value="addnew" />
														<c:param name="id" value="${item.id}" />
											</c:url> 
                                                <a href="${editURl}" class="btn btn-sm btn-primary">Sửa</a>
                                                <button class="btn btn-sm btn-danger btnDelete" role-id="${item.id}">Xóa</button>
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
        </div>
        <!-- /#page-wrapper -->
    </div>
    <script type="text/javascript">
	$(".btnDelete").click(function(){
		var choice = confirm("Bạn chắc chắn muốn xóa ?");
		var data = {};
		if (choice) {
		var id = $(this).attr('role-id');
		data['id'] = id;
		deleteNew(data);
		}
		function deleteNew(data){
	$.ajax({
        url: '${APIurl}',
        type: 'DELETE',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(result){
            window.location.href = "${RoleURL}?type=list&message=delete_success";
        },
        error: function(error){
        	window.location.href = "${RoleURL}?type=list&message=error_system";
        },
    });
}
	});
	</script>
</body>
</html>