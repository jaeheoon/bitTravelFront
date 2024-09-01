<%@ page contentType="application/json; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="review.dao.ReviewDAO" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="review.bean.ReviewDTO" %>
<%
    ReviewDAO reviewDAO = ReviewDAO.getInstance();
    JSONObject json = new JSONObject();

    String userId = (String) session.getAttribute("userId");
    String subject = request.getParameter("articleTitle");
    String content = request.getParameter("articleContent");

    ReviewDTO reviewDTO = new ReviewDTO();
    reviewDTO.setMemberId(userId);
    reviewDTO.setSubject(subject);
    reviewDTO.setContent(content);

    int su = reviewDAO.write(reviewDTO);

    if (su != 0) {
        json.put("message", "글 등록이 성공하였습니다");
        json.put("redirect", "../html/article.jsp");
    } else {
        json.put("message", "글 등록이 실패하였습니다");
    }

    response.setContentType("application/json");
    response.getWriter().print(json.toString());
%>