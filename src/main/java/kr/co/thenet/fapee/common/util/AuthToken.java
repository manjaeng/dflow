package kr.co.thenet.fapee.common.util;

import java.util.Date;
import org.apache.commons.net.util.Base64;
 
public class AuthToken {
	
	public static String getToken(long idKey, long expireDateTime, String userType, long lastSeq) {
		String origin = String.format("%s=%s=%s=%s",
								String.valueOf(idKey),
								String.valueOf(expireDateTime),
								userType,
								String.valueOf(lastSeq));
		return Base64.encodeBase64String(origin.getBytes()).trim();
	}
	
	public static boolean isAdmin(String token) {
		return isAdmin(token, null);
	}
	
	public static boolean isAdmin(String token, String token2) {
		String userType = getUserType(token, token2);
		if ("1".equals(userType) || "2".equals(userType)) {
			return true;
		}
		return false;
	}
	
	public static String getUserType(String token) {
		return AuthToken.getUserType(token, null);
	}
	
	public static String getUserType(String token, String token2) {
		if (token == null && token2 == null) {
			return "";
		}
		try {
			String userType;
			String decrypto = "";
			if (token != null) {
				decrypto = new String(Base64.decodeBase64(token));
			}
			if (token2 != null) {
				decrypto = new String(Base64.decodeBase64(token2));
			}
			String fields[] = decrypto.split("=");
			if (fields.length < 3) {
				return "";
			}
			userType = fields[2];
			return userType;
		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
			return "";
		}
	}
	
	public static long getIdKey(String token) {
		return AuthToken.getIdKey(token, null);
	}
	
	public static long getIdKey(String token, String token2) {
		if (token == null && token2 == null) {
			return -1;
		}
		try {
			long idKey = 0;
			String decrypto = "";
			if (token != null) {
				decrypto = new String(Base64.decodeBase64(token));
			}
			if (token2 != null) {
				decrypto = new String(Base64.decodeBase64(token2));
			}
			String fields[] = decrypto.split("=");
			idKey = Long.parseLong(fields[0]);
			return idKey;
		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
			return -1;
		}
	}
	
	public static long getLastSeq(String token) {
		return AuthToken.getLastSeq(token, null);
	}
	
	public static long getLastSeq(String token, String token2) {
		if (token == null && token2 == null) {
			return -1;
		}
		try {
			long lastSeq;
			String decrypto = "";
			if (token != null) {
				decrypto = new String(Base64.decodeBase64(token));
			}
			if (token2 != null) {
				decrypto = new String(Base64.decodeBase64(token2));
			}
			String fields[] = decrypto.split("=");
			if (fields.length < 4) {
				return -1;
			}
			lastSeq = Long.parseLong(fields[3]);
			return lastSeq;
		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
			return -1;
		}
	}
	
	public static boolean isValidToken(String token) {
		return AuthToken.isValidToken(token, null);
	}
	
	public static boolean isValidToken(String token, String token2) {
		if (token == null && token2 == null) {
			return false;
		}
		String decrypto = "";
		if (token != null) {
			decrypto = new String(Base64.decodeBase64(token));
		}
		if (token2 != null) {
			decrypto = new String(Base64.decodeBase64(token2));
		}
		String fields[] = decrypto.split("=");
		if (fields == null || fields.length != 4) {
			return false;
		}
		
		// 만기일 체크
		long expireDate = Long.parseLong(fields[1]);
		Date currentDate = new Date();
		if (expireDate < currentDate.getTime()) {
			return false;
		}
		
		return true;
	}
}
