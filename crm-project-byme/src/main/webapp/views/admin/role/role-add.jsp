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
 <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
    	<!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Thêm mới quyền</h4>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-2 col-12"></div>
                    <div class="col-md-8 col-xs-12">
                        <c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										<strong>${messageResponse}</strong>
									</div>
						</c:if>
                        <div class="white-box">
                            <form class="form-horizontal form-material" id="formSubmit">
                                <div class="form-group">
                                    <label class="col-md-12">Tên quyền</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Tên quyền"
                                            class="form-control form-control-line" id="name" name="name" value="${model.name}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Mô Tả</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Mô Tả"
                                            class="form-control form-control-line" id="description" name="description" value="${model.description}"/>
                                    </div>
                                </div>
                                <div class="form-group">
											<div class="col-sm-12">
											<c:if test="${empty model.id}">
												<input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm mới Role" id="btnAddOrUpdateRole" />
											</c:if>
											<c:if test="${not empty model.id}">
												<input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật Role" id="btnAddOrUpdateRole" />
											</c:if>
												<a href='<c:url value="/admin-role?type=list" />' class="btn btn-primary">Quay lại</a>
											</div>
										</div>
										<input type="hidden" value="${model.id}" id="id" name="id" />
                            </form>
                        </div>
                    </div>
                    <div class="col-md-2 col-12"></div>
                </div>
                <!-- /.row -->
            </div>
        </div>
    </div>
    <script type="text/javascript">
	
	$('#btnAddOrUpdateRole').click(function (e) {
		e.preventDefault;
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function(i, v){
            data[""+v.name+""] = v.value;
        });
        var id = $('#id').val();
        var name = $('#name').val();
        var description = $('#description').val();
        if(id == ""){
        	if(name === "" || description == ""){
        		alert("Few data field cannot be empty !");
            	return;
        	}else{
        		addRole(data);
        	}
        }else {
        	if(name === "" || description === ""){
        		alert("Few data field cannot be empty !");
            	return;
        	}else{
        		updateRole(data);
        	}
        }
	});
	
	function addRole(data){
		$.ajax({
            url: "${APIurl}",
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function(result){
            	window.location.href = "${UserURL}?type=list&&message=insert_success";
            },
            error: function(error){
            	window.location.href = "${UserURL}?type=addnew&message=error_system";
            },
        });
    }
	
	function updateRole(data){
        $.ajax({
            url: "${APIurl}",
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function(result){
            	window.location.href = "${UserURL}?type=list&id="+result.id+"&message=update_success";
            },
            error: function(error){
            	window.location.href = "${UserURL}?type=list&id="+result.id+"&message=error_system";
            },
        });
    }
	</script>
</body>
</html>