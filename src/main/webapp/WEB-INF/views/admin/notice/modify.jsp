<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
 <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
 <script type='text/javascript'>
 $(function(){

     $('.input-group.date').datepicker({

         calendarWeeks: false,

         todayHighlight: true,

         autoclose: true,

         format: "yyyy/mm/dd",

         language: "UTF-8"

     });
     
     $('.btn-danger').click(function() {
         if (confirm('삭제하시겠습니까?')) {
             location.href = '/admin/notice/delete.do?idKey=' + '${noticeInfo.idKey}';
         }
     });

 });

 </script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">공지사항 상세</h3>
			<div class="row">
				<form action="/admin/notice/modify.do" method="post"
					enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">공지 사항 내용</h3>
								<input type="text" name="idKey" class="form-control" required value="<c:out value='${noticeInfo.idKey}'/>" style="display:none;">
							</div>
							<div class="panel-body">
								<input type="text" name="title" class="form-control" required value="<c:out value='${noticeInfo.title}'/>"> <br>
								<textarea name="content" class="form-control"
									style="resize: none" rows="20" ><c:out value='${noticeInfo.content}'/></textarea>
								<br>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">파일 첨부</h3>
							</div>
							<div class="panel-body fileWrap">
								<div class="form-group">
									<input id="fileInput1" class="fileInput" name="uploadfile"
										type="file" data-class-button="btn btn-default"
										data-class-input="form-control" data-button-text=""
										data-icon-name="fa fa-upload" class="form-control"
										tabindex="1"
										style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
									<div class="bootstrap-filestyle input-group">
										<input type="text" id="userfile1" class="form-control"
											name="userfile" readonly style="background-color: #fcfcfc;">
										<span class="group-span-filestyle input-group-btn"
											tabindex="0"> 
											<label for="fileInput1" class="btn btn-default "> 
												<span class="glyphicon fa fa-upload"></span>
											</label>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">기간 설정</h3>
							</div>
							<div class="panel-body fileWrap">

						        <div class="bootstrap-filestyle input-group date">
						            <input type="text" id="userfile1" class="form-control" name="startDate" style="height:36px;" 
						            required value="<fmt:formatDate value='${noticeInfo.startDate}' type='date' pattern='yyyy/MM/dd' />" >
												
						            	<span class="group-span-filestyle input-group-addon" style="padding:0;">
						            		<label for="calendarInput1" class="btn btn-default "> 
												<span class="glyphicon glyphicon-calendar"></span>
											</label>
						            	</span>
						        </div>
						     </div>
						     
						     <div class="panel-body fileWrap">
						       <div class="bootstrap-filestyle input-group date">
						            <input type="text" id="userfile1" class="form-control" name="endDate" style="height:36px;"
						            required value="<fmt:formatDate value='${noticeInfo.endDate}' type='date' pattern='yyyy/MM/dd' />" >
						            	<span class="group-span-filestyle input-group-addon" style="padding:0;">
						            		<label for="calendarInput1" class="btn btn-default"> 
												<span class="glyphicon glyphicon-calendar"></span>
											</label>
						            	</span>
						        </div>
						        </div>
							</div>
						</div>

					<div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="form-group text-center" style="margin-bottom: 0">
									<button class="btn btn-primary">수정완료</button>
									<button type="button" class="btn btn-danger">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>