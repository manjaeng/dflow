package kr.co.thenet.fapee.common.logger;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggerAspect {

	private static final Logger logger = LoggerFactory.getLogger(LoggerAspect.class);

	@Before("execution(* kr.co.thenet.fapee.*.service.impl.*Impl.*(..))")
	public void startLog(JoinPoint jp) {

	}

	@Around("execution(* kr.co.thenet.fapee.*.service.impl.*Impl.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();

		logger.info("-------------START----------------");
		logger.info("1:" + Arrays.toString(pjp.getArgs()));
		logger.info("2:" + pjp.getSignature().getName());

		Object result = pjp.proceed();

		long endTime = System.currentTimeMillis();
		logger.info(pjp.getSignature().getName() + "- 메서드 실행시간 : " + (endTime - startTime));
		logger.info("--------------END-----------------");

		return result;
	}
}