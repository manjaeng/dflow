/*
 * 19.06.11
 * IIFE + Closure + jQuery를 활용한 테이블 리스트 불러오기 기능
​ */
!function($) {

	var info = {
		curId : '',
		server_url : '',
		curPage : 0,
		page_size : 10,
		loading_status : false,
		has_more_records : true
	};

	var authTokenQueryString = ' ';

	$.fn.jqList = function(obj) {

		var req_url;

		if ('object' !== typeof obj) {
			alert('required parameter is empty');
			return;
		} else if (this.attr('id') === 'undefined') {
			alert('undefined selector');
			return;
		} else if (!this.is('table')) {
			alert('selector is not table');
			return;
		}

		if (obj.method === 'init') {

			info.curId = this.attr('id');
			info.server_url = obj.url;
			info.curPage = 0;
			info.loading_status = false;
			info.has_more_records = true;

			req_url = info.server_url + '/' + info.curPage;

			getList(req_url);

		} else if (obj.method === 'more') {

			if (info.curId !== this.attr('id')) {
				alert('init first');
				return;
			}

			if (!info.has_more_records) {

				if ('function' === typeof obj.empty) {
					obj.empty();
				}

				return;

			} else if (!info.loading_status) {

				info.curPage  = info.curPage + info.page_size;

				req_url = info.server_url + '/' + info.curPage;

				getList(req_url);

			} else {
				alert('loading...');
			}

		} else {
			alert('undefined method');
		}

		function getList(url) {

			info.loading_status = true

			$.ajax({
				url : url + authTokenQueryString,
				type : 'post',
				dataType : 'json',
				success : function(jsonArr) {

					if (jsonArr.length < info.page_size) {
						info.has_more_records = false;
					}

					if (jsonArr.length === 0) {
						if ('function' === typeof obj.empty) {
							obj.empty();
						}
					} else {
						appendList(jsonArr);
					}

					info.loading_status = false;

				},
				error : function(e) {
					alert('error! - getList()');
					info.loading_status = false;
				}
			});
		}

		function appendList(jsonArr) {

			var $tbl = $('#' + info.curId);
			var html = '';

			$.each(jsonArr, function(i, e) {
				html += '<tr>'
				$.each(e, function(key, value) {
					html += '<td>' + value + '</td>'
				});
				html += '</tr>'

			});

			$tbl.append(html);
		}
	}
}(jQuery);