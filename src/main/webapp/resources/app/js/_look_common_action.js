var ing = false;
$(document).ready(function() {
	$('body').delegate('li.scrap > a.bt', 'click', function() {
		if(ing) return;
		ing = true;
		window.setTimeout(function() { 
			ing = false
		}, 100);
		
		var obj = $(this);
		var lookIdKey = $(this).data('idkey');
		
 		$.ajax({
			type : 'post',
			url : '/app/look/look_favorite.do',	//cool or scrap
			data : JSON.stringify({
				'lookIdKey' :lookIdKey
			}),
			contentType : 'application/json; charset=utf-8',
			success : function(data) {
				if(data=='insert') {
					obj.addClass('on');
				}
				else if(data=='delete') {
					obj.removeClass('on');
				}
			}
		});  
	})
})