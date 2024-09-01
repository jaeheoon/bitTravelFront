<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO" %>
<%
   String userId = request.getParameter("userId");
   String password = request.getParameter("userPwd");
   
   MemberDAO memberDAO = MemberDAO.getInstance();

   // 로그인 정보 조회
   MemberDTO memberDTO = memberDAO.loginInfo(userId, password);
   JSONObject json = new JSONObject();

   if (memberDTO != null && userId.equals(memberDTO.getId()) && password.equals(memberDTO.getPwd())) {
       session.setAttribute("userId", memberDTO.getId());
       session.setAttribute("userName", memberDTO.getName());
       json.put("message", "로그인에 성공하였습니다.");
       json.put("redirect", "../html/index.jsp");
   } else {
       json.put("message", "아이디나 비밀번호를 확인해주시기 바랍니다.");
   }
   response.setContentType("application/json");
   response.getWriter().print(json.toString());
%>