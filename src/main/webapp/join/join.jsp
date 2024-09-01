<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>	
<%@page import="org.json.JSONObject"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<% 
	MemberDAO memberDAO = MemberDAO.getInstance();
	String id = request.getParameter("joinId");
	String pwd = request.getParameter("joinPwd");
	String phone = request.getParameter("joinPhone");
	String name = request.getParameter("joinName");
	String addr = request.getParameter("joinAddr");
	
	boolean check = memberDAO.isExist(id, "id");
	if (!check) {
		System.out.println("중복된 아이디입니다");
		check = false;
		return;
	}
	
	check = memberDAO.isExist(phone, "phone");
	if (!check) {
		System.out.println("중복된 번호입니다");
		check = false;
		return;
	}
	
	MemberDTO memberDTO = new MemberDTO(name, id, pwd, phone, addr);
	JSONObject json = new JSONObject();
	
	int su = memberDAO.write(memberDTO);
	if(su != 0) {
		json.put("message", "회원가입에 성공하였습니다");
        json.put("redirect", "../html/index.jsp");
	}
	else json.put("message", "회원가입에 실패하였습니다");
	
	response.setContentType("application/json");
	response.getWriter().print(json.toString());
%>