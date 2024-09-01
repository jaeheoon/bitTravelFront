<%@ page contentType="application/json; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="review.dao.ReviewDAO" %>
<%@ page import="review.bean.ReviewDTO" %>
<%
    ReviewDAO reviewDAO = ReviewDAO.getInstance();
    JSONObject json = new JSONObject();

    // 데이터 목록을 가져옴
    ArrayList<ReviewDTO> reviewList = reviewDAO.viewSearchList("subject", "");

    // JSON 배열로 변환
    JSONArray jsonArray = new JSONArray();
    for (ReviewDTO review : reviewList) {
        JSONObject reviewJson = new JSONObject();
        reviewJson.put("reviewNo", review.getReviewNo());
        reviewJson.put("subject", review.getSubject());
        reviewJson.put("memberId", review.getMemberId());
        reviewJson.put("hit", review.getHit());
        reviewJson.put("date", review.getDate().split(" ")[0]);  // 날짜 포맷 수정
        jsonArray.put(reviewJson);
    }
    json.put("list", jsonArray);

    response.setContentType("application/json");
    response.getWriter().print(json.toString());
%>