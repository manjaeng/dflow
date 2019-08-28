<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function modify(idKey) {
		location.href= "/admin/qna/answer.do?num="+idKey;
	}
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">QnA List</h3>
			<div class="row">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>No</th>
										<th>User</th>
										<th>Title</th>
										<th>Content</th>
										<th>CreateDate</th>
										<th>AnswerDate</th>
										<th>Answer</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${qnaList}">
									<tr style="cursor:pointer;" onclick="modify('<c:out value="${item.idKey}"/>');">
										<th><c:out value="${item.idKey}" /></th>
										<th><c:out value="${item.userId}" /></th>
										<th><c:out value="${item.title}" /></th>
										<th><c:out value="${item.content}" /></th>
										<th><fmt:formatDate value="${item.createDate}" type="date" pattern="yyyy/MM/dd HH:mm" /></th>
										<th><fmt:formatDate value="${item.answerDate}" type="date" pattern="yyyy/MM/dd HH:mm" /></th>
										<th>
										<c:choose>
											<c:when test="${item.status == false}" >
												<button type="button" class="btn btn-danger" onclick="modify('<c:out value="${item.idKey}"/>');">답변필요</button>
											</c:when>
											<c:otherwise>
												답변완료
											</c:otherwise>
										</c:choose>
										</th>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>