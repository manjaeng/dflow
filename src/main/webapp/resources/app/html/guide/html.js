var uiHtml = {
	init: function () {
		this.menu.init();
		var tit = window.location.pathname.split("/");
		var look_stat = "/" + tit[tit.length - 2] + "/" + tit[tit.length - 1];
		// console.log( tit , tit.length);
		document.title = "/" + tit[tit.length - 2] + "/" + tit[tit.length - 1];

		var imgs = 
		".uiMnSet .slide .pic img , "+
		".uiLkSet .slide .pic img, "+
		".secMn.hash .hashList>li .item .img img , "+
		".secMn.match .matchList>li .item .img img  " ;

		// $(imgs).each(function(index){
		// 	var r = parseInt( Math.random() * 6  ) + 1;
		// 	$(this).attr("src","../../images/_temp/look_img_"+r+".jpg");
		// });


		$(window).on("load scroll",function(){
			var winH = $(window).height();
			var docH = $(document).height();
			var scrT = $(window).scrollTop();
			var pct =  scrT / ( docH - winH ) * 100 ;
			// console.log( winH , docH , scrT ,  pct );
			$("#barH").css({"width":pct+"%"});
		});
		
		$(document).on("click",".uiLkSet>.data ul.dl>li .bt",function(e){
			if( $(this).hasClass("on") ){
				$(this).removeClass("on");
			}else{
				$(this).addClass("on");
			}
		});

		if ( look_stat == "/look/look.jsp") {
			// console.log(look_stat);
			// $(".menubar .menu>li.look").addClass("on");
			$(".menubar .menu>li.look>a").on("click", function(){
				if( $(this).closest("li").hasClass("on") ){
					$(this).closest("li").removeClass("on");
				}else{
					$(this).closest("li").addClass("on");
				}
				return false;
			});
		}


		var prof_link = 
			".contain.follow .sec.follow .tabCtn .list>li .item .img>.lk , "+
			".contain.alim .tabCtn .list>li .box .pic , "+
			".contain.alim .tabCtn .list>li .box .msgs .text a " ;
		$(document).on("click", prof_link ,function(e){
			window.location.href = "../../html/mypage/profile.jsp";
		});

		try {
			if ( ui.param.my && ui.param.my == "true") {
				$(".contain.prf .prfNav .bts").addClass("my");
			}
			if ( ui.param.mdl && ui.param.mdl == "true") {
				$(".contain.prf .prfNav .bts").addClass("mdl");
			}
		} catch (error) { }			

		$(document).on("click", ".secLk.look .welcome , div.nodata " ,function(e){
			$(this).remove();
		});

	},
	param:(function(a) { // URL에서 파라미터 읽어오기
		if (a == "") return {};
		var b = {};
		for (var i = 0; i < a.length; i++){
			var p=a[i].split('=');
			if (p.length != 2) continue;
			b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
		}
		return b;
	})(window.location.search.substr(1).split('&')),
	menu: {
		init: function () {
			this.addEvent();
		},
		addEvent: function () {
			var _this = this;
			var keyM = this.togMenu;
			var keyF2 = this.togUrl;
			var keyF7 = this.togMobile;
			var keyF4 = this.togDev;
			var keyBack = this.keyBack;
			var fStat = true;
			$(document).on({
				focus: function () {
					fStat = false;
					// console.log("f");
				},
				blur: function () {
					fStat = true;
					// console.log("t");
				}
			}, "textarea , input:not([type=radio],[type=checkbox])");

			$("body").append('<a class="btnLinkHtml" href="javascript:;">링크열기</a>')


			$(document).on("click", ".btnLinkHtml", this.togMenu);

			$(document).on("keydown mousedown", function (event) {
				if (fStat === true) {
					if (event.keyCode == 77 && $("body:not('.link')").length) { keyM();	} // M 키 이벤트
					if (event.keyCode == 113) { keyF2(); } //F2 키 이벤트
					if (event.keyCode == 118) { keyF7(); } //F7 키 이벤트
					if (event.keyCode == 115) { keyF4(); } //F4 키 이벤트
					if (event.keyCode == 8  ) { keyBack(); } //Back 키 이벤트
				}
			}).on("mousedown", function () {
				$(".tempLink").remove();
			});


			
			$(document).on("click", ".linkHtml .cont>ul>li>h3>a", function () {
				_this.linkSet(this);
			});
				

			if ( !window.localStorage.getItem("linkMenu") ) {
			}
				
			$(".linkHtml .cont>ul>li:not(.open)").addClass("open");

		},
		linkSet:function(my){
			var ckidObj = {};
			var els = $(my).closest("li");

			//var linkData = $.cookie("linkMenu");
			var linkData = window.localStorage.getItem("linkMenu");
			if (linkData) {
				ckidObj = JSON.parse(linkData);
			}
			var ckid = els.attr("id").replace("linkID", "");

			// ckidObj["linkID" + ckid] = true;

			if (els.hasClass("open")) {
				els.find("ul").slideUp(200,function(){
					els.removeClass("open");
				});
				JSON.parse(linkData);
				ckidObj["linkID" + ckid] = false;
				//console.log(ckidObj["linkID"+ckid])
			} else {
				els.find("ul").slideDown(200,function(){
					els.addClass("open");
				});
				ckidObj["linkID" + ckid] = true;
				//console.log(  "linkID"+ckid ,  ckidObj["linkID"+ckid]);
			}
			ckidObj = JSON.stringify(ckidObj);
			window.localStorage.setItem("linkMenu", ckidObj);			
		},
		linkStat: function () {
			$(".linkHtml .cont>ul>li:not(.open)").addClass("open");
			$(".linkHtml .cont>ul>li").each(function (i) {
				$(this).attr("id", "linkID" + i);
			});

			var linkData = window.localStorage.getItem("linkMenu");
			if (linkData) {
				var linkObj = JSON.parse(linkData); //console.log( linkObj );
				for (var key in linkObj) { //console.log( key );
					if (linkObj[key]) {
						$("#" + key).addClass("open").find(">ul").show();
					}else{
						$("#" + key).removeClass("open").find(">ul").hide();
					}
				}
			}
			var thisPg = window.location.pathname.replace("/resources/app/","../../");

			$(".linkHtml .cont ul ul>li").each(function () {
				var text = $(this).find("em").text();
				$(this).find("em").addClass(text);
				//if (text == "ing") {
				//$(this).wrapInner('<span></span>' );
				//}else{
				var link = $(this).find(">mark").text();
				if (link) {
					$(this).find(">mark").wrapInner('<a href="' + link + '"></a>');
					var lk = link.replace("../../", "./");
					$(this).find("mark>a").text(lk);
				} else {
					$(this).wrapInner('<a href="javascript:;"></a>');
				}
				//}
				$(this).find("em").wrapInner('<a href="' + link + '" target="_blank"></a>');

				if ( link == thisPg ) {
					$(this).closest("li").addClass("active");
					$(this).closest("li").closest("ul").show();
					$(this).closest("li").closest("ul").closest("li:not(.open)").find("h3 a").trigger("click");
				}

			});

			$(".linkHtml .cont").on("scroll",function(){
				linkScr = $(".linkHtml .cont").scrollTop();
				window.localStorage.setItem("linkScr", linkScr);
			});
			setTimeout(function(){
				
				var $active = $(".linkHtml .cont>ul>li>ul>li.active");
				if ( $active.length ) {
					var linkTxtTop = $active.offset().top - $(window).height()*0.5;
					$(".linkHtml .cont").scrollTop(linkTxtTop );
				}else{
					var linkScr = window.localStorage.getItem("linkScr");
					$(".linkHtml .cont").scrollTop(linkScr);
				}

			});

		},
		keyBack: function () {
			console.log("뒤로");
			// window.history.back();
		},
		togMenu: function () {
			if ($(".tempLink").length) {
				$(".tempLink").remove();
			} else {
				var list =
					'<article class="tempLink">' +
						'<div class="pan"></div>' +
					'</article>';
				$("body").append(list);

				$(".tempLink>.pan").load("../../html/guide/link.jsp .linkHtml", function () {
					uiHtml.menu.linkStat();
				});

				$(".tempLink , .btnLinkHtml").on("mousedown", function (e) {
					e.stopPropagation();
				});
			}

		},
		togUrl: function () { // F2 키


		},
		togMobile: function () { // F7 키


		},
		togDev: function () { // F4 키
			var tUrl = window.location.href;
			var tPort = window.location.port;
			var tHost = window.location.host;
			var tOrg = window.location.origin;
			var tIp = window.location.hostname;
			//console.log(tPort, tUrl);
			if(tPort == "8081"){
				location.href = tUrl.replace(tHost,"fapee.thenet-global.com:20080");
			}
			if(tOrg == "http://fapee.thenet-global.com:20080"){
				location.href = tUrl.replace(tOrg,"http://10.120.180.246:8081");
			}

		}
	}
};


uiHtml.init();

