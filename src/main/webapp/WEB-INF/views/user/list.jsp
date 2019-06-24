<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		$('#example1').DataTable({
			"order" : [ [ 0, "desc" ] ]
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
										<th>userName</th>
										<th>userType</th>
										<th>loginIp</th>
										<th>loginTotalCount</th>
										<th>lastLoginDate</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${userList}">
										<td><c:out value="${item.idKey}" /></td>
										<td><c:out value="${item.userId}" /></td>
										<td><c:out value="${item.userName}" /></td>
										<td><c:out value="${item.userType}" /></td>
										<td><c:out value="${item.loginIp}" /></td>
										<td><c:out value="${item.loginTotalCount}" /></td>
										<td><fmt:formatDate value="${item.lastLoginDate}"
												type="date" pattern="yyyy-MM-dd" /></td>
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