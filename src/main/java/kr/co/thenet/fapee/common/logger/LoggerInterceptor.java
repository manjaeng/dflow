package kr.co.thenet.fapee.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoggerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (log.isDebugEnabled()) {
			
			if(request.getRequestURI().indexOf("/resources") == -1 &&
				request.getRequestURI().indexOf("/admin") != -1 ) {
				log.debug(" Request URI \t:  " + request.getRequestURI());
			}
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

}
