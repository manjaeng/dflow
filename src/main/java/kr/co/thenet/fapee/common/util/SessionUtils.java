package kr.co.thenet.fapee.common.util;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.co.thenet.fapee.common.model.SessionVO;


public class SessionUtils {
	private static final String SESSION_DATA_KEY = "__sessiondata__";
	
	/**
	 * SessionData 를 확인하여 로그인 여부를 체크
	 *
	 * @param request
	 * @return
	 * @see SessionVO
	 */
	
	public static boolean isLogin(HttpServletRequest req) {
		if (SessionUtils.getSessionData(req) != null) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * SessionData 를 가져온다.
	 *
	 * @param request
	 * @return
	 * @see SessionVO
	 */
	
	public static SessionVO getSessionData(HttpServletRequest req) {
		return (SessionVO) getData(req, SESSION_DATA_KEY);
	}

	/**
	 * SessionVO 를 session 에 저장한다.
	 *
	 * @param request
	 * @param sessionData
	 * @see SessionVO
	 */
	public static void setSessionData(HttpServletRequest req, SessionVO sessionVO) {
		setData(req, SESSION_DATA_KEY, sessionVO);
	}

	/**
	 * session 에서 key 이름으로 저장된 data를 가져온다.
	 *
	 * @param request
	 * @param key
	 * @return
	 */
	public static Object getData(HttpServletRequest req, String key) {
		return req.getSession().getAttribute(key);
	}

	/**
	 * session 에 key 이름으로 data 를 저장한다.
	 *
	 * @param request HttpServletRequest
	 * @param key session key value
	 * @param data object
	 */
	public static void setData(HttpServletRequest req, String key, Object data) {
		if(key != null && data != null) {
			req.getSession().setAttribute(key, data);
		}
	}

	/**
	 * seesion 에 key 이름으로 등록된 data 를 삭제한다.
	 *
	 * @param request
	 * @param key
	 */
	public static void removeData(HttpServletRequest req, String key) {
		req.getSession().removeAttribute(key);
	}

	/**
	 * seesion 에 key 이름으로 등록된 data 를 삭제한다.
	 *
	 * @param request
	 */
	public static void removeSession(HttpServletRequest req){
		req.getSession().removeAttribute(SESSION_DATA_KEY);
		req.getSession().invalidate();
	}
	
	/**
	 * seesion 에 key 이름으로 등록된 data null 또는 빈문자열 체크
	 *
	 * @param request
	 * @param key
	 */
	public static boolean isEmpty(HttpServletRequest req, String key){
		Object data = req.getSession().getAttribute(key);
		return (data == null || "".equals(data)) ? true : false;
	}
	
	
	public static SessionVO getSessionData() {
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return (SessionVO) getData(req, SESSION_DATA_KEY);
	}
	
	public static Long getIdKey() {
		SessionVO sessionData = getSessionData();
		return (sessionData==null)? null : sessionData.getIdKey();
	}
	
	public static String getUserId() {
		SessionVO sessionData = getSessionData();
		return (sessionData==null)? null : sessionData.getUserId();
	}
	
}
