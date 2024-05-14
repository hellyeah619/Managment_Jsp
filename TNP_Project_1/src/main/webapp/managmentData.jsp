<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.database.DbConnection"%>
<%@ page import="java.util.Date" %>
<%
	String reqTitle = request.getParameter("requestTitle");
	String reqDesc = request.getParameter("reqDesc");
	String department = request.getParameter("department");
	String username = (String)session.getAttribute("username");
	Date d = new Date();
	String reqDate = d.toString();
	DbConnection.insertReq(reqTitle, reqDesc,username, reqDate, department);
	response.sendRedirect("managmentDashboard.jsp");
%>