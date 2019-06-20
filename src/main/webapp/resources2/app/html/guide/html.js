﻿var uiHtml = {
	init: function () {
		this.menu.init();
		var tit = window.location.pathname.split("/");
		// console.log( tit , tit.length);
		document.title = "/" + tit[tit.length - 2] + "/" + tit[tit.length - 1];
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

			var ckidObj = {};
			$(document).on("click", ".linkHtml .cont>ul>li>h3>a", function () {
				var els = $(this).closest("li");

				//var linkData = $.cookie("linkMenu");
				var linkData = window.localStorage.getItem("linkMenu");
				if (linkData) {
					ckidObj = JSON.parse(linkData);
				}
				var ckid = els.attr("id").replace("linkID", "");

				ckidObj["linkID" + ckid] = true;

				if (els.hasClass("open")) {
					els.removeClass("open");
					els.find("ul").slideUp(200);
					//$.cookie(ckid,null,{path:'/'}); 
					JSON.parse(linkData);
					ckidObj["linkID" + ckid] = false;
					//console.log(ckidObj["linkID"+ckid])
				} else {
					els.addClass("open");
					els.find("ul").slideDown(200);
					//console.log(  "linkID"+ckid ,  ckidObj["linkID"+ckid]);
				}
				// $.cookie("linkMenu", ckidObj , { expires:1000, path:"/" });
				ckidObj = JSON.stringify(ckidObj);
				window.localStorage.setItem("linkMenu", ckidObj);
			});

		},
		linkStat: function () {

			$(".linkHtml .cont>ul>li").each(function (i) {
				$(this).attr("id", "linkID" + i);
			});

			var linkData = window.localStorage.getItem("linkMenu");
			if (linkData) {
				var linkObj = JSON.parse(linkData); //console.log( linkObj );
				for (var key in linkObj) { //console.log( key );
					if (linkObj[key]) {
						$("#" + key).addClass("open").find(">ul").show();
					}
				}
			}
			var thisPg = window.location.pathname;

			$(".linkHtml .cont ul ul>li").each(function () {
				var text = $(this).find("em").text();
				$(this).find("em").addClass(text);
				//if (text == "ing") {
				//$(this).wrapInner('<span></span>' );
				//}else{
				var link = $(this).find(">mark").text();
				if (link) {
					$(this).find(">mark").wrapInner('<a href="' + link + '"></a>');
					var lk = link.replace("/resources/app/", "./");
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
			window.history.back();
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

				$(".tempLink>.pan").load("/resources/app/html/guide/link.jsp .linkHtml", function () {
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


		}
	}
};


uiHtml.init();
