package kr.co.thenet.fapee.common.logger;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.thenet.fapee.common.util.SessionUtils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");

		log.info(" Request Info : (" + request.getMethod() + ") - " + sf.format(new Date()) + " - "
				+ request.getRequestURI());

		if (request.getRequestURI().contains("/app/") && SessionUtils.getSessionData(request) != null) {
			log.info(" Session Data  : " + SessionUtils.getSessionData(request));
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

}
