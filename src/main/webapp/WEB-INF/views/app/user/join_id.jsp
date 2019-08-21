<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<input type="text" id="id" placeholder="id">
	<br>
	<button type="button" id="next">NEXT</button>
	
	<script>
		$(function() {
				
				$('#next').click(function() {
					
					var $id = $('#id').val();
					
					if($id.length === 0) {
						console.log('아이디를 입력해주세요');
						return false;
					}
					
					return false;
				});
				
		});
	</script>
</div>