<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrap" id="wrap">
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain lkreg cate">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

		<div class="forms">
			<ul class="filters">
				<li class="style">
					<div class="ht">STYLE CATEGORY</div>
					<div class="ct">
						<ul class="list">
							<c:forEach var="lookStyle" items="${lookStyleList}">
								<li>
								<label>
								<input type="radio" name="style_cate"
										value='<c:out value="${lookStyle.idKey}"/>'> 
										<span class="tit"><c:out value="${lookStyle.style}" /></span>
								</label>
								</li>
							</c:forEach>
						</ul>
					</div>
				</li>
				<li class="hash">
					<div class="ht">TAG</div>
					<div class="ct">
						<div class="ipt">
							<input type="text" class="input" placeholder="#@"> 
							<a href="javascript:;" class="bt save">SAVE</a>
						</div>
						<div class="tags">
						</div>
					</div>
				</li>
				<li class="text">
					<div class="ht">DETAIL</div>
					<div class="ct">
						<div class="num on">MAX 500</div>
						<textarea class="textarea"></textarea>
					</div>
				</li>
			</ul>
		</div>

		<section class="steps st2">
			<ul class="st">
				<li>1</li>
				<li>2</li>
			</ul>
		</section>

		<section class="botFixed">
			<div class="in">
				<div class="btnSet fit">
					<!-- <a href="./look.do" class="btn type b fill xl">DONE</a> -->
					<a href="#" class="btn type b fill xl" >DONE</a>
				</div>
			</div>
		</section>

		</main>
	</div>




	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="/WEB-INF/views/common/app-layers.jsp"%>
	</div>

	<script>
	$(function() {
		var tags = [];
		$('.ipt a').click(function() {
			$('<span class="tg"><i>#'+$('.input').val()+'</i><a href="javascript:;" class="del">삭제</a></span>').appendTo(".tags");
			$('.input').val("");
			return false;
		});
		$('.tags').on("click", "a", function() {
			$(this).parent().remove();
			return false;
		});
 		$('.fit a').click(function() {
			$('.contain.lkreg.cate .filters>li.hash .tags .tg i').each(function(i) {
				tags.push($(this).text().replace("#",""));
			});
			
			fp.util.jsonAjax({
				url: '/app/look/regist.do',
				data : {
					styleIdkey : $("input[name=style_cate]:checked").val(),
					tags : tags,
					content : $(".textarea").val(),
					images : fp.data.look.images
				},
				success: function(data) {
					alert(data);
				},
				error : function(data) {
					alert(data);
				}
			});
			
			return false; /*등록후 돌아오면 안되므로*/
		});
		
	});
	</script>

	<!--// 컨텐츠 끝 -->
</div>