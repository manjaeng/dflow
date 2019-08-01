package kr.co.thenet.fapee.common.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseUtils {

	public static ResponseEntity<?> getResponse(Object entity) {
		return ResponseUtils.getResponse(entity,HttpStatus.OK);
	}
	
	public static ResponseEntity<?> getResponse(HttpStatus status) {
		return ResponseUtils.getResponse("",status);
	}
	
	public static ResponseEntity<?> getResponse(Object entity, HttpStatus status) {
		return new ResponseEntity<Object>(entity, status);
	}
}
