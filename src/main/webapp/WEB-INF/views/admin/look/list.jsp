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
			var lookListEdit = {
					status : $(this).prop('checked'),
					idKey : $(this).val()
			}
			$.ajax({
				type : "post",
				url:"/admin/look/updateInfo.do",
				data : JSON.stringify(lookListEdit),
				dataType : "json",
				contentType : 'application/json; charset=utf-8'
			});
		});
	});
	function showDetail(idKey) {
		location.href = '/admin/look/modify.do?idKey='+idKey;
	}
	
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Look List</h3>
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
										<th>style</th>
										<th>contents</th>
										<th>createDate</th>
										<th>status</th>
										<th>Detail</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${lookList}">
										<tr>
											<td><c:out value="${item.idKey}" /></td>
											<td><c:out value="${item.userId}"/></td>
											<td><c:out value="${item.style}" /></td>
											<td><c:out value="${item.content}" /></td>
											<td><c:out value="${item.createdate}" /></td>
											<td>
												<c:choose>
													<c:when test="${item.status == true}">
														<input type="checkbox" checked data-toggle="toggle"
															data-size="sm" value="${item.idKey}">
													</c:when>
													<c:otherwise>
														<input type="checkbox" data-toggle="toggle" data-size="sm" value="${item.idKey}">
													</c:otherwise>
												</c:choose>
											</td>
											<td><button type="button" onclick="showDetail('<c:out value="${item.idKey}"/>');">상세보기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="form-group text-center" style="margin-bottom: 0">
								<button type="button" onclick="location.href='/admin/look/add.do'" 
								class="btn btn-primary">룩등록</button>
						</div>
					</div>
					<!-- END TABLE HOVER -->
				</div>
			</div>
		</div>
	</div>
</div>