﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav id="floatNav" class="floatNav">
	<!-- <button type="button" class="bt refresh">Refresh</button> -->
	<!-- <button type="button" class="bt top">TOP</button> -->
	<!-- <button type="button" class="bt prf" onclick="togThumbMode();">Tog</button> -->
	<a href="../common/search.jsp" class="bt sch">검색</a>
</nav>

<nav id="menubar" class="menubar">
	<div class="inner">
		<ul class="menu">
			<li class="home"><a href="/app/home/home.do">HOME</a></li>
			<li class="adds"><a href="javascript:;" onclick="popLookReg();">[<em>+</em>]</a></li>
			<li class="look"><a href="/app/look/look.do" id="btnLookAct">LOOK</a></li>
			<li class="mypg"><a href="/app/my/profile.do">MY</a></li>
		</ul>
	</div>
</nav>

<c:if test="${empty sessionScope.__sessiondata__}">
	<script>
		$('#menubar .mypg').click(function() {
			ui.confirm({
				msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
					'<p>로그인화면으로 <br>이동하시겠습니까?</p>',
				ycb: function(){
					pjax('/app/user/login.do?after=my');
				}
			});
			return false;
		});
	</script>
</c:if>

<script>	
// $(document).ready(function(){
	
// 	var tapped = false;
// 	$(document).on("click","#btnLookAct",function(e){
// 		if ( !$(this).closest("li").hasClass("active") ) {
// 			location.href = "../look/look.jsp";
// 			return;
// 		}
		
// 		if( !tapped ){ // single_tap 
// 			tapped = setTimeout(function(){			
// 				tapped = null;
// 				console.log("싱글터치");
// 				location.href = "../look/look.jsp";
// 			},300); //wait 300ms
// 		}else{  // double_tap
// 			clearTimeout(tapped);
// 			tapped = null;
// 			console.log("더블터치");
// 			if( $(this).closest("li").hasClass("on") ){
// 				$(this).closest("li").removeClass("on");
// 			}else{
// 				$(this).closest("li").addClass("on");
// 			}
// 			return false;
// 		}
// 	});
// });
</script>