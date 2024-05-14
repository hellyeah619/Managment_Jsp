<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.database.DbConnection, java.sql.*" %>
<%	int Fpending = DbConnection.count("Finance","Pending");
	int Fapproved = DbConnection.count("Finance","Approved");
	int Fdeny = DbConnection.count("Finance","Denied");%>
<% session.setAttribute("DEPT","Finance");%>
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Finance Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-iMA1HVx9BZCWz47a0ekuOwM/3/ZsRB3XsuV6wlC4YxpP+0RXD/BHofMWEOmly9grT8F08VhG/ra1HgQlUyzWPw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="path/to/chakra-ui.css">
<style type="text/css">
	.flex {
        display: flex;
    }
    .justify-between {
        justify-content: space-between;
    }
    .py-2 {
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
    }
    .px-4 {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    .bg-gray-800 {
        background-color: #2d3748;
    }
    .text-white {
        color: #fff;
    }
    .mx-5 {
        margin-left: 1.25rem;
        margin-right: 1.25rem;
    }
	.logout-button {
        background-color:#6d59b6;
        color: #ffffff;
        border: none;
        padding: 8px;
        cursor: pointer;
        border-radius: 5px;
        text-decoration: none; 
        padding-top: 2px;
    }
    .logout-button:hover {
        background-color: #ca2c2c;
    }
    table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        } 
        tr:hover {
            background-color: #ddd;
        }
    .red-button {
	    display: inline-block;
	    padding: 10px 20px;
	    font-size: 16px;
	    font-weight: bold;
	    text-decoration: none;
	    color: #fff;
	    background-color: #ff0000; 
	    border: 2px solid #ff0000; 
	    border-radius: 5px;
	    cursor: pointer;
	}
	.red-button:hover {
	    background-color: #7c0808; 
	    border-color: #7c0808; 
	}
	.blue-button {
	    display: inline-block;
	    padding: 10px 20px;
	    font-size: 16px;
	    font-weight: bold;
	    text-decoration: none;
	    color: #fff;
	    background-color: #007bff; 
	    border: 2px solid #007bff; 
	    border-radius: 5px;
	    cursor: pointer;
	    margin-right: 4px;
	}
	.blue-button:hover {
	    background-color: #0056b3;
	    border-color: #0056b3;
	}
</style>
</head>
<body>
<div style="margin-left: 100px; margin-right: 100px;">
	<div class="flex justify-between py-2 px-4 bg-gray-800 text-white" style="height: 30px;">
        <div>Finance Dashboard</div>
        <div><a href="index.jsp" class="logout-button"><i class="fas fa-sign-out-alt"></i>Logout</a></div>
    </div>
    <div class = "flex">
    	<div class = "w-2/3 mx-5">
    		<h2>Summary</h2>
    		<div>
    			<div class="text-blue-900 font-semibold" style = "color: blue;"><b>Approved Requests : <%out.println(Fapproved);%> </b></div>
                <div class="text-red-700 font-semibold" style = "color: red; margin-top: 10px;"><b>Deny Requests : <%out.println(Fdeny);%></b></div>
                <div class="text-green-600 font-semibold"style = "color: green;margin-top: 10px;"><b>Pending Requests : <%out.println(Fpending); %> </b></div>
    		</div>
    	</div>
    		<div style="padding-left: 5%;">
    			<h2>Request Status</h2>
    			<table>
            		<thead>
                		<tr>
		                  <th>Request ID</th>
		                  <th>Request Title</th>
		                  <th>Description</th>
		                  <th>Request Date</th>
		                  <th>Request By</th>
		                  <th>Approval Person</th>
		                  <th>Approval Date</th>
		                  <th>Status</th>
	              		</tr>
	         		 </thead>
	         		 <tbody>
					    <% 
					        Connection conn = DbConnection.haveConnection();
					        String q = "select * from approval where request_dept = 'Finance'";
					        PreparedStatement st = conn.prepareStatement(q);
					        ResultSet rs = st.executeQuery();
					        while(rs.next()){
					            int requestId = rs.getInt("request_id");
					    %>
					    <tr>
					        <td><%= requestId %></td>
					        <td><%= rs.getString("title") %></td>
					        <td><%= rs.getString("description") %></td>
					        <td><%= rs.getString("request_date") %></td>
					        <td><%= rs.getString("request_by") %></td>
					        <td><%= rs.getString("approval_person") %></td>
					        <td><%= rs.getString("approval_date") %></td>
					        <td>
					            <% String stat = rs.getString("status");
					            if(stat.equals("Pending")) { %>
					                <div class="flex">
					                    <form action="approvalRecord.jsp" method="post">
					                        <input type="hidden" name="requestId" value="<%= requestId %>">
					                        <input type="hidden" name="action" value="Approved">
					                        <button class="blue-button" type="submit">Approve</button>
					                    </form>
					                    <form action="approvalRecord.jsp" method="post">
					                        <input type="hidden" name="requestId" value="<%= requestId %>">
					                        <input type="hidden" name="action" value="Denied">
					                        <button class="red-button" type="submit">Deny</button>
					                    </form>
					                </div>
					            <% } else { %>
					                <% String color = "red";
					                if(stat.equals("Approved")) {
					                    color = "blue";
					                } %>
					                <span style="color: <%= color %>;"><%= stat %></span>
					            <% } %>
					        </td>
					    </tr>
					    <% } %>
					</tbody>
	         	</table>
    		</div>
    </div>
</div>
</body>
</html>