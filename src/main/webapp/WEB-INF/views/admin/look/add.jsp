<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type='text/javascript'>
	$(function() {
		$("#pro-image").on('change', readImage);

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
		$('form').submit(function() {
		}); 
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
			
				<form action="/admin/look/add.do" method="post" enctype="multipart/form-data">
				
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading">룩 등록</div>
						<div class="panel-body">
							<input type="text" name="title" class="form-control" required
								placeholder="Title"> <br>
							<textarea name="content" class="form-control"
								style="resize: none" placeholder="Look Content" rows="15"></textarea>
							<br>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
						<fieldset class="form-group">
							<div class="form-group text-center" style="margin-bottom: 0">
								<a class="btn btn-primary" href="javascript:void(0)" onclick="$('#pro-image').click()">Upload Image</a>
							</div>
								<input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
						</fieldset>
						<div class="preview-images-zone"></div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="form-group text-center" style="margin-bottom: 0">
								<button class="btn btn-primary">등록</button>
							</div>
						</div>
					</div>
				</div>
				
				</form>
				
			</div>
		</div>
	</div>
</div>