package kr.co.thenet.fapee.common.util;

import java.util.Random;

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
	
	public static String getRandomNum(int size) {

		StringBuffer buffer = new StringBuffer();
		Random random = new Random();

		String chars[] = "0,1,2,3,4,5,6,7,8,9".split(",");

		for (int i = 0; i < size; i++) {
		buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	
	public static boolean isNumeric(String s) {
		try {
			Double.parseDouble(s);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}
