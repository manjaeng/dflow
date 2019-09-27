<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
 <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
 <script type='text/javascript'>
 $(function() {
		$("#images").on('change', readImage);

		$(".preview-images-zone").sortable();

		$(document).on('click', '.image-cancel', function() {
			let no = $(this).data('no');
			$(".preview-image.preview-show-" + no).remove();
		});

		var num = 4;
		function readImage() {
			if (window.File && window.FileList && window.FileReader) {
				var files = event.target.files;
				var output = $(".preview-images-zone");

				for (let i = 0; i < files.length; i++) {
					var file = files[i];
					if (!file.type.match('image'))
						continue;
					var picReader = new FileReader();
					picReader
							.addEventListener(
									'load',
									function(event) {
										var picFile = event.target;
										var html = '<div class="preview-image preview-show-' + num + '">'
												+ '<div class="image-cancel" data-no="' + num + '">x</div>'
												+ '<div class="image-zone"><img id="pro-img-' + num + '" src="' + picFile.result + '"></div>'
												+ '</div>';

										output.append(html);
										num = num + 1;
									});
					picReader.readAsDataURL(file);
				}
				/* $("#pro-image").val(''); */
			} else {
				console.log('Browser can not support');
			}
		}
	});
</script>
<style>
.preview-images-zone {width: 100%;border: 1px solid #ddd;min-height: 180px;/* display: flex; */padding: 5px 5px 0px 5px;position: relative;overflow:auto;}
.preview-images-zone > .preview-image:first-child { height: 185px; width: 185px; position: relative; margin-right: 5px;}
.preview-images-zone > .preview-image { height: 90px; width: 90px; position: relative; margin-right: 5px; float: left; margin-bottom: 5px;}
.preview-images-zone > .preview-image > .image-zone { width: 100%; height: 100%; }
.preview-images-zone > .preview-image > .image-zone > img { width: 100%; height: 100%;}
.preview-images-zone > .preview-image > .tools-edit-image { position: absolute; z-index: 100; color: #fff; bottom: 0; width: 100%; text-align: center; margin-bottom: 10px; display: none; }
.preview-images-zone > .preview-image > .image-cancel {  font-size: 18px; position: absolute; top: 0; right: 0; font-weight: bold; margin-right: 10px; cursor: pointer; display: none; z-index: 100; }
.preview-image:hover > .image-zone { cursor: move; opacity: .5; }
.preview-image:hover > .tools-edit-image,
.preview-image:hover > .image-cancel { display: block; }
</style>
<div class="main">
	<div class="main-content">
		<div class="container-fluid">
			<div class="row">
				<form action="/admin/look/modify.do" method="post"
					enctype="multipart/form-data">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading">LOOK 콘텐츠 상세</div>
						<div class="panel-body">
							<textarea name="content" class="form-control content"
								style="resize: none" placeholder="Look Content" rows="15"></textarea> <br />
							<input type="text" name="tag" class="form-control title" placeholder="Tag" required >
							<br>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="btn-group btn-group-toggle" data-toggle="buttons" >
								<c:forEach var="item" items="${lookStyleList}">
									<label class="btn btn-danger">
										<input type="radio" name="style" value='<c:out value="${item.idKey}"/>'><c:out value="${item.style}" />
									</label>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
						<fieldset class="form-group">
							<div class="form-group text-center" style="margin-bottom: 0">
								<a class="btn btn-primary" href="javascript:void(0)" onclick="$('#images').click()">Upload Image</a>
							</div>
								<input type="file" id="images" name="images" style="display: none;" class="form-control" multiple>
						</fieldset>
						<div class="preview-images-zone"></div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="form-group text-center" style="margin-bottom: 0">
								<button class="btn btn-primary">수정완료</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>