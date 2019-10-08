<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(function() {
		$('#dataTable').DataTable({
			"order" : [ [ 0, "desc" ] ]
		});
	});
	function modify(idKey) {
		location.href= "/admin/qna/answer.do?num="+idKey;
	}
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">신고 관리</h3>
			<div class="row">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<table id="dataTable" class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>No</th>
										<th>Type</th>
										<th>Target Id</th>
										<th>Detail</th>
										<th>Reporter</th>
										<th>ReportDate</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${reportList}">
									<tr style="cursor:pointer;" onclick="modify('<c:out value="${item.idKey}"/>');">
										<th><c:out value="${item.idKey}" /></th>
										<th><c:out value="${item.reportType == '0' ? '룩 신고' : '유저 신고' }" /></th>
										<th><c:out value="${item.targetId}" /></th>
										<th><c:out value="${item.detail == '1' ? '스팸' : '도용'}" /></th>
										<th><c:out value="${item.userId}" /></th>
										<th><fmt:formatDate value="${item.reportDate}" type="date" pattern="yyyy/MM/dd HH:mm:ss" /></th>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="form-group text-center" style="margin-bottom: 0">
								<button type="button" onclick="location.href='/admin/report/list.do?reportType=0'" 
								class="btn btn-primary">룩 신고</button>
								<button type="button" onclick="location.href='/admin/report/list.do?reportType=1'" 
								class="btn btn-primary">유저 신고</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>