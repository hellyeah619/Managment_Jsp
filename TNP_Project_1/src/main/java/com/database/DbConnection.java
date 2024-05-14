package com.database;
import java.sql.*;
public class DbConnection {
	public static Connection haveConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project1","root", "Hellyeah619@");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static boolean checkConnection(String name, String password, String department) {
		try {
			Connection conn = DbConnection.haveConnection();
			Statement s = conn.createStatement();
			String query = "select * from login where username = '"+name+"' and password = '"+password+"' and department = '"+department+"'" ;
			ResultSet rs = s.executeQuery(query);
			if(!rs.next()) {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	public static void insertReq(String title, String desc, String reqBy, String reqDate, String reqDept) {
		try {
			Connection conn = DbConnection.haveConnection();
			String q = "insert into approval(title,description,request_by,request_date,request_dept)values(?,?,?,?,?)";
			PreparedStatement st = conn.prepareStatement(q);
			st.setString(1, title);
			st.setString(2, desc);
			st.setString(3, reqBy);
			st.setString(4, reqDate);
			st.setString(5, reqDept);
			st.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static int count(String dept, String status) {
		int cnt = 0;
		try {
			Connection conn = DbConnection.haveConnection();
			String q = "select count(*) as count from approval where request_dept = '"+dept+"' and status = '"+status+"'";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(q);
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
