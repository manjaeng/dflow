package kr.co.thenet.fapee.common.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseUtil {

	public static ResponseEntity<?> getResponse(Object entity) {
		return ResponseUtil.getResponse(entity,HttpStatus.OK);
	}
	
	public static ResponseEntity<?> getResponse(HttpStatus status) {
		return ResponseUtil.getResponse(null,status);
	}
	
	public static ResponseEntity<?> getResponse(Object entity, HttpStatus status) {
		return new ResponseEntity<Object>(entity, status);
	}
}
