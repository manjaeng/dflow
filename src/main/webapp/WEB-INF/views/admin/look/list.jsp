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
			console.log($(this).prop('checked'))
		});
	});
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
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>test1</td>
										<td>임시 컨텐츠1</td>
										<td>관리자</td>
										<td>0</td>
										<td><input type="checkbox" checked data-toggle="toggle"
											data-size="sm"></td>
									</tr>
									<tr>
										<td>2</td>
										<td>test2</td>
										<td>임시 컨텐츠2</td>
										<td>패피루키</td>
										<td>0</td>
										<td><input type="checkbox" checked data-toggle="toggle"
											data-size="sm"></td>
									</tr>
									<tr>
										<td>3</td>
										<td>test3</td>
										<td>임시 컨텐츠3</td>
										<td>패피루키</td>
										<td>0</td>
										<td><input type="checkbox" data-toggle="toggle"
											data-size="sm"></td>
									</tr>
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