//*******************************************//
// 김기현 : kimkee@naver.com    
// date : 2019-06-12 ~
//*******************************************//

var ui = {
	init:function(){
		this.cm.init();
		this.ly.init();
		this.form.init();
		this.accd.init();
		this.tab.init();
		this.popLayer.init();
		this.slides.init();
		this.datePick.init();
		this.listLoad.init();
	},
	cm:{ // 공통
		init:function(){

		}
	},
	isUA:function(t){
		return navigator.userAgent.indexOf(t) > -1;
	},
	param:(function(a) { // URL에서 파라미터 읽어오기  ui.param.***
		if (a == "") return {};
		var b = {};
		for (var i = 0; i < a.length; i++){
			var p=a[i].split('=');
			if (p.length != 2) continue;
			b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
		}
		return b;
	})(window.location.search.substr(1).split('&')),
	nav:{ // 하단 메뉴 활성화
		act:function(dep1){
			$("nav.menubar ul.menu>li."+dep1+"").addClass("active").siblings("li").removeClass("active");
		}
	},
	ly:{ // 레이아웃
		init:function(){
			if ( $("#contain").length ) {
                var cls = $("#contain").attr("class").replace("contain","");
                $("body").addClass(cls);
            }
            $(window).on("load resize scroll", this.resize );
			
			$.fn.scrollStopped = function(callback) { // 스크롤 스톱 scroll stop event  
				$(this).scroll(function(){
					var self = this, $this = $(self);
					if($this.data('scrollTimeout')) {
						clearTimeout($this.data('scrollTimeout'));
					}
					$this.data('scrollTimeout', setTimeout(callback,250,self));
				});
			};

			$(".floatNav").length && this.floating.init();
			$("#menubar").length &&	this.botNav.init();

        },
		botNav:{
			show:function(){
				$("#menubar").removeClass("hide");
				$(".floatNav").removeClass("hide");
			},
			hide:function(){
				$("#menubar").addClass("hide");
				$(".floatNav").addClass("hide");
			},
			init:function(){

				var prevPosition = 0;
				var dnVar = 0;
				var upVar = 0;
				var scrStopEvent = null;
			
				$(window).on("pageshow scroll", function(e){  // 스크롤 내리는 중 OR 올리는중 

					var initPosition = $(this).scrollTop();
					if(initPosition > prevPosition){
						dnVar ++ ;
						// console.log("dn");
						ui.ly.botNav.hide();
						//스크롤다운중;
						upVar = 0;
						$(window).scrollStopped(function(){
							// console.log("scroll 스톱");
							// console.log(scrStopEvent);

							/* clearTimeout(scrStopEvent);
							scrStopEvent = window.setTimeout(function(){
								ui.ly.botNav.show();
								clearTimeout(scrStopEvent);
							},800); */
						});

					}else {
						upVar ++ ;
						// console.log("up");
						//스크롤 업중;
						dnVar = 0;
						ui.ly.botNav.show();
					}
					prevPosition = initPosition ;

					

				});

				$(window).on("pageshow scroll", function(e){ // 스크롤 맨 밑에 일때
					var docH = $(document).height();
					var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
					// console.log(docH,scr);
					if(docH <= scr + 0 ){				
// 						console.log("바닥");						
						ui.ly.botNav.show();
						// return false;
					}else{
						// ui.ly.botNav.hide();
						// return false;
					}
				});


			}
		},
		floating:{
			init:function(){
				this.event();
			},
			event:function(){
				$(document).on("click", ".floatNav button.top", this.using );
				$(document).on("click", ".floatNav button.refresh", function(){
					location.reload();
				} );
				$(window).on("scroll load", this.top );
			},
			using:function(){
				var els = $(this);
				if (els.hasClass("disabled")) return false;
				$("body,html").animate({ scrollTop: 0 }, 300, function() {
					els.removeClass("disabled");
				});
				els.addClass("disabled");
			},
			top:function(){
				var scr = $(window).scrollTop();
				if (scr > 200) {
					$(".floatNav").addClass("active");
				} else {
					$(".floatNav").removeClass("active");
				}
				if (ui.isUA("NAVER") || ui.isUA("DaumApps")) {
					$(".floatNav").removeClass("active");
				}
			}
		},
        resize:function(){
			// $(".header .logo").html( window.innerHeight );
			/*
			var fixBot = $(".wrap>nav.nav").outerHeight();
			var pageHd = $(".contain .pageHd").outerHeight();
			if( fixBot){
				$("body").addClass("isBotNav");
			}else{
				$("body").removeClass("isBotNav");
			}
			if( pageHd){
				$("body").addClass("isPageHd");
			}else{
				$("body").removeClass("isPageHd");
			}
			*/
        },
		contHeight:function(){
			/*
			var $contain = $(".wrap>.contain");
			var winH = $(window).height();
			var headH = $(".wrap>.head").outerHeight();
			var footH = $(".wrap>.foot").outerHeight();
			var navH = $(".wrap>.nav").outerHeight();
			$contain.css("min-height", winH - headH - footH - navH);
			*/
		}
	},
	form:{  //  폼요소
		init:function(){
			this.attach();
			this.search();
			this.chkall();
			this.spinner.init();
			this.star.init();
			this.placeholder.init();
		},
		placeholder:{ // uiIptPlc
			init:function(){
				var _this =  this;
				$(".uiIptPlc").find(">.plc").on("click",function(){
					$(this).prev(".input").trigger("focus");
				});
				$(".uiIptPlc").find(">.input").on("focus blur",function(){
					_this.using();
				});

				_this.using();
			},
			using:function(){
				$(".uiIptPlc").find(">.input").each(function(){
					var myEls = $(this);
					var myVal = $(this).val();
					if( myVal) {
						myEls.addClass("on");
					}else{
						myEls.removeClass("on");
					}
				});
			}
		},
		search:function(){
			$(document).on("keyup",".uiSchIpt input",function (e) {
			    if( e.keyCode == 13 ) {
			        $(this).next(".sch").trigger("click");
					console.log( $(this).val() );
			    }
			});
		},
		attach:function(){

			$(document).on("change","[data-ui='attach'].uiAttach .fileButton .fileInput", function(){
				var fSize = $(this).closest(".uiAttach").find(".file").find("li").length;
				var maxSize = $(this).closest(".uiAttach").data("maxSize");
				console.log( fSize , maxSize);
				if( fSize >= maxSize ){
					// console.log("최대갯수 = "+maxSize);
					return false;
				}
				var fUrl = (this.value).split("\\");
				var fName = fUrl[fUrl.length-1];
				console.log(fName);
				if (fName) $(this).closest(".uiAttach").find("ul").append('<li><span class="name">'+fName+'</span><button type="button" class="delete">삭제</button></li>');
				var locVar = $(this).closest(".uiAttach").find(".file .name").text();

				if(locVar) $(this).closest(".uiAttach").addClass("on");
				// console.log( $(this).closest(".uiAttach").find(".fileButton .fileInput").val()  ) ;
			});
			$(document).on("click","[data-ui='attach'].uiAttach .file .delete", function(){
				var lsize = $(this).closest(".file").find("li").length;
				// console.log( lsize , $(this).closest(".uiAttach").find(".fileButton .fileInput").value );
				if ( lsize > 1) {
					$(this).closest("li").remove();
				}else{
					$(this).closest(".uiAttach").find(".fileButton .fileInput").val("");
					$(this).closest(".uiAttach").removeClass("on");
					$(this).closest("li").remove();
				}
			});

			$(document).on("change", "[data-ui='attach'].uiAddFile .fileButton .fileInput", function() {
				var fUrl = (this.value).split("\\"),
					fName = fUrl[fUrl.length - 1];
				$(this).closest(".uiAddFile").find(".file .loc").val(fName);
				var locVar = $(this).closest(".uiAddFile").find(".file .loc").val();
				if (locVar) {
					$(this).closest(".uiAddFile").addClass("on");
				}
			});
			$(document).on("click", "[data-ui='attach'].uiAddFile .file .delete", function() {
				$(this).closest(".uiAddFile").find(".file .loc").val("");
				$(this).closest(".uiAddFile").find(".fileButton .fileInput").val("");
				$(this).closest(".uiAddFile").removeClass("on");
			});


		},
		chkall: function() { // 전체 첵크 ui 
			$(document).on("change", "[data-check='check']", function() {
				var thisId = $(this).data("checkId");
				var thisNum = $("[data-check='check'][data-check-id='" + thisId + "']").length;
				var thisChkNum = $("[data-check='check'][data-check-id='" + thisId + "']:checked").length;
				//console.log(thisId,thisNum,thisChkNum);
				if (thisChkNum >= thisNum) {
					$("[data-check='all'][data-check-id='" + thisId + "']").prop("checked", true);
				} else {
					$("[data-check='all'][data-check-id='" + thisId + "']").prop("checked", false);
				}
			});
			$(document).on("change", "[data-check='all']", function() {
				var thisId = $(this).data("checkId");
				var thisCheck = $("[data-check='check'][data-check-id='" + thisId + "']");
				//console.log(thisId , thisCheck);
				if ($(this).is(":checked")) {
					thisCheck.prop("checked", true);
				} else {
					thisCheck.prop("checked", false);
				}
			});
		},
		spinner:{
			init:function(){
				$(".uiSpinner").length && this.using();
				$(".uiSpinner").length && this.stat();
			},
			using:function(){
				var _this = this;
				$(".uiSpinner button").on("click",function(){
					var els = $(this).closest(".uiSpinner");
					var n = els.find("input");
					var nv = parseInt( els.find("input").val() );
					var bt = $(this).attr("class");
					//console.log(mx , nv);
					if( bt==="p" ){
						n.val( nv + 1 ) ;
					}
					if( bt==="m" ){
						n.val( nv - 1 ) ;
					}
					_this.stat();
				});
			},
			stat:function(){
				$(".uiSpinner").each(function(){
					var els = $(this).closest(".uiSpinner");
					var nv 	= els.find(".n").val();
					var max = parseInt(  els.data("max") );
					//console.log(nv , max);
					if( nv <= 1){
						els.find(".m").attr("disabled",true);
					}
					if( nv > 1){
						els.find(".m").attr("disabled",false);
					}
					if( nv >= max){
						els.find(".p").attr("disabled",true);
					}
					if( nv < max){
						els.find(".p").attr("disabled",false);
					}
					if(nv == 0){
						els.find(".m").attr("disabled",true);
						els.find(".p").attr("disabled",true);
					}
				});
			}
		},
		star:{
			init:function(){
				var _this =  this;
				$(".uiStar").length && this.using();
				$(document).on("click",".uiStar ul>li>button.st",function(){
					var myVar =  $(this).closest("li").index()+1;
					//console.log(myVar);
					$(this).closest(".uiStar").data("star",myVar);
					$(this).closest(".uiStar").attr("data-star",myVar);

					// console.log( myVar , $(this).closest(".uiStar").data("star")  );
					_this.using();

				});
			},
			using:function(){
				$(".uiStar").each(function(){
					$(this).find("ul>li").removeClass();
					//$(this).find("ul>li").removeClass("f");
					var v = $(this).attr("data-star");
					//v = v;
					vt = Math.floor(v/1);
					//vt = v.replace(/0/gi, '^');
					vp = (v%1);
					$(this).find(".p").html(v);
					//console.log(v,vt,vp);
					for (var i = 0; i <= vt; i++) {
						$(this).find("ul>li:nth-child("+i+")").addClass("f");
						
						if(vp){
							if(vt == 0 ){
								$(this).find("ul>li:nth-child(1)").addClass("h");
								//return false;
							}
							$(this).find("ul>li:nth-child("+vt+")").next("li").addClass("h");
							
						}
					}
				});
			}
		}
	},
	loading: { // 로딩중..
		show: function () {
			var els = '<div class="loadingPage"><em></em></div>';
			$("body").prepend(els);
		},
		hide: function () {
			$(".loadingPage").remove();
		}
	},
	accd: { // 아코디언 UI
		init: function() {
			$(window).on("load", this.using);
			$(window).on("load", this.tbl);
			this.set();
		},
		set:function(){
			$(".uiAccd>li>.cBox").hide();
			$(".uiAccd>li.open>.cBox").show();
			$(".uiAccd>li.except>.cBox").show();

			$(".uiAccdTbl>.cBox").hide();
			$(".uiAccdTbl>.cBox.open").show();
		},
		using: function() {
			$(document).on("click", ".uiAccd>li:not(.except)>.hBox>.btnTog", function() {
				var type = $(this).closest(".uiAccd").attr("data-accd");
				var $pnt = $(this).closest("li");
				//console.log(type);
				if (type === "tog") {
					if ($pnt.children(".cBox").is(":visible")) {
						$pnt.children(".cBox").slideUp(100);
						$pnt.removeClass("open");

					} else {
						$pnt.addClass("open").children(".cBox").slideDown(100);
					}
				}
				if (type === "accd") {
					$(this).closest(".uiAccd").find(">li").removeClass("open").not("li.except").children(".cBox").slideUp(100);
					if ($pnt.children(".cBox").is(":hidden")) {
						$pnt.addClass("open").children(".cBox").slideDown(100);
					}
				}

			});
		},
		tbl: function() {
			$(".uiAccdTbl>.cBox.open").prev(".hBox").addClass("open");

			$(document).on("click", ".uiAccdTbl>.hBox .btnTog", function() {
				// console.log("d");
				var type = $(this).closest(".uiAccdTbl").attr("data-accd");
				var $hBox = $(this).closest(".hBox");
				var $cBox = $(this).closest(".hBox").next(".cBox");
				// console.log(type);
				if (type === "tog") {
					if ($cBox.is(":visible")) {
						$cBox.hide();
						$hBox.removeClass("open");
						$cBox.removeClass("open");
					} else {
						$hBox.addClass("open");
						$cBox.addClass("open").show();
					}
				}
				if (type === "accd") {
					if ($cBox.is(":hidden")) {
						$cBox.prev(".hBox").addClass("open").siblings(".hBox").removeClass("open");
						$cBox.addClass("open").show().siblings(".cBox").removeClass("open").hide();
					} else {
						$cBox.prev(".hBox").removeClass("open");
						$cBox.removeClass("open").hide();
					}
				}
			});
		}
	},
	datePick:{ // 달력피커 jQuery-ui
		init:function(){
			$("input.datepicker").length && this.using(); 
				
			$("input.datepicker").on("click",function(){
				$(this).next(".ui-datepicker-trigger").trigger("click");
			});
			$("input.datepicker").on("focus",function(){
				$(this).blur();
			});
		},
		wkThis:function(){  // 일주일 단위선택 용 하이라이트
			var idx = $(".ui-datepicker").find(".ui-datepicker-current-day").index();
			var $td = $(".ui-datepicker").find(".ui-datepicker-current-day");
			if ( idx >= 1 ) { // 월화수목금토 선택시
				// console.log(idx)
				$td.closest("tr").find("td:not(:first-child)").addClass("activeDays");
				$td.closest("tr").next("tr").find("td:first-child").addClass("activeDays");
			}else{ // 일요일 선택시
				// console.log(idx);
				$td.addClass("activeDays");
				$td.closest("tr").prev("tr").find("td:not(:first-child)").addClass("activeDays");
			}
		},
		using:function(){
			$("input.datepicker").datepicker({
				// minDate: '-3M',
      			// maxDate: '+28D',
				showOn: "button",
				changeYear:true ,
				changeMonth:true,
				buttonText: "달력",
				showMonthAfterYear: true,
				dateFormat:"yy-mm-dd",
				yearRange: 'c-100:c+10',
				dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNamesShort: [ "1","2","3","4","5","6","7","8","9","10","11","12"],
				beforeShow: function(els) {
					$(".ui-datepicker").wrap('<div class="uiDatePickWrap"></div>');
					var sted = $(els).closest(".uiDate").attr("class").replace(" ","").replace("uiDate","");
					$("#ui-datepicker-div").removeClass("week").addClass(sted);
					// console.log(sted);
					window.setTimeout(ui.datePick.wkThis);
					ui.lock.using(true);
				},
				onChangeMonthYear:function(ddd){
					// console.log("달,년  변경");
					window.setTimeout(ui.datePick.wkThis);
				},
				onSelect :function(ddd){

				},
				onClose:function(date,els){
					// console.log(date,els);
					ui.lock.using(false);
					// $("#"+els.id).focus();
					$(".ui-datepicker").unwrap(".uiDatePickWrap");
				}
			});

		}
	},
	tab:{ //탭형식컨텐츠
		init:function(){
			this.using();
			// console.log(  ui.param.tab );
			ui.tab.set( ui.param.tab );
		},
		set:function(id){
			$(".uiTab>li>a[href='#"+id+"']").trigger("click");
		},
		using:function(){
			$(document).on('click',".uiTab:not([data-ui*='link'])>li>a", function(e){
				$(this).closest("li").addClass("active").siblings("li").removeClass("active");
				var thisId = $(this).attr("href");
				//console.log(thisId);
				if (thisId.indexOf("#") > -1 ) {
					$(thisId).addClass("active").siblings(".panel").removeClass("active");
				}
				e.preventDefault();
			});
		}
	},
	lock:{ // 스크롤 막기,풀기
		sct:0,
		stat:false,
		using:function(opt){
			
			var lockDiv = " .popLayer  , .popConfirm , .popAlert , .uiDatePickWrap" ;

			if(opt === true && this.stat === false ){
				this.stat = true;
				// ui.lock.sct = $(window).scrollTop();
				// $("body , html").addClass("lock");
				// $("html").css({"top":""+(-ui.lock.sct)+"px"});
				$(lockDiv).bind("touchmove scroll", function(e){ e.preventDefault() });
			}
			if(opt === false){
				this.stat = false;
				// $("body , html").removeClass("lock");
				// $("html").css({"top":""});
				// $(window).scrollTop( ui.lock.sct );
				$(lockDiv).unbind("touchmove scroll");
			}
		}
	},
    slides:{ // 스와이프 객체 생성 
        init:function(){
        	$(this.sample1.els +" ul.slide" ).length && this.sample1.using();
        	$(this.sample2.els +" ul.slide" ).length && this.sample2.using();
        	$(this.lookPic.els +" ul.slide" ).length && this.lookPic.using();
        	$(this.mnPic.els +" ul.slide" ).length && this.mnPic.using();
        	$(this.newBie.els +" ul.slide" ).length && this.newBie.using();
        	$(this.newUp.els +" ul.slide" ).length && this.newUp.using();
        },
		newBie:{  //  
            els: ".slideNewbie.swiper-container",
            opt: {
                slidesPerView: "auto",
                freeMode: true,
                observer: true,
                observeParents: true,
                spaceBetween:0,
                watchOverflow:true,
                loop: false
            },
            using: function() {
                if ( $(this.els).find(".swiper-slide").length <= 1 ) {
                    this.opt.loop = false;
                }
                this.slide = new Swiper(this.els, this.opt);
			}
        },
		newUp:{  //  
            els: ".slideNewup.swiper-container",
            opt: {
                slidesPerView: 2,
                freeMode: true,
                observer: true,
                observeParents: true,
                spaceBetween:0,
                watchOverflow:true,
                loop: false
            },
            using: function() {
                if ( $(this.els).find(".swiper-slide").length <= 1 ) {
                    this.opt.loop = false;
                }
                this.slide = new Swiper(this.els, this.opt);
			}
        },
		mnPic:{  //  
            els: ".slideMnPic .swiper-container:not(.swiper-container-horizontal)",
            opt: {
				slidesPerView: 1,
				observer: true,
				observeParents: true,
				watchOverflow:true,
				pagination: {
					type:'fraction',
					el: '.pagination'
				},
                autoHeight:true,
				autoplay:false,
				preloadImages: true,
				lazy: true,
				loop: true
            },
			slide:[],
            using: function() {
				$(this.els).each(function(i){
					if (  $(this).find(".swiper-slide").length  >= 2  ) {
                        var _this = $(this);
						ui.slides.lookPic.slide[i] = new Swiper( _this , ui.slides.lookPic.opt );
						// console.log(ui.slides.lookPic.slide[i]);
                    } 
				});
			}
        },
		lookPic:{  // 
            els: ".slideLookPic .swiper-container:not(.swiper-container-horizontal)",
            opt: {
				slidesPerView: 1,
				observer: true,
				observeParents: true,
				watchOverflow:true,
				pagination: {
					type:'fraction',
					el: '.pagination'
				},
                autoHeight:true,
				autoplay:false,
				preloadImages: true,
				lazy: true,
				loop: true
            },
			slide:[],
            using: function() {
				$(this.els).each(function(i){
					if (  $(this).find(".swiper-slide").length  >= 2  ) {
                        var _this = $(this);
						ui.slides.lookPic.slide[i] = new Swiper( _this , ui.slides.lookPic.opt );
						// console.log(ui.slides.lookPic.slide[i]);
                    } 
				});
			}
        },
		sample1:{  //  샘플1
            els: ".slideSample1 .swiper-container",
            opt: {
				slidesPerView: 1,
				observer: true,
				observeParents: true,
				watchOverflow:true,
				pagination: {
					el: '.pagination',
					clickable: true
				},
				navigation: {
					nextEl: '.navigation .nav.next',
					prevEl: '.navigation .nav.prev'
				},
                autoHeight:true,
				autoplay:false,
				preloadImages: false,
				loop: true
            },
            using: function() {
                if ( $(this.els).find(".swiper-slide").length <= 1 ) {
                    this.opt.loop = false;
                }
                this.slide = new Swiper(this.els, this.opt);
			}
        },
        sample2:{ // 샘플2
            els: ".slideSample2 .swiper-container",
            opt: {
                slidesPerView: 2.2,
                freeMode: true,
                observer: true,
                observeParents: true,
                spaceBetween:2,
                watchOverflow:true,
                loop: false
            },
            using: function() {
                if ( $(this.els).find(".swiper-slide").length <= 1 ) {
                    this.opt.loop = false;
                }
                this.slide = new Swiper(this.els, this.opt);
            }
        }
	},
	alert:function(params){ // 커스텀 알럿
		if ( typeof params == "string") { var txt  = params }
		var opt = $.extend({
			msg:"<p>"+txt+"</p>",
			ycb:"",
			ybt:"확인"
		}, params);

		if( !$(".popAlert").length ){

			var lyAlert =
			'<article class="popAlert" tabindex="0">'+
				'<div class="pbd">'+
					'<div class="pct">'+opt.msg+'</div>'+
					'<div class="pbt">'+						
						'<button type="button" class="btn type sm a btnConfirm">'+ opt.ybt +'</button>'+
					'</div>'+
					// '<button type="button" class="btnClose">닫기</button>'+
				'</div>'+
			'</article>';

			$("body").append(lyAlert);
			ui.lock.using(true);


			$(".popAlert").find(".btnConfirm").on("click",function(){
				window.setTimeout(opt.ycb);
			});
			$(".popAlert").find(".btnClose , .btnConfirm").on("click",alertClose);

		}

		function alertClose(){
			$(".popAlert").remove();
			if( $(".popLayer:visible").length < 1 ){
				ui.lock.using(false);
			}
		}
	},
	confirm:function(params){ // 커스텀 컨펌

		var opt = $.extend({
			msg:"<p>컴펌메시지</p>",
			ycb:"",
			ybt:"확인",
			ncb:"",
			nbt:"취소"
		}, params);

		if( !$(".popConfirm").length ){

			var lyConfirm =
			'<article class="popConfirm" tabindex="0">'+
				'<div class="pbd">'+
					'<div class="pct">'+opt.msg+'</div>'+
					'<div class="pbt">'+						
						'<button type="button" class="btn type sm f btnCancel">'+ opt.nbt +'</button>'+
						'<button type="button" class="btn type sm a btnConfirm">'+ opt.ybt +'</button>'+
					'</div>'+
					// '<button type="button" class="btnClose">닫기</button>'+
				'</div>'+
			'</article>';
			$("body").append(lyConfirm);
			ui.lock.using(true);
			$(".popConfirm:visible").focus();
			$(".popConfirm").find(".btnConfirm").on("click",function(){
				window.setTimeout(opt.ycb);
			});

			$(".popConfirm").find(".btnCancel").on("click",function(){
				window.setTimeout(opt.ncb);
			});

			$(".popConfirm").find(".btnConfirm, .btnClose , .btnCancel").on("click",confirmClose);
		}

		function confirmClose(){
			$(".popConfirm").remove();
			if( $(".popLayer:visible").length < 1 ){
				ui.lock.using(false);
			}
		}
	},
	toast: function(params) { // 토스트창 ui.toast();

		var opt = $.extend({
			msg:"토스트메시지",
			cls:"",
			sec:1500,
			bot:20,
		}, params);

		var toastStat = false ;
		if ( !$(".popToast:visible").length && toastStat == false ) {

			var lyToast =
				'<article class="popToast ' + opt.cls + '">' +
					'<div class="pbd">' +
						'<div class="pct">' + opt.msg + '</div>' +
					'</div>' +
				'</article>';

			$("body").append(lyToast);

			window.setTimeout(function() {
				$(".popToast").addClass("on").css({"padding-bottom" : opt.bot});
			},100);

			this.times = window.setTimeout(function() {
				$(".popToast").removeClass("on").on("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){
					// console.log("fsd");
					$(".popToast").remove();
					// toastStat = true ;
				});
				// $(".popToast").fadeOut(400, function() {
					
				// });
			}, opt.sec);
		}
	},
	popLayer: { // 레이어팝업
		init: function() {

			$(document).on("click", ".popLayer:not(.win) .btnPopClose", function() {
				var id = $(this).closest(".popLayer").attr("id");
				// console.log(id);
				ui.popLayer.close(id);
			});

			$(document).on("click", ".popLayer", function(e) {
				$(this).find(".btnPopClose").trigger("click");
			});

			$(document).on("click", ".popLayer>.pbd", function(e) {
				e.stopPropagation();
			});

			if( $(".popLayer.win").length ) {
				var id = $(".popLayer.win").attr("id");
				ui.popLayer.open(id);
			}
			$(window).on("load resize",this.resize);
		},
		callbacks:{},
		open: function(id,params) {
			// console.log(id,params);
			_this = this;

			if (params) {
				var opt = $.extend({
					ocb: null ,
					ccb: null
				}, params);

				_this.callbacks[id] = {} ;
				_this.callbacks[id].open = opt.ocb  ;
				_this.callbacks[id].close = opt.ccb  ;
			}
			

			if( $("#" + id).length ) {
				ui.lock.using(true);
				$("#" + id).attr("tabindex","0").fadeIn(0,function(){
					if (_this.callbacks[id])  _this.callbacks[id].open();
				}).focus();
				this.resize(id);
				this.lyScroll(id);

				$(document).on("click focusin",  "#"+id+">.pbd input:not(input:radio, input:checkbox) , #"+id+">.pbd textarea"  , function(e) {
					var $this = $(this);
					window.setTimeout(function(){
						var myTop = $this.position().top - 50 ;
						var myMax =  Math.abs( ui.popLayer.scroll[id].maxScrollY );
						console.log(myTop , myMax);
						if ( myTop >= myMax ) {
							myTop = myMax ;
						}					
						ui.popLayer.scroll[id].scrollTo(0,-myTop);

					},600);

				});

			}

		},
		close: function(id) {
			_this = this;
			$("#"+id).fadeOut(0,function(){
				if( $(".popLayer:visible").length < 1 ){
					ui.lock.using(false);
				}
				if (_this.callbacks[id]) _this.callbacks[id].close();
			});
		},
		resize:function(id){
			var pctnH =  $(".popLayer:visible").outerHeight() ;
			if ( $(".popLayer:visible>.pbd>.phd").length ){
				pctnH = pctnH - $(".popLayer:visible>.pbd>.phd").outerHeight()
			}
			if ( $(".popLayer:visible>.pbd>.pbt").length ){
				pctnH = pctnH - $(".popLayer:visible>.pbd>.pbt").outerHeight()
			}
			$(".popLayer.a:visible>.pbd>.pct").css({"height": pctnH });
			$(".popLayer.b:visible>.pbd>.pct").css({"max-height": pctnH -70 });
		},
		scroll:{},
		lyScroll: function(id) {
			
			if ( ui.isUA("Mac OS") ){
				bounce = true;
			}else{
				bounce = true;
			}

			if( this.scroll[id] == undefined ) {
				this.scroll[id] = new IScroll('#'+id+'>.pbd>.pct', {
					// click:true,
					mouseWheel: true,
					probeType: 3,
					preventDefaultException: {tagName:/.*/},
					bounce:bounce,
					// bounceTime: 600,
					// scrollbars: true,
					// interactiveScrollbars: true,
					// shrinkScrollbars: 'scale',
					//fadeScrollbars: true
				});
				//  ui.popLayer.scroll.popLayerSample1.scrollTo(0, ui.popLayer.scroll.popLayerSample1.maxScrollY, 400);
				this.scroll[id].on('scrollEnd', function () {
					if( this.maxScrollY == this.y ){						
						// console.log("끝",this.maxScrollY , this.y);
						// $('#'+id+'>.pbd>.pct .poptents').append('<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>')
						// ui.popLayer.refresh(id);
					}
				});
			}
		},
		refresh:function(id){
			// $(window).trigger("resize");
			ui.popLayer.scroll[id].refresh();
		}
	},
	listMore: { // 더 불러오기 
		active: false,
		init: function(paramCallback) {
			this.active = true;
			this.moreCallback = paramCallback;
			this.using();
			this.loading = $(".uiLoadMore");
			this.moreCallback();
		},
		using: function() {
			// 페이지 하단 도착
			$(window).on("scroll load", function() {
				var sct = Math.ceil( $(window).scrollTop() + $(window).outerHeight() + $(".uiLoadMore:visible").outerHeight() + 30 );
				var cnt = $(document).outerHeight() ;
				// console.log(cnt,sct);
				$("#debug").html(cnt +"/"+ sct  );
				if (cnt <= sct ) {
					$("#debug").html(cnt +"/"+ sct +"/ 바닥" );
					ui.listMore.moreCallback();
				}
			});
		},
		removeEvent: function() {
			// $(window).off("scroll");
			this.loading.hide();
		}
	},
	listLoad: { // 더 불러오기 
		init: function() {
			this.loading = $(".uiLoadMore");
		},
		attach: function() {
			this.loading.removeClass("error");
			this.loading.addClass("active");
		},
		detach: function() {
			this.loading.removeClass("active");
		},
		error: function() {
			this.loading.addClass("error");
			$(window).off("scroll");
			this.detach();
			ui.listMore.active = true;
		}
	},
	cookie:{ // 쿠키 설정
		set:function(cname, cvalue, exdays){
			var d = new Date();
			d.setTime( d.getTime() + (exdays * 60 * 60 * 1000) );
			var expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/html";
		},
		get:function(cname){
			var name = cname + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var ca = decodedCookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}
	}
};

ui.init();
