<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.json.JSONObject"%>
<% 
	JSONObject json = new JSONObject();
	response.setContentType("application/json");
	response.getWriter().print(json.toString());
%>