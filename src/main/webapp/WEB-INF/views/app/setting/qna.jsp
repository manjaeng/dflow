<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain qna">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<a href="javascript:;" class="bt write" onclick="popQnaWrite();">쓰기</a>
				</div>
				<h1 class="tit">1 : 1 문의</h1>
			</div>
		</div>
		<main id="contents" class="contents">

			<div class="sec qna">
				<div class="nodata">
					<div class="msg">문의가 존재하지 않습니다.</div>
				</div>
				<ul class="uiAccd list" data-accd="accd" id="qna_list">
				</ul>
				<ul class="list-template" style="display: none;">
					<li>
						<div class="hBox"><span class="date">-</span> <span class="tit">[문의]</span> <span class="rpd">-답변완료</span> <a href="javascript:;" class="btnTog">열기</a></div>
						<div class="cBox">
							<div class="q">
								<div class="tit">[문의]</div>
								<div class="msg">question</div>
							</div>
							<div class="a">
								<div class="tit">[운영답변]-</div>
								<div class="msg">-answer-</div>
							</div>
						</div>
					</li>
				</ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</div>

		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->

		<!-- qnaWrite 샘플2 -->
		<article class="popLayer a popQnaWrite" id="popQnaWrite">
			<div class="pbd">
				<div class="phd">
					<div class="in">
						<h1 class="tit">1:1 문의작성</h1>
						<button type="button" class="btnPopClose">닫기</button>
					</div>
				</div>
				<div class="pct">
					<main class="poptents">
						<div class="sec forms">
							<ul class="form">
								<li class="subj">
									<div class="dt">TITLE</div>
									<div class="dd">
										<input type="text" class="input">
									</div>
								</li>
								<li class="memo">
									<div class="dt">CONTENTS</div>
									<div class="dd">
										<textarea class="textarea"></textarea>
									</div>
								</li>
							</ul>
						</div>
						
					</main>
				</div>
				<div class="pbt">
					<div class="bts"><a href="javascript:void(0);" class="btn type b fill xl save">Done</a></div>
				</div>
			</div>
		</article>

	</div>

	<script>

	var popQnaWrite = function(){
		ui.popLayer.open('popQnaWrite');
	}
	
	var page = -1;
	var morePage = true ;

	$(window).on("scroll", function() {

		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + 30;
		// console.log(docH,scr);
		if (docH <= scr  && morePage) {
			console.log("바닥sss");
			$(".uiLoadMore").trigger('click');
			morePage = false;
		}
	});

	$(document).ready(function(){
		$('a.save').click(function() {
			
			var title = $('.subj .input').val();
			var content = $('.memo .textarea').val();
			
			if(title.length != 0 && content != 0) {
				 fp.util.jsonAjax({
					url : '/app/setting/qna.do',
					data : {
	                    title : $.trim(title),
	                    content : $.trim(content)
	                },
	                success : function(data) {
	                	if(data === "success") {
	                		 console.log('success');
	                         location.reload();
	                	}
	                },
	                error : function(x, s, e) {
	                    console.log(x);
	                }
				});
			} else {
				alert('제목과 내용을 입력해 주세요!')
			} 
            
            return false;
		});
		
		$('body').delegate('.btnTog', 'click', function() {
			var $pnt = $(this).closest("li");
			var isHidden = $pnt.children(".cBox").is(":hidden");
			$(this).closest(".uiAccd").find(">li").removeClass("open").children(".cBox").slideUp(100);
			if (isHidden) {
				window.setTimeout(function() {
					$pnt.addClass("open").children(".cBox").slideDown(100);
				}, 110);
			}
		});

		$(".uiLoadMore").click( function(){

			$('div.nodata').hide();
			$(".uiLoadMore").addClass("active");
			page ++ ;
			
			var url = '/app/setting/qna_list.do?pageStart='+page;
			$.get(url )
			.done(function( data ) {
				//alert(JSON.stringify(data));
				var listTemplate = $('ul.list-template').find('li');

				$.each(data, function(idx, item) {
					var row = listTemplate.clone(false);
					row.find('.cBox').hide();
					row.addClass('except');	//기본 이벤트 안타게 처리함.

					row.find('span.date').text(item.createDate.replace(/-/g, '.'));
					row.find('span.tit').text('[문의]' + item.title);
					
					var q = row.find('div.q');
					q.find('div.tit').html('[문의]' + item.title);
					q.find('div.msg').html(item.content);
					
					var a = row.find('div.a');
					if(item.status) {
						a.find('div.tit').html('[운영답변]' + item.title);
						a.find('div.msg').html(item.answer);
					}
					else {
						row.find('span.rpd').remove();
						a.remove();
					}

					q.find('div.tit').html('[문의]' + item.title);
					q.find('div.msg').html(item.content);

					$("#qna_list").append(row);
				})

				console.log("페이징 = " + page);
				morePage = (data.length > 0);
				if (!morePage) {
					console.log("끝");
					$(".uiLoadMore").addClass("hide");
					morePage = false ;
				}
				//ui.accd.set();
				$(".uiLoadMore").removeClass("active");

				//전체 건수가 0인 경우.
				if($("#qna_list").find('li').length==0) {
					$('div.nodata').show();
					return;
				}

			});	//End-of-$.get(url )
		});
		
		//화면 로딩시 자동으로 목록 조회.
		$(".uiLoadMore").trigger('click');
	});

	
	
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>
