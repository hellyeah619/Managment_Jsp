<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.database.DbConnection,java.sql.*,java.util.Date"%>
<%
	String approvalPerson = (String) session.getAttribute("username");
	Date d = new Date();
	String approvalDate = d.toString();
	String dept = (String) session.getAttribute("DEPT");
	String action = request.getParameter("action");
	String id = request.getParameter("requestId");
	String query = "update approval set approval_person = '"+approvalPerson+"', approval_date = '"+approvalDate+"', status = '"+action+"'where request_id = '"+id+"'";
	try{
		Connection conn = DbConnection.haveConnection();
		Statement st = conn.createStatement();
		st.executeUpdate(query);
	}catch(Exception e){
		e.printStackTrace();
	}	
	if("Finance".equals(dept)){
		response.sendRedirect("financeDashboard.jsp");
	}else if("Legal".equals(dept)){
		response.sendRedirect("legalDashboard.jsp");
	}
%>