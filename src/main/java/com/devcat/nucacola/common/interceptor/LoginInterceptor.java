package com.devcat.nucacola.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")==null) {
			// 비회원 => 기존 흐름대로 진행 불가. alert 및 메인페이지 요청
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다. 로그인 후 이용해주세요");
			response.sendRedirect(request.getContextPath());
			return false;
		}else {
			return true;
			
		}
	}


}