package kr.co.thenet.fapee.common.util;

import javax.servlet.http.HttpServletRequest;

public class CommonUtils {
	public static String getRemoteIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");

		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}
}
