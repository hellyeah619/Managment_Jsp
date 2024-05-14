<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.database.DbConnection"%>
<%
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	String department = request.getParameter("department");
	boolean status = DbConnection.checkConnection(name, password, department);
	if(status){
		session.setAttribute("username",name);
		if(department.equals("Managment")){
			response.sendRedirect("managmentDashboard.jsp");
		}else if(department.equals("Finance")){
			response.sendRedirect("financeDashboard.jsp");
		}else if(department.equals("Legal")){
			response.sendRedirect("legalDashboard.jsp");
		}
	}else{
		out.println("<script type='text/javascript'>");
        out.println("alert('Wrong Password or Username');");
        out.println("</script>");
        out.println("<a href = 'http://localhost:8080/TNP_Project_1/index.jsp'>");
        out.println("click here to login");
        out.println("</a>");
	}
%>