<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    
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
 });

 </script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Notice Add</h3>
			<div class="row">
				<form action="/admin/notice/add.do" method="post"
					enctype="multipart/form-data">
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">공지 사항 작성</h3>
							</div>
							<div class="panel-body">
								<input type="text" name="title" class="form-control" required
									placeholder="제목"> <br>
								<textarea name="content" class="form-control"
									style="resize: none" placeholder="공지내용" rows="20"></textarea>
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
						            <input type="text" id="userfile1" class="form-control" name="startDate" style="height:36px;" placeholder="시작일" required>
						            	<span class="group-span-filestyle input-group-addon" style="padding:0;">
						            		<label for="calendarInput1" class="btn btn-default "> 
												<span class="glyphicon glyphicon-calendar"></span>
											</label>
						            	</span>
						        </div>
						     </div>
						     
						     <div class="panel-body fileWrap">
						       <div class="bootstrap-filestyle input-group date">
						            <input type="text" id="userfile1" class="form-control" name="endDate" style="height:36px;" placeholder="종료일" required>
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
									<button class="btn btn-primary">공지추가</button>
									<button type="reset" class="btn btn-danger">다시작성</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>