<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain mdl reg r1">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Model Register</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="guds">
				모델 등록 후 모델명과 사이즈는 변경이 불가하니  <br>신중히 작성해 주시기 바랍니다.
			</div>

			
			<section class="prfeForm">
				<div class="photo">
					<div class="pic"><img src="//placeimg.com/160/160/1" alt=""></div>
					<div class="bts"><a href="javascript:;" class="bt mod">수정</a></div>
				</div>
				
				<ul class="list">
					<li class="name">
						<span class="dt">모델명</span>
						<span class="dd"><input id="modelName" class="input bdn" type="text" value=""></span>
					</li>
					<li class="gender">
						<span class="dt">성별</span>
						<span class="dd">
							<label class="radio" ><input type="radio" id="isFemale" name="gender1" checked="checked"><span>FEMALE</span></label>
							<label class="radio"><input type="radio" name="gender1"><span>MALE</span></label>
						</span>
					</li>
					<li class="nation">
						<span class="dt">국가</span>
						<span class="dd">
							<select class="select nt" id="nation">
								<option value='KOREA' >KOREA</option>
										<option value='CHINA'> CHINA</option>
										<option value='JAPAN'> JAPAN</option>
										<option value='TAIWAN'> TAIWAN</option>
										<option value='INDONESIA'> INDONESIA</option>
										<option value='HONGKONG'> HONGKONG</option>
										<option value='SINGAPORE'> SINGAPORE</option>
										<option value='MALAYSIA'> MALAYSIA</option>
										<option value='THAILAND'> THAILAND</option>
										<option value='PHILIPPINES'> PHILIPPINES</option>
										<option value='VIETNAM'> VIETNAM</option>
										<option value='INDIA'> INDIA</option>
							</select>
						</span>
					</li>
				</ul>
			</section>
			
			<section class="steps st1">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section>
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:goTosecond()" class="btn type b fill xl">NEXT</a>
					</div>
				</div>
			</section>

		</main>
	</div>




	<script>

	$(document).ready(function(){

	    goTosecond = function(){
	        var modelName= document.getElementById("modelName").value;
	        var isFemale = document.getElementById("isFemale").checked;
	        var nation = document.getElementById("nation").value;

	        //alert(modelName + isFemale + nation);
			location.href = "/app/my/model_reg2.do?modelName=" + modelName + "&isFemale=" +isFemale+ "&nation=" + nation

		}

	});

	</script>
	
	<!--// 컨텐츠 끝 -->


	
</div>

