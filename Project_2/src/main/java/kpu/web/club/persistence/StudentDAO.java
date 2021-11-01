package kpu.web.club.persistence;

import java.util.HashMap;
import java.util.Map;
import java.sql.*;

import kpu.web.club.domain.StudentVO;
public class StudentDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
	
	private static Map<String, StudentVO> storage = new HashMap<>();
	
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "jspbook", "rhgustjr9402!");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean join(StudentVO student) {
		try {
			storage.put(student.getId(), student);
		} catch(Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean add(StudentVO vo) {
		connect();
		String sql = "insert into student values (?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  vo.getId());
			pstmt.setString(2,  vo.getPasswd());
			pstmt.setString(3,  vo.getUsername());
			pstmt.setString(4,  vo.getSnum());
			pstmt.setString(5,  vo.getDepart());
			pstmt.setString(6,  vo.getMobile());
			pstmt.setString(7,  vo.getEmail());
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public ArrayList<StrudentVO> getStudentList() {
		
	}
}