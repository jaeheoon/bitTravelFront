package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	
	public MemberDAO() {
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
	
	public static MemberDAO getInstance() {
		return instance;
	}

	public int write(MemberDTO memberDTO) {
		int su = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("insert into member(MEMBER_NO, name, id, pwd, phone, address, admin) values(member_sequence.nextval, ?, ?, ?, ?, ?, 0)");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getPhone());
			pstmt.setString(5, memberDTO.getAddress());
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

	public boolean isExist(String id, String value) {
		int su = 0;
		boolean check = true;
		StringBuilder sb = new StringBuilder();
		if (value.equals("id")) {
			sb.append("select * from member where id = ?");
		} else if(value.equals("phone"))
			sb.append("select * from member where phone = ?");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			su = pstmt.executeUpdate();
			if (su > 0 && value.equals("id")) {
				System.out.println("중복된 아이디입니다");
				check = false;
			} else if (su > 0 && value.equals("phone")) {
				System.out.println("중복된 번호입니다");
				check = false;
			}
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
		return check;
	}

	public MemberDTO loginInfo(String id, String pwd) {
		MemberDTO memberDTO = new MemberDTO();
		StringBuilder sb = new StringBuilder();
		sb.append("select * from member where id = ? and pwd = ?");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDTO.setMemberNo(rs.getInt("member_no"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPwd(rs.getString("pwd"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setAddress(rs.getString("address"));
				memberDTO.setAdmin(rs.getInt("admin"));
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
		return memberDTO;
	}
	
	public boolean isExistPwd(String id, String pwd) {
		boolean ck = false;
		StringBuilder sb = new StringBuilder();
		sb.append("select * from member where id = ? and pwd = ?");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) ck = true;
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
		return ck;
	}
	
	public boolean deleteMember(String id) {
		boolean ck = false;
		StringBuilder sb = new StringBuilder();
		sb.append("delete member where id = ?");
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, id);
			
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

	public boolean updateMember(String type, String value, String id, String pwd) {
		StringBuilder sb = new StringBuilder();
		boolean ck = false;
		
		sb.append("UPDATE MEMBER SET "+type+" = ? WHERE ID = ? and PWD = ?");
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, value);
			pstmt.setString(2, id);
			pstmt.setString(3, pwd);
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

	public ArrayList<MemberDTO> viewList() {
		StringBuilder sb = new StringBuilder();
		ArrayList<MemberDTO> list = new ArrayList<>();
		sb.append("select * from member WHERE admin = 0");
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO newMemberDTO = new MemberDTO();
				newMemberDTO.setMemberNo(rs.getInt("member_no"));
				newMemberDTO.setId(rs.getString("id"));
				newMemberDTO.setPhone(rs.getString("phone"));
				newMemberDTO.setName(rs.getString("name"));
				newMemberDTO.setPwd(rs.getString("pwd"));
				newMemberDTO.setAddress(rs.getString("address"));
				newMemberDTO.setAdmin(rs.getInt("admin"));
				list.add(newMemberDTO);
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

}
