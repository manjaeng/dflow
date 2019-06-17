package kr.co.thenet.fapee.common.util;

import javax.servlet.http.HttpServletRequest;

public class CommonUtils {
	public static String getRemoteIP(HttpServletRequest req) {
		String ip = req.getHeader("X-FORWARDED-FOR");

		if (ip == null || ip.length() == 0) {
			ip = req.getHeader("Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = req.getHeader("WL-Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = req.getRemoteAddr();
		}

		return ip;
	}
}
