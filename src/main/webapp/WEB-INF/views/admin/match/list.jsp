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
			};
			$.ajax({
				type : "post",
				url:"/admin/match/updateInfo.do",
				data : JSON.stringify(lookListEdit),
				dataType : "json",
				contentType : 'application/json; charset=utf-8'
			});
		});
	});
	function showDetail(idKey) {
		location.href = '/admin/match/modify.do?idKey='+idKey;
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
									    <th>ID</th>
										<th>정보</th>
										<th>성별</th>
										<th>HEIGHT (cm)</th>
										<th>HEIGHT (fit)</th>
										<th>AGE</th>
										<th>BUST (cm)</th>
										<th>BUST(inch)</th>
										<th>HIP (cm)</th>
										<th>HIP (inch)</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${matchList}">
										<tr>
										    <td><c:out value="${item.idKey}" /></td>
											<td>
											<c:choose>
											 <c:when test="${item.matchKey eq '1' }">
											      <c:out value="매우비슷" />
											 </c:when>
											  <c:when test="${item.matchKey eq '2' }">
											      <c:out value="비슷" />
											 </c:when>
											  <c:when test="${item.matchKey eq '3'}">
											      <c:out value="조금다름" />
											 </c:when>
											  <c:when test="${item.matchKey eq '4'}">
											      <c:out value="다름"/>
											 </c:when>
											  <c:when test="${item.matchKey eq '5'}">
											      <c:out value="매우다름" />
											 </c:when>
											  <c:when test="${item.matchKey eq '6'}">
											      <c:out value="완전다름"/>
											 </c:when>
											  <c:when test="${item.matchKey eq '7'}">
											      <c:out value="구간개수"/>
											 </c:when>
											 <c:otherwise>
											   <c:out value="구간개수"/>
											  </c:otherwise>
											</c:choose>
											</td>
											<td><c:out value="${item.gender}"/></td>
											<td><c:out value="${item.hight1}" /></td>
											<td><c:out value="${item.hight2}" /></td>
											<td><c:out value="${item.age}" /></td>
											<td><c:out value="${item.bust1}" /></td>
											<td><c:out value="${item.bust2}" /></td>
											<td><c:out value="${item.hip1}" /></td>
											<td><c:out value="${item.hip2}" /></td>
											<td><button type="button" onclick="showDetail('<c:out value="${item.idKey}"/>');">상세보기</button></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="form-group text-center" style="margin-bottom: 0">
								<button type="button" onclick="location.href='/admin/match/add.do'" 
								class="btn btn-primary">등록</button>
						</div>
					</div>
					<!-- END TABLE HOVER -->
				</div>
			</div>
		</div>
	</div>
</div>
</div>