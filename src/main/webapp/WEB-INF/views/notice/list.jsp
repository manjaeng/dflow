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
										<th>제목</th>
										<th>작성자</th>
										<th>내용</th>
										<th>작성일</th>
										<th>조회수</th>
										<th>기간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${noticeList}">
										<tr>
											<td>
												<c:out value="${item.title}" />
											</td>
											<td>
												<c:out value="${item.userIdKey}" />
											</td>
											<td>
												<c:out value="${item.content}" />
											</td>
											<td>
												<fmt:formatDate value="${item.createDate}" type="date" pattern="yyyy-MM-dd" />
											</td>
											<td>
												<c:out value="${item.viewCount}" />
											</td>
											<td>
												<fmt:formatDate value="${item.startDate}" type="date" pattern="yyyy-MM-dd" /> ~
												<fmt:formatDate value="${item.endDate}" type="date" pattern="yyyy-MM-dd" />
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