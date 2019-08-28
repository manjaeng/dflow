<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <script type='text/javascript'>
 $(function(){

 });

 </script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">QnA Detail</h3>
			<div class="row">
				<form action="/admin/qna/answer.do" method="post"
					enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">QnA Content</h3>
								<input type="text" name="idKey" class="form-control" required value="<c:out value='${qnaAnswer.idKey}'/>" style="display:none;">
							</div>
							<div class="panel-body">
								<input type="text" name="title" class="form-control" required value="<c:out value='${qnaAnswer.title}'/>" readonly> <br>
								<textarea name="content" class="form-control"
									style="resize: none" rows="20" readonly><c:out value='${qnaAnswer.content}'/></textarea>
								<br>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">Answer</h3>
							</div>
							<div class="panel-body">
								<textarea name="answerContent" class="form-control" style="resize: none" rows="20"><c:out value='${qnaAnswer.answer}'/></textarea>
								<br>
							</div>
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="form-group text-center" style="margin-bottom: 0">
									<button class="btn btn-primary">답변완료</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>