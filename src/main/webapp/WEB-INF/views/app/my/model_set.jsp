<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain mdl set">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Model Setting</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="guds">
				모델을 등록하면 <br> 모델사이즈로 LOOK을 지정할 수 있습니다.
			</div>

			<div class="sec mdls">
				<ul class="list">
					<c:forEach var="model" items="${userModelInfoList}" varStatus="status">
						<li id="<c:out value="${model.idKey}"/>">
							<div class="box">
								<div class="pic"><a href="<c:out value="${model.imgUrl}"/>" class="bt"><img src="<c:out value="${model.imgUrl}"/>" alt=""></a></div>
								<div class="name"><c:out value="${model.modelName}"/></div>
								<div class="bts">
									<a href="javascript:removeModel('<c:out value="${model.idKey}"/>')" class="bt del">Delete</a>
								</div>
							</div>
						</li>
					</c:forEach>

				</ul>
			</div>

			<div class="msgs">
				모델 삭제 시 모든 LOOK 게시물이 <br>
				삭제되니 신중히 결정해주시기 바랍니다.
			</div>

			
			<!-- <section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./model_reg1.jsp" class="btn type b fill xl">Done</a>
					</div>
				</div>
			</section> -->

		</main>
	</div>

	<script>

	$(document).ready(function(){
        removeModel = function(id){

            var modelData = {

                'modelKey' : id,
				'useYn' : 'N'

			}

            fp.util.jsonAjax({
                url : '/app/my/updateUserModelMap.do',
                data : modelData,
                success : function(data) {
                    console.dir(data);
                   alert('삭제되었습니다');
                },
                error: function(data) {
                    alert("error");
                }
            });

            var liBox = document.getElementById(id);
            liBox.innerHTML='';
        }

	});

	</script>
	
	<!--// 컨텐츠 끝 -->


	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>
</div>
