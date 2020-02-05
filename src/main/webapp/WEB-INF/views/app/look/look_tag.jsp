<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain lkreg tag">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<a href="./look_upload.jsp" class="bt save">저장</a>
				</div>
				<h1 class="tit">Tag Items</h1>
			</div>
		</div>
		<main id="contents" class="contents">
<c:forEach var="lookItem" items="${lookList}" varStatus="status">
			<section class="sec tagset">
				<div class="uiPhoto active">
					<div class="photo">
						<c:set var="mainLoopimageUrl" value="${s3Url}${lookItem.image[0]}"/>
						<div class="pic"><img class="img" src="${mainLoopimageUrl}" alt="사진" onClick="javascript:clickLook()"></div>
						<div class="uiTag" style="left: 10%; top: 20%;">
							<button class="bt" type="button">태그</button>
							<article class="pop left top">
								<div class="pan">
									<button class="close" type="button">닫기</button>
									<div class="info">
										<div class="name">롱코트롱코트롱코트롱코트롱코트롱코트롱코트</div>
										<div class="pric"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
									</div>
								</div>
							</article>
						</div>
					</div>
				</div>
			</section>

</c:forEach>>
			<div class="btsTag">
				<a href="javascript:;" class="btAddTag" onclick="popSchItem();">tag items</a>
			</div>

		</main>
	</div>




	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<!-- 상품검색팝업  -->
		<article class="popLayer c popSchItem" id="popSchItem">
			<div class="pbd">
				<button type="button" class="btnPopClose">닫기</button>
				<div class="sec formSch">
					<div class="sch">
						<input type="search" class="input key" id="input_kwd" oninput="search_item();">
					</div>
				</div>
				<div class="pct">
					<main class="poptents">

						<div class="itemList">
							<div class="msgs" id="search_msg">Search  Your Items</div>
							<ul class="tlist" id="search_res" style="display: none;">
								<c:forEach var="productItem" items="${data}" varStatus="status">
								<li>
									<a href="javascript:;" class="item" onclick="popSchItemSel();">
										<span class="img"><span class="lk"><img src="${productItem.imageUrl}" alt=""></span></span>
										<div class="info">
											<div class="name"><c:out value="${productItem.pname}"/></div>
											<div class="pric"><em class="w">&#8361;</em><span class="p"><c:out value="${productItem.price}"/></span></div>
										</div>
									</a>
								</li>
								</c:forEach>

							</ul>
						</div>

					</main>
				</div>
			</div>
		</article>

		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	function lookClick(){};
	function popSchItem(){
		ui.popLayer.open('popSchItem',{
			ocb:function(){
				$("#input_kwd").val("").trigger("input");
			},
			ccb:function(){
				$(".pageHd .bts .save").addClass("active");
			}
		});
	};
	function popSchItemSel(){
		ui.popLayer.close('popSchItem');
	};
	
	function search_item(){
		var kwd = $("#input_kwd").val();
		if( kwd!="" ){
			// console.log("show");
			$("#search_res").show();
			$("#search_msg").hide();
		}else{
			$("#search_res").hide();
			$("#search_msg").show();
		}
		ui.popLayer.scroll.popSchItem.refresh();
	}

	</script>
	
	<!--// 컨텐츠 끝 -->


	<!--// 컨텐츠 끝 -->
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

	
</div>

