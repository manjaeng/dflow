<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrap" id="wrap">
	<div class="pageHd">
		<div class="in">
			<div class="bts">
				<a href="javascript:history.back();" class="hisback">뒤로</a>
			</div>
			<h1 class="tit">Profile</h1>
		</div>
	</div>
	<div id="contain" class="contain my prf set">
		<main id="contents" class="contents">

			<section class="uiPrfeSet b">
				<div class="user">
					<div class="photo">
						<div class="pic">
							<img src='<c:out value="${empty profileInfo.imageUrl ? '/resources/app/images/common/profile_no.png' : profileInfo.imageUrl}"/>' alt="">
						</div>
						<div class="bts"><a href="javascript:;" class="bt mod" onclick="popPrfPicMod();">수정</a></div>
					</div>
				</div>
			</section>

			<section class="prfeForm">
				<ul class="list">
					<li class="nick">
						<span class="dt">닉네임</span>
						<span class="dd"><input class="input bdn" type="text" value='<c:out value="${profileInfo.nickName}"/>'></span>
					</li>
					<li class="id">
						<span class="dt">아이디</span>
						<span class="dd"><input class="input bdn" type="text" value='<c:out value="${profileInfo.userId}"/>' disabled></span>
					</li>
					<li class="intro">
						<span class="dt">소개</span>
						<span class="dd">
							<textarea class="textarea bdn"><c:out value="${profileInfo.content}"/></textarea>
						</span>
					</li>
					<li class="gender">
						<span class="dt">성별</span>
						<span class="dd">
							<label class="radio"><input type="radio" name="gender1" disabled <c:out value="${profileInfo.gender eq 'woman' ? 'checked' : ''}"/>><span>여자</span></label>
							<label class="radio"><input type="radio" name="gender1" disabled <c:out value="${profileInfo.gender eq 'man' ? 'checked' : ''}"/>><span>남자</span></label>
						</span>
					</li>
					<li class="nation">
							<div class="dt">국가</div>
							<div class="dd">
								<div class="sel">
									<select class="select">
										<option <c:out value="${profileInfo.country eq 'korea' ? 'selected' : ''}"/>>KOREA</option>
										<option <c:out value="${profileInfo.country eq 'china' ? 'selected' : ''}"/>>CHINA</option>
										<option <c:out value="${profileInfo.country eq 'japan' ? 'selected' : ''}"/>>JAPAN</option>
										<option <c:out value="${profileInfo.country eq 'india' ? 'selected' : ''}"/>>INDIA</option>
									</select>
								</div>
							</div>
						</li>
				</ul>
				<div class="memDis">
					<a href="../member/memDis.jsp">회원탈퇴</a>
				</div>
			</section>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./profile.jsp" class="btn type b fill xl" id="profileEditBtn">Done</a>
					</div>
				</div>
			</section>

		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>


	<script>
		$(function() {
			$('#profileEditBtn').click(function() {
				
				var profileEdit = {
					nickName : $('.prfeForm .nick input').val(),
					content  : $('.intro .textarea').val(),
					country  : $('.nation .select').val().toLowerCase()
				}

				if($.trim(profileEdit.nickName).length === 0) {
					$('.prfeForm .nick input').val('');
					$('.prfeForm .nick input').focus();
					return false;
				}
				
				if($.trim(profileEdit.content).length > 45) {
					alert('최대 45 가능!');
					return false;
				}
				
				fp.util.jsonAjax({
					url : '/app/my/profile_edit.do',
					data : profileEdit,
	                success : function(data) {
	                	if(data === "t") {
	                		
	                		pjax('/app/my/profile.do');
	                		
	                	} else {
	                		console.log('실패');
	                	}
	                },
	                error : function(x, s, e) {
	                	console.log('error');
	                }
				});
				

				return false;
			});
		});
	</script>

</div>