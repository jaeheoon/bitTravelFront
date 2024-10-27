package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import review.bean.ReviewDTO;

public class ReviewDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static ReviewDAO instance = new ReviewDAO();
	
	public ReviewDAO() {
		Context ctx;
		try {
			// context.xml의 커넥션풀에 있는 name 데이터를 가져와서 DataSource에 담아주는 역할
			ctx = new InitialContext();
//			ds = (DataSource)ctx.lookup("jdbc/oracle");
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); // Tomcat의 경우 앞에 접두사가 붙는다
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static ReviewDAO getInstance() {
		return instance;
	}

	public ArrayList<ReviewDTO> viewSearchList(String type, String value) {
		StringBuilder sb = new StringBuilder();
		ArrayList<ReviewDTO> list = new ArrayList<>();
		sb.append("SELECT ");
		sb.append("    r.REVIEW_NO AS reviewNo, ");
		sb.append("    r.TRAVEL_NAME AS travelName, ");
		sb.append("    r.CONTINENT AS continent, ");
		sb.append("    r.SUBJECT AS subject, ");
		sb.append("    r.CONTENT AS content, ");
		sb.append("    r.HIT AS hit, ");
		sb.append("    r.REVIEW_COMMENT AS reviewComment, ");
		sb.append("    f.FUNC_LIKE AS funcLike, ");
		sb.append("    m.NAME AS name, ");
		sb.append("    r.LOGTIME AS logtime ");
		sb.append("FROM REVIEW r  ");
		sb.append("JOIN MEMBER m ON r.ID = m.ID ");
		sb.append("LEFT JOIN FUNCTION f ON r.TRAVEL_NAME = f.TRAVEL_NAME AND r.ID = f.ID ");
		sb.append("WHERE "+type+" like ? ");
		sb.append("ORDER BY r.LOGTIME DESC");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, "%"+value+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewDTO newReviewDTO = new ReviewDTO();
				newReviewDTO.setReviewNo(rs.getInt("reviewNo"));
				newReviewDTO.setHit(rs.getInt("hit"));
				newReviewDTO.setTravelName(rs.getString("travelName"));
				newReviewDTO.setContinent(rs.getString("continent"));
				newReviewDTO.setSubject(rs.getString("subject"));
				newReviewDTO.setContent(rs.getString("content"));
				newReviewDTO.setReviewComment(rs.getString("reviewComment"));
				newReviewDTO.setLike(rs.getDouble("funcLike"));
				newReviewDTO.setMemberId(rs.getString("name"));
				newReviewDTO.setDate(rs.getString("logtime"));
				list.add(newReviewDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int write(ReviewDTO reviewDTO) {
		int su = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO REVIEW(REVIEW_NO, ID, SUBJECT, CONTENT) VALUES (REVIEW_SEQUENCE.nextval, ?, ?, ?)");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, reviewDTO.getMemberId());
			pstmt.setString(2, reviewDTO.getSubject());
			pstmt.setString(3, reviewDTO.getContent());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

	public int like(String travel, String id, int like) {
		int su = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO FUNCTION(FUNCTION_NO, TRAVEL_NAME, ID, FUNC_LIKE) VALUES (FUNCTION_SEQUENCE.nextval, ?, ?, ?)");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, travel);
			pstmt.setString(2, id);
			pstmt.setInt(3, like);
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

	public boolean updateFunclike(int no, int value, String id) {
		StringBuilder sb = new StringBuilder();
		boolean ck = false;
		
		sb.append("UPDATE FUNCTION f ");
	    sb.append("SET f.FUNC_LIKE = ? ");
	    sb.append("WHERE f.TRAVEL_NAME = ( ");
	    sb.append("    SELECT r.TRAVEL_NAME ");
	    sb.append("    FROM REVIEW r ");
	    sb.append("    WHERE r.REVIEW_NO = ? ");
	    sb.append("      AND r.TRAVEL_NAME = f.TRAVEL_NAME ");
	    sb.append("      AND r.ID = f.ID ) ");
	    sb.append("  AND f.ID = ?");
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, value);
			pstmt.setInt(2, no);
			pstmt.setString(3, id);
			if(pstmt.executeUpdate() > 0) ck = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ck;
	}

	public boolean updateReview(int no, String type, String value, String id) {
		StringBuilder sb = new StringBuilder();
		boolean ck = false;
		
		sb.append("UPDATE REVIEW SET "+type+" = ? WHERE ID = ? AND REVIEW_NO = ?");
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, value);
			pstmt.setString(2, id);
			pstmt.setInt(3, no);
			if(pstmt.executeUpdate() > 0) ck = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ck;
	}

	public boolean deleteReview(int no) {
		boolean ck = false;
		StringBuilder sb = new StringBuilder();
		sb.append("delete review where review_no = ?");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, no);
			
			if(pstmt.executeUpdate() > 0) ck = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ck;
	}
	
	public boolean deleteLike(int no) {
		boolean ck = false;
		StringBuilder sb = new StringBuilder();
		sb.append("delete function where function_no = ?");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, no);
			
			if(pstmt.executeUpdate() > 0) ck = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ck;
	}

}
