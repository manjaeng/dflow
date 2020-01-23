<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">

		<!-- 컨텐츠 시작 -->

		<div id="contain" class="contain int">
			<main id="contents" class="contents">

				<article class="intro" id="intro">
					<div class="msg">FIND YOUR FIT</div>
					<a href="../home/home.jsp" class="logo">FAPEE</a>
					<div class="box bx1">
						<span class="line L1"></span>
						<span class="line L2"></span>
						<span class="line L3"></span>
						<span class="line L4"></span>
						<span class="line L5"></span>
						<span class="line L6"></span>
						<span class="line L7"></span>
						<span class="line L8"></span>
						<span class="line L9"></span>
						<span class="line L10"></span>
					</div>
					<div class="box bx2">
						<span class="line L1"></span>
						<span class="line L2"></span>
						<span class="line L3"></span>
						<span class="line L4"></span>
						<span class="line L5"></span>
						<span class="line L6"></span>
						<span class="line L7"></span>
						<span class="line L8"></span>
						<span class="line L9"></span>
						<span class="line L10"></span>
					</div>
				</article>


			</main>
		</div>





		<!--// 컨텐츠 끝 -->

	</div>
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
        var introStart = function(){
            $("#intro").addClass("on");

            $("#intro .logo").on("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){
                console.log("이동");
                setTimeout(function(){

                    location.href = "/app/intro/step1.do";
                },100);
            });
        }
        $(document).ready(function(){
            introStart();
        });

	
	</script>
</div>