////////////////////////////////////////
// Author : 김기현 Kim KeeHyum
// E-mail : kimkee@naver.com    
// Date   : 2019-06-12 ~
////////////////////////////////////////
var ui = {
	init:function(){ // 초기 구동
		this.cm.init();
		this.ly.init();
		this.look.init();
		this.form.init();
		this.accd.init();
		this.tab.init();
		this.popLayer.init();
		this.slides.init();
		this.datePick.init();
		this.listLoad.init();
		this.filter.init();
		this.dropDown.init();
		this.getSafe.init();
	},
	cm:{ // 공통
		init:function(){
			// $("select").selectmenu();
		}
	},
	isUA:function(t){ //  디바이스 구분
		t = t.split(" ");
		for (let i = 0; i < t.length; i++) {
			result = navigator.userAgent.indexOf(t[i]) > -1 ? true : false ;
			if (!result) {
				return result ;
			}
		}
		return result ;
	},
	getSafe:{ // 아이폰X 여백값
		init:function(){
			var _this = this;
			var computed, div = document.createElement('div');
			div.style.padding = 'env(safe-area-inset-top) env(safe-area-inset-right) env(safe-area-inset-bottom) env(safe-area-inset-left)';
			document.body.appendChild(div);
			computed = getComputedStyle(div);
			_this.top= parseInt(computed.paddingTop) || 0;
			_this.right= parseInt(computed.paddingRight) || 0;
			_this.bottom= parseInt(computed.paddingBottom) || 0;
			_this.left= parseInt(computed.paddingLeft) || 0;
			document.body.removeChild(div);
		}
	},
	filter: { // 필터 팝업
		init:function(){
			$("#filtMatchSlider").length && this.match();
			// popFilter();
			// popSize();
		},
		match:function(){
			var $slider = $("#filtMatchSlider");
			var handle = $slider.find(".range_amount");
			$slider.slider({
				// value: $slider.attr("data-amount") ,
				range: true,
				min: 0,
				max: 100,
				values: [ $slider.attr("data-amount-min")  , $slider.attr("data-amount-max") ],
				step: 1,
				create: function(event, ui) {
					handle.html(  $(this).slider( "values",0 ) + " - " + $(this).slider( "values",1 ) + "<i>%</i>" );
					// bar.css("width", $(this).slider( "value" ) + "%");
				}
			});

			$slider.on("slidechange slide", function( event, ui ) {
				// handle.text( ui.value + "%");
				handle.html(  ui.values[0] + " - " + ui.values[1] + "<i>%</i>" );
				// bar.css("width", $(this).slider( "value" ) + "%");
				$(this).attr("data-amount-min",ui.values[0] );
				$(this).attr("data-amount-max",ui.values[1] );
				// console.log(ui.value);
			} );
		}
	},
	size: { // 마이사이즈 팝업
		init:function(){
			this.height();
			this.fit();
			this.slide.using();
		},
		height:function(){
			var $slider = $("#sizeHeightSlider");
			var bar = $slider.find("em.bar");
			var handle = $slider.find(".range_amount");
			$slider.slider({
				value: $slider.attr("data-amount") ,
				min: 100,
				max: 200,
				step: 1,
				create: function(event, ui) {
					handle.html( $(this).slider( "value" ) + "<i>cm</i>");
					bar.css("width", $(this).slider( "value" ) / 200 * 100 + "%");
				}
			});

			$slider.on("slidechange slide", function( event, ui ) {
				handle.html( ui.value + "<i>cm</i>");
				bar.css("width", $(this).slider( "value" ) / 200 * 100 + "%");
				$(this).attr("data-amount",ui.value);
				// console.log(ui.value);
			} );

		},
		fit:function(){
			var $slider = $("#sizeFittSlider");
			var bar = $slider.find("em.bar");
			var handle = $slider.find(".range_amount");
			$slider.slider({
				value: $slider.attr("data-amount") ,
				min: 0,
				max: 100,
				step: 1,
				create: function(event, ui) {
					handle.text( $(this).slider( "value" ) + "%");
					bar.css("width", $(this).slider( "value" ) + "%");
				}
			});

			$slider.on("slidechange slide", function( event, ui ) {
				handle.text( ui.value + "%");
				bar.css("width", $(this).slider( "value" ) + "%");
				$(this).attr("data-amount",ui.value);
				// console.log(ui.value);
			} );

		},
		slide:{  //  
            els: ".slideSize.swiper-container",
            opt: {
                slidesPerView: 'auto',
                freeMode: true,
				// centeredSlides: true,
                observer: true,
                observeParents: true,
                // spaceBetween:20,
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
	refresh:{ // PULL Refresh 
		init:function(callback){
			if( typeof callback == "function" ){
				this.pullCallback = callback;	
			}else{
				this.pullCallback = function(){};
			}
			$("#contain").length && this.using();
			$("#contain").prepend( this.icon );
		},
		icon:
			'<div class="pull-to-refresh-material2__control">' +
				'<svg class="pull-to-refresh-material2__icon" fill="#666666" width="30" height="30" viewBox="0 0 24 24">' +
					'<path d="M17.65 6.35C16.2 4.9 14.21 4 12 4c-4.42 0-7.99 3.58-7.99 8s3.57 8 7.99 8c3.73 0 6.84-2.55 7.73-6h-2.08c-.82 2.33-3.04 4-5.65 4-3.31 0-6-2.69-6-6s2.69-6 6-6c1.66 0 3.14.69 4.22 1.78L13 11h7V4l-2.35 2.35z" />'+
					'<path d="M0 0h24v24H0z" fill="none" />'+
				'</svg>'+
				'<svg class="pull-to-refresh-material2__spinner" width="24" height="24" viewBox="25 25 50 50">'+
					'<circle class="pull-to-refresh-material2__path" cx="50" cy="50" r="20" fill="none" stroke="#666666" stroke-width="4" stroke-miterlimit="10" />'+
				'</svg>'+
			'</div>'
		,
		using:function(){
			var _this = this;
			pullToRefresh({
				container: document.querySelector('#contain'),
				animates: ptrAnimatesMaterial2,
				refresh() {
					return new Promise(resolve => {
						setTimeout(resolve, 1500)
						setTimeout(function(){
							_this.pullCallback();
						}, 1500)
						
					})
				}
			})
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

							clearTimeout(scrStopEvent);
							scrStopEvent = window.setTimeout(function(){
								ui.ly.botNav.show();
								clearTimeout(scrStopEvent);
							},800);
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
						// console.log("바닥");						
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
				if ( ui.isUA("NAVER") || ui.isUA("DaumApps")) {
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
	look:{ // 룩
		init:function(){
			this.match();
			this.elip.init();
			this.tag.init();
		},
		match:function(){
			$(document).on("click",".uiLkSet>.match .box.mat .bt:not(.disabled)",function(){
				var pct = $(this).attr("data-match");
				$(this).addClass("disabled");
				$(this).find(".bar").css({ "width" : "0%" });
				$(this).find(".bar").animate({
					width : pct+"%",
				},1000,"easeOutCubic",function(){ // "easeOutBounce"
					// console.log("dfdsfdsfsd",this);
					$(this).closest(".bt").removeClass("disabled");
				});
				console.log(pct);
				$(this).find(".amt").text(pct+"%");
				$(this).find(".txt").text("MATCH");
			});
		},
		elip:{ // 더보기 열기 ... 처리
			init:function(){
				$(document).on("click",".uiLkSet>.info .desc a.more",function(e){
					$(this).closest(".desc").removeClass("elips");
				});
				this.using();
			},
			using:function(){
				$(".contain.list .uiLkSet>.info .desc a.txt").each(function(){
					if( $(this).height() > 40 ){
						$(this).closest(".desc").addClass("elips");
					}else{
						$(this).closest(".desc").removeClass("elips");
					}
				});
			}
		},
		tag:{
			init:function(){
				$(document).on("click",".uiPhoto .btsTag .bt.tag",function(e){
					console.log("564456");
					var thisPhoto = $(this).closest(".uiPhoto");
					if( thisPhoto.hasClass("active") ) {
						thisPhoto.removeClass("active");
					}else{
						thisPhoto.addClass("active");
					}
				});
			},
			using:function(){

			}
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
		show: function (params) {
			// console.log(params  , typeof params == "string");
			if ( typeof params == "string" ) { var txt =  params } else { var txt = '' }
			var opt = $.extend({
				msg:txt,
			}, params);

			var els = '<div class="loadingBar"><div class="in"><span class="msg">'+opt.msg+'</span><em></em></div></div>';
			$("body").prepend(els);
		},
		hide: function () {
			$(".loadingBar").remove();
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
	tab:{ // 탭형식컨텐츠
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
				// $("html").css({"top":""+(-ui.lock.sct)+"px"});
				$("body , html").addClass("lock");
				$(lockDiv).bind("touchmove scroll", function(e){ e.preventDefault() });
			}
			if(opt === false){
				this.stat = false;
				// $("html").css({"top":""});
				// $(window).scrollTop( ui.lock.sct );
				$("body , html").removeClass("lock");
				$(lockDiv).unbind("touchmove scroll");
			}
		}
	},
    slides:{ // 스와이프 객체 생성 
        init:function(){
        	$(this.sample1.els +" ul.slide" ).length && this.sample1.using();
        	$(this.sample2.els +" ul.slide" ).length && this.sample2.using();
        	$(this.intPic.els +" ul.slide" ).length && this.intPic.using();
        	$(this.lookPic.els +" ul.slide" ).length && this.lookPic.using();
        	$(this.mnPic.els +" ul.slide" ).length && this.mnPic.using();
        	$(this.newBie.els +" ul.slide" ).length && this.newBie.using();
        	$(this.newUp.els +" ul.slide" ).length && this.newUp.using();
        },
		intPic:{  //  
            els: "#slideUploadPic.swiper-container",
            opt: {
                slidesPerView: 'auto',
                freeMode: true,
				centeredSlides: true,
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
					// type:'fraction',
					el: '.pagination',
					dynamicBullets:true,
					//dynamicMainBullets:1
				},
                autoHeight:true,
				autoplay:false,
				preloadImages: true,
				zoom: true,
				lazy: true,
				loop: true
            },
			slide:[],
            using: function() {
				var _this = this;
				$(this.els).each(function(i){
                	var $this = $(this);
					var idx = $this.closest("li").index();
					if( $this.find(".swiper-slide").length == 1 ) _this.opt.loop = false ;
					if( $this.find(".swiper-slide").length >= 1 ) {
						_this.slide[idx] = new Swiper( $this , _this.opt );
						// console.log(_this.slide[i]);
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
					// type:'fraction',
					el: '.pagination',
					dynamicBullets:true,
					//dynamicMainBullets:1
				},
                autoHeight:true,
				autoplay:false,
				preloadImages: true,
				// zoom: true,
				lazy: true,
				loop: false
            },
			slide:[],
            using: function() {
				var _this = this;
				$(this.els).each(function(i){
                	var $this = $(this);
					var idx = $this.closest("li").index();
					if( $this.find(".swiper-slide").length == 1 ) _this.opt.loop = false ;
					if( $this.find(".swiper-slide").length >= 1 ) {
						_this.slide[idx] = new Swiper( $this , _this.opt );
						// console.log(_this.slide[i]);
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
                if( $(this.els).find(".swiper-slide").length <= 1 ) {
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

		if( $(".popAlert").length ) return ;

		var lyAlert =
		'<article class="popAlert" tabindex="0">'+
			'<div class="pbd">'+
				'<div class="phd">알림</div>'+
				'<div class="pct">'+opt.msg+'</div>'+
				'<div class="pbt">'+						
					'<button type="button" class="btn lg a btnConfirm">'+ opt.ybt +'</button>'+
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

		if( $(".popConfirm").length ) return ;

		var lyConfirm =
		'<article class="popConfirm" tabindex="0">'+
			'<div class="pbd">'+
				'<div class="pct">'+opt.msg+'</div>'+
				'<div class="pbt">'+						
					'<button type="button" class="btn lg f btnCancel">'+ opt.nbt +'</button>'+
					'<button type="button" class="btn lg a btnConfirm">'+ opt.ybt +'</button>'+
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
		

		function confirmClose(){
			$(".popConfirm").remove();
			if( $(".popLayer:visible").length < 1 ){
				ui.lock.using(false);
			}
		}
	},
	toast: function(params) { // 토스트창 

		var opt = $.extend({
			msg:"토스트메시지",
			cls:"",
			sec:1500,
			bot:0,
		}, params);

		if ( $(".popToast:visible").length ) return ;

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
			});
		}, opt.sec);


	},
	popLayer: { // 레이어팝업
		init: function() {
			var _this = this;
			$(document).on("click", ".popLayer:not(.win) .btnPopClose", function() {
				var id = $(this).closest(".popLayer").attr("id");
				// console.log(id);
				if (_this.opt.hash) {
					window.history.back();
				}else{
					_this.close(id);
				}
			});

			$(document).on("click", ".popLayer", function(e) {
				$(this).find(".btnPopClose").trigger("click");
			});

			$(document).on("click", ".popLayer>.pbd", function(e) {
				e.stopPropagation();
			});

			if( $(".popLayer.win").length ) {
				var id = $(".popLayer.win").attr("id");
				_this.open(id);
			}
			$(window).on("load resize",this.resize);
			$(window).on("hashchange",function(){
				// _this.history(true);
			});
			window.onpopstate = history.onpushstate = function(e) {
				_this.history(true);
			}

		},
		history:function(){
			var _this = this;
			var h_prev = _this.openPop ; 
			_this.openPop = location.hash.replace("#pop=","").split(",");
			if ( _this.openPop == "" ) { _this.openPop = []	}
			var h_now = _this.openPop ;		
			// console.log( h_prev , h_now );
			if( h_prev > h_now ){
				result = h_prev.filter(function (a) {
 					return h_now.indexOf(a) === -1;
				});
				// console.log("뒤로옴" , result[0] ,h_prev , h_now  );
				_this.close(result[0],true);
			}else{
				// console.log("앞으로");
			}
		},
		openPop:[],
		callbacks:{},
		open: function(id,params) {
			// console.log(id,params);
			_this = this;

			if ( $("#" + id).length  <= 0  ) return ;   // id 호출팝업이 없으면 리턴

			_this.opt = $.extend({
				ocb: null ,
				ccb: null,
				zIndex: 1000,
				hash: false, // true  //  뒤로가기 버튼으로 팝업닫기 옵션
			}, params); 

			_this.callbacks[id] = {} ;
			_this.callbacks[id].open  = _this.opt.ocb ? _this.opt.ocb : null ;
			_this.callbacks[id].close = _this.opt.ccb ? _this.opt.ccb : null ;		

			if (_this.opt.hash) {

				if ( $(".popLayer:visible").length <= 0 &&  location.href.split("#")[1] != undefined && location.href.split("#pop=")[1] != undefined ) {  //
					_this.openPop = [];
					window.history.pushState({}, 'pop', '#' );
				}

				_this.openPop.push(id);
				window.history.pushState({}, 'pop', '#pop='+_this.openPop );
			}

			ui.lock.using(true);

			$("#" + id).css({ zIndex: _this.opt.zindex });
			$("#" + id).fadeIn(100,function(){
				if(_this.callbacks[id].open)  _this.callbacks[id].open();			
				$(this).addClass("on");

			}).attr("tabindex","0").focus();
			
			window.setTimeout(function(){
				_this.resize(id);
				_this.lyScroll(id);
			});

			$(document).on("click focusin", "#"+id+">.pbd input:not(input:radio, input:checkbox) , #"+id+">.pbd textarea"  , function(e) {
				var els = $(this);
				window.setTimeout(function(){
					var myTop = els.position().top - $(".popLayer .phd").outerHeight() ;
					var myMax = Math.abs( _this.scroll[id].maxScrollY );
					// console.log(myTop , myMax , _this.scroll[id].y);
					if ( myTop >= myMax ) { myTop = myMax ; }
					_this.scroll[id].scrollTo(0,-myTop);
				},600);
			});



		},
		close: function(id,set) {
			_this = this;

			// console.log(_this.opt.hash , set);	
			if( _this.opt.hash && set != true && $("#"+id+":visible").length  ) {  // 해쉬 
				window.history.back();
			}

			$("#"+id).removeClass("on").fadeOut(150,function(){
				if( !$(".popLayer:visible").length ) ui.lock.using(false);
				try { _this.callbacks[id].close(); } catch (error) { }
			});
		},
		resize:function(id){
			var pctnH =  $(".popLayer:visible").outerHeight() ;		
			pctnH = pctnH - ( $(".popLayer:visible>.pbd>.phd").outerHeight() || 0 ) - (  $(".popLayer:visible>.pbd>.pbt").outerHeight() || 0 );
			
			$(".popLayer.a:visible>.pbd>.pct").css({"height": pctnH });
			$(".popLayer.b:visible>.pbd>.pct").css({"max-height": pctnH - 70 });
			$(".popLayer.c:visible>.pbd>.pct").css({"max-height": pctnH - 30 });
		},
		scroll:{},
		lyScroll: function(id) {
			
			bounce = ui.isUA("Mac OS") ?  true : false;

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
	dropDown:{	// 드롭다운 메뉴
		init:function(){
			$(".uiDropDown").length && this.using();
			$(".uiDropDown").length && this.update();
		},
		set:function(id,val){ // ui.dropDown.set("아이디","value값");
			$("#"+id).find("li button[value='"+val+"']").closest("li").addClass("active").siblings("li").removeClass().attr("title","");
			this.update();
		},
		update:function(id){
			var $uiDropDown = $(".uiDropDown:not([data-ui*='link'])");

			$uiDropDown.each(function(i){
				

				var actEl = $(this).find(".list>ul>li:first-child").html();
				if( $(this).find(".list>ul>li").hasClass("active") ){
					actEl = $(this).find(".list>ul>li.active").html();
					$(this).find(".list>ul>li.active").siblings("li").attr("title","");
				}

				ui.dropDown.size(this);
				
				if($(this).find(".list li").hasClass("active")){
					// $(this).find(".list li.active a");
					//var actVal = $(this).find(".list li .active").index()+1;
					$(this).find(">button").text(  $(this).find(".list li.active button").text()  );
					$(this).find(">button").attr("value", $(this).find(".list li.active button").attr("value")   );
					$(this).attr("value", $(this).find(".list li.active button").attr("value")   );
				}

				if( !$(this).find(">button").length  ){
					$(this).prepend( actEl ).find(">button").wrapInner("<b></b>");
				}
				if( !$(this).find("button b").length ){
					$(this).find("button").wrapInner("<b></b>");
				}
				$(this).find(">button").addClass("bt").attr("title","메뉴열기").attr("onclick","");
				
			});

			$(".uiDropDown").each(function(){
				var actEl = $(this).find(".list>ul>li:first-child").html();

				ui.dropDown.size(this);

				if( !$(this).find(">a").length  &&  $(this).is("[data-ui='link-sel']")  ){
					
					$(this).prepend( actEl );
					$(this).find(">a").addClass("bt").attr("href","javascript:;").attr("title","메뉴열기");
					
				}


				if( $(this).find(".list li").hasClass("active") ){
					$(this).find(".list li.active").attr("title","현재선택항목");
					$(this).find(">a").text(  $(this).find(".list li.active a").text()  );
				}
			

			});

		},
		show:function(els){
			// console.log($(els));
			//console.log( $(els).next(".list").is(":visible") );
			var elsTop = $(els).closest(".uiDropDown").offset().top - $(window).scrollTop();
			var winH = $(window).height()/2 ;
			// console.log(  elsTop,winH );
			$(".uiDropDown").removeClass("up");
			if( winH < elsTop ){
				// console.log("up");
				$(els).closest(".uiDropDown").addClass("up");
			}

			if( $(els).next(".list").is(":visible") ){
				$(els).next(".list:visible").hide();
				$(els).removeClass("on");
				$(els).parent(".uiDropDown").removeClass("on");
			}else{
				$(els).next(".list").show();
				$(els).addClass("on");
				$(els).parent(".uiDropDown").addClass("on");
			}		
		},
		hide:function(){
			$(".uiDropDown .list").hide();
			$(".uiDropDown").removeClass("on");
			$(".uiDropDown .bt").removeClass("on");
		},
		sel:function(els){
			$(els).closest(".uiDropDown").find(".bt")
				.text( $(els).text() )
				.attr("value", $(els).attr("value") )
				.wrapInner("<b></b>")
				.focus();
			$(els).closest(".uiDropDown").attr("value", $(els).attr("value") );
			$(els).closest(".list").hide();
			$(els).closest("li").addClass("active").siblings('li').removeClass("active");
			$(els).closest(".list").find("button");
			$(els).closest("li");
		},
		using:function(){
			
			$(document).on("click",".uiDropDown:not('.disabled') .bt",function(e){
				ui.dropDown.show(this);
				e.stopPropagation();
			});

			$(document).on("click",".uiDropDown .list li button",function(){
				ui.dropDown.sel(this);
			});

			$(document).on("click",".uiDropDown[data-ui*='link'] .list li a",function(e){
				ui.dropDown.hide(this);
			});

			$(document).on("click",function(e){
				ui.dropDown.hide(this);
			});
			$(document).on("click",".uiDropDown",function(e){
				e.stopPropagation();
			});

			$("*").not(".uiDropDown .list button , .uiDropDown .list a , .uiDropDown .list").on("focus",function(){
				ui.dropDown.hide(this);
			});

			$(document).on("focus",".uiDropDown .bt",function(){
				ui.dropDown.hide(this);
			});

			

		},
		size:function(els){

			$(els).css("width","");
			$(els).find(".list").css("width","");

			if( !$(els).hasClass("noWidth") ){

				var aWid = $(els).find(">.bt").outerWidth()+5;
				var lsWid = $(els).find(".list").outerWidth()+5;
				// console.log(aWid,lsWid);

				if( aWid < lsWid){
					$(els).find(".list").css("width",lsWid);
					$(els).css("min-width", lsWid); 
				}else{
					$(els).css("min-width", aWid); 
					$(els).find(".list").css("width",aWid );
				}
			}

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
