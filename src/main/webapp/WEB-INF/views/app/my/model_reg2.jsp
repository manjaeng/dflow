<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain mdl reg r2">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Model Register</h1>
			</div>
		</div>
		<main id="contents" class="contents">
		<input type="hidden" name="modelName" id="modelName" value='<c:out value="${modelName}"/>'/>
		<input type="hidden" name="nation" id="nation" value='<c:out value="${nation}"/>' />
		<input type="hidden" name="imageUrl" id="imageUrl" value='<c:out value="${imageUrl}"/>' />
			<section class="sec size">
				<div class="uiSize">
					<div class="sets default">
						<ul class="filter">
							<li class="gender">
								<div class="ht"><span class="tit">성별</span></div>
								<div class="ct">
									<label class="radio"><input type="radio" name="filter_gender" value="female" id="isFemale"
																<c:if test="${isFemale eq 'true'}">checked </c:if> > <span>FEMALE</span></label>
									<label class="radio"><input type="radio" name="filter_gender" value="male" <c:if test="${isFemale eq 'false'}">checked</c:if>><span>MALE</span></label>
								</div>
							</li>
							<li class="hgt">
								<div class="ht"><span class="tit">HEIGHT</span> <span class="unit"><select id="hgt_unit" class="select" ><option value="1" selected="selected" >CM</option><optionv value="2">FT</optionv></select></span> </div>
								<div class="ct cm" id="hgt_unit_box">
									<div class="uiSlider hgt cm">
										<div class="height" id="sizeHeightSliderCm" data-amount="168">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<div class="range_amount" id="height"></div>
											<div class="nums">
												<span class="num min">1M</span>
												<span class="num max">2M<i></i></span>
											</div>
										</div>
									</div>
									<div class="uiSlider hgt ft">
										<div class="height" id="sizeHeightSliderFt" data-amount="5.6">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<div class="range_amount" id="brbFr"></div>
											<div class="nums">
												<span class="num min">3FT</span>
												<span class="num max">7FT<i></i></span>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="size age">
								<div class="ht"><span class="tit">AGE</span> </div>
								<div class="ct">
									<div class="amount">
										<input type="number" name="age" id="age" value="28">
									</div>
								</div>
							</li>
							<li class="fit">
								<div class="ht"><span class="tit">Fit</span></div>
								<div class="ct">
									<div class="uiSlider fit">
										<div class="fit" id="sizeFittSlider" data-amount="50">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<!-- <div class="range_amount"></div> -->
											<div class="nums">
												<span class="num min">Tight</span>
												<span class="num mid">FIT</span>
												<span class="num max">Loose</span>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="size bust">
								<div class="ht"><span class="tit"><em id="bustChest"> Bust</em> <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select" id="sizeType"><option value="1">CM</option><option value="2">INCH</option></select></span> </div>
								<div class="ct">
									<div class="amount">
										<input type="number" value="50" id="bust">
									</div>
									<div class="num"><em class="n">50</em> <i class="s">CM</i></div>
								</div>
							</li>
							<li class="size hip">
								<div class="ht"><span class="tit">Hip <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>CM</option><option>INCH</option></select></span> </div>
								<div class="ct">
									<div class="amount">
										<input type="number" value="51" id="hip">
									</div>
									<div class="num"><em class="n">51</em> <i class="s">CM</i></div>
								</div>
							</li>
						</ul>

					</div>

					<div class="sets detail">
						<div class="hdt">
							<span class="tit">DETAIL SIZE</span>
							<div class="btnTog"><a href="#tog_detailsize" data-ui-tog="btn" class="bt tog">열기</a></div>
						</div>
						<div class="cdt" id="tog_detailsize" data-ui-tog="ctn">
							<ul class="filter">
								<li class="size">
									<div class="ht"><span class="tit">Waist <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21" id="waist">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Sleeve Length <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21" id="sleeve">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Upper Arm <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21" id="arm">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Thigh <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21" id="thigh">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</section>


			<section class="steps st2">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:saveModel()" class="btn type d fill xl">Save</a>
					</div>
				</div>
			</section>

		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	$(document).ready(function() {
        ui.size.init();

        saveModel = function () {

            fp.util.jsonAjax({
                url: '/app/my/modelregist.do',
                data: {
                    modelName : document.getElementById("modelName").value,
                    nation : document.getElementById("nation").value,
                    imageUrl : document.getElementById("imageUrl").value,
                    gender: document.getElementById("isFemale").checked,
                    height: document.getElementById("sizeHeightSliderCm").getAttribute("data-amount"),
                    age: document.getElementById("age").value,
                    fit: document.getElementById("sizeFittSlider").getAttribute("data-amount"),
					bust: document.getElementById("bust").value,
                    hip: document.getElementById("hip").value,
                    waist: document.getElementById("waist").value,
                    sleeve: document.getElementById("sleeve").value,
                    arm: document.getElementById("arm").value,
                    thigh: document.getElementById("thigh").value,

                    heightfr: document.getElementById("sizeHeightSliderFt").getAttribute("data-amount"),

                    bustfr: document.getElementById("bust").value,
                    hipfr: document.getElementById("hip").value,
                    waistfr: document.getElementById("waist").value,
                    sleevefr: document.getElementById("sleeve").value,
                    armfr: document.getElementById("arm").value,
                    thighfr: document.getElementById("thigh").value,

                    sizeType: document.getElementById("sizeType").value,
                    heightType: document.getElementById("hgt_unit").value
                },
                success: function () {
                    location.href = '/app/my/profile.do';
                },
                error: function () {
                    alert("error");
                }
            });
        }
    });

	</script>
	
	<!--// 컨텐츠 끝 -->

</div>

