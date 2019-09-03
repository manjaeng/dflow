<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
function deleteRow(currentObj) {
	$(currentObj).closest("tr").remove();
}
function resetRow(obj) {
	$(obj).find(':input').each(function() {
		this.value = '';
	});
}
function addRow(obj) {
	var table = $(obj).parents().find('table');
	var lastRow = table.find('tr:last');
	var copyRow = lastRow.clone(true);
	
	resetRow(copyRow);
	table.append(copyRow);
}
function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}
$(function() {
	$("#styleBtn").click(function(){
		var formData = $("#styleForm").serialize();
		
		$.ajax({
			type:"post",
			url:"/admin/setting/style.do",
			data:formData,
			dataType : 'json',
		});
	});
});
</script>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<h3 class="page-title">Setting</h3>
			<div class="row">
				<div class="col-md-6">
					<!-- PANEL DEFAULT -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">Hashtag</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						<div class="panel-body">
							<span>현재 허용 해시태그 개수<input type="text" class="hashtagCount"
								style="float: right" name="hashtag" value="${ hashtag }"></span>
						</div>
						<div class="form-group text-center">
							<button type="button" class="btn btn-primary"
								onclick="location.href='#' ">설정완료</button>
						</div>
					</div>
					<!-- END PANEL DEFAULT -->
				</div>
				<div class="col-md-6">
					<!-- PANEL NO CONTROLS -->
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">Style Add or Edit</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						
						<div class="panel-body">
							<form name="styleForm" id="styleForm" method="post">
							<table class="table table-sm">
								<thead>
									<tr>
										<th>Seq</th>
										<th>Style</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${styleList}">
										<tr>
											<th><input type="text"
												onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" name="seq" 
												value="${item.seq}" /></th>
											<th><input type="text" name="style" value="${item.style}" /></th>
											<th><button type="button" class="btn btn-danger"
													onclick="deleteRow(this)">X</button></th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<div class="form-group text-center">
								<button type="button" class="btn btn-info" onclick="addRow(this)">스타일
									추가</button>
							</div>
						</div>
						<div class="form-group text-center">
							<button type="button" id="styleBtn" class="btn btn-primary">설정완료</button>
						</div>
					</div>
					<!-- END PANEL NO CONTROLS -->
				</div>
				<!-- END PANEL WITH FOOTER -->
			</div>
		</div>
	</div>
</div>
