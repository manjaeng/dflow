<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		$('#example1').DataTable({
			"order" : [ [ 0, "desc" ] ]
		});

		$('input[type=checkbox]').change(function() {
			var userInfoEdit = {
					status : $(this).prop('checked'),
					idKey : $(this).val()
			}
			$.ajax({
				type : "post",
				url:"/admin/user/updateInfo.do",
				data : JSON.stringify(userInfoEdit),
				dataType: "json",
				contentType : 'application/json; charset=utf-8'
			});
		});
	});
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">User List</h3>
			<div class="row">
				<div class="col-md-12">
					<!-- TABLE HOVER -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<table id="example1" class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>idKey</th>
										<th>userId</th>
										<th>mobile</th>
										<th>userType</th>
										<th>lastLoginDate</th>
										<th>status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${userList}">
										<tr>
											<td><c:out value="${item.idKey}" /></td>
											<td><c:out value="${item.userId}" /></td>
											<td><c:out value="${item.mobile}" /></td>
											<td><c:out value="${item.userType}" /></td>
											<td><fmt:formatDate value="${item.lastLoginDate}"
													type="date" pattern="yyyy-MM-dd" /></td>
											<td>
												<c:choose>
													<c:when test="${item.status == 1}">
														<input type="checkbox" checked data-toggle="toggle"
															data-size="sm" value="${item.idKey}">
													</c:when>
													<c:otherwise>
														<input type="checkbox" data-toggle="toggle" data-size="sm" value="${item.idKey}">
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END TABLE HOVER -->
				</div>
			</div>
		</div>
	</div>
</div>