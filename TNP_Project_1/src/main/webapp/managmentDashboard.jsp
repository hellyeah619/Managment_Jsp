<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.database.DbConnection,java.sql.*"%>
<% int Fpending = DbConnection.count("Finance","Pending");
   int Fapproved = DbConnection.count("Finance","Approved");
   int Fdeny = DbConnection.count("Finance","Denied");
   int Lpending = DbConnection.count("Legal","Pending");
   int Lapproved = DbConnection.count("Legal","Approved");
   int Ldeny = DbConnection.count("Legal","Denied");%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Management Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-iMA1HVx9BZCWz47a0ekuOwM/3/ZsRB3XsuV6wlC4YxpP+0RXD/BHofMWEOmly9grT8F08VhG/ra1HgQlUyzWPw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="path/to/chakra-ui.css">
<style>
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
    .form-input{
        margin-top: 2px;
        border: 1px solid gray;
        width: 70%;
        background-color: #f2f2f2;
        padding-bottom: 10px;
    }
    .summary{
    	margin-left: 30px;    
    }
    .send-button {
        background-color: #1a73e8; 
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
        margin-top: 20px;
    }

    .send-button:hover {
        background-color: #0056b3; 
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

</style>
</head>
<body>
<div style="margin-left: 100px; margin-right: 100px;">
    <div class="flex justify-between py-2 px-4 bg-gray-800 text-white" style="height: 30px;">
        <div>Management Dashboard</div>
        <div><a href="index.jsp" class="logout-button"><i class="fas fa-sign-out-alt"></i>Logout</a></div>
    </div>
    <div class="flex">
        <form class = "form-input" method = "post" action = "managmentData.jsp">
        <div class="w-2/3 mx-5" style="width: 80%;">
            <h2 style="font-size: 30px;">Request Form</h2>
                <input
                  type="text"
                  placeholder="Enter request title"
                  name="requestTitle"
                  id="requestTitle"
                  class="input-field w-full "
                  style="width: 100%; height: 25px; margin-top: 20px;"
                />
            <div style="margin-top: 5px;">
                <textarea class="w-full" rows="10" style = "width: 100%; margin-top: 20px;" id="reqDesc" name = "reqDesc">Describe your request</textarea>
            </div>
            <select class="w-full" style = "width: 100%; margin-top: 20px; height: 25px" id = "department" name = "department">
                <option value="" disabled selected>Select an Department</option>
                <option value = "Finance">Finance</option>
				<option value = "Legal">Legal</option>
            </select>
            <div style=  "margin-top: 5px;">
            	<button class="send-button" type="submit">Send Request</button>
            </div>
        </div>
        </form>
        <form class = "summary">
        <div>
            <div >
                <h4 class="mt-3" style = "font-size: 25px">
                Summary Section
                </h4>
                
                <div>
                    <h5 class="text-center mb-3" style = "font-size: 20px; margin-left: 50px;">Finance Department</h5>
                    <div class="text-blue-900 font-semibold" style = "color: blue;"><b>Approved Requests : <%out.println(Fapproved);%> </b></div>
                    <div class="text-red-700 font-semibold" style = "color: red; margin-top: 10px;"><b>Deny Requests : <%out.println(Fdeny);%></b></div>
                    <div class="text-green-600 font-semibold"style = "color: green;margin-top: 10px;"><b>Pending Requests : <%out.println(Fpending); %> </b></div>
                </div>
                
                <div>
                    <h6 class="text-center mb-3" style = "font-size: 20px;margin-left: 50px;">Legal Department</h6>
                    <div class="text-blue-900 font-semibold" style = "color: blue;"><b>Approved Requests : <%out.println(Lapproved);%> </b></div>
                    <div class="text-red-700 font-semibold" style = "color: red; margin-top: 10px;"><b>Deny Requests: <%out.println(Ldeny);%></b></div>
                    <div class="text-green-600 font-semibold"style = "color: green;margin-top: 10px;"><b>Pending Requests: <%out.println(Lpending); %></b></div>
                </div>
                
            </div>
        </div>
        </form>
    </div>
    <div class="my-5">
        <table>
            <thead>
                <tr>
                    <th>Request ID</th>
                    <th>Request Title</th>
                    <th>Description</th>
                    <th>Request Date</th>
                    <th>Request Department</th>
                    <th>Approval Person</th>
                    <th>Approval Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                	Connection conn = DbConnection.haveConnection();
                	String q = "select * from approval";
                	PreparedStatement st = conn.prepareStatement(q);
                	ResultSet rs = st.executeQuery();
                	while(rs.next()){
                		out.println("<tr>");
                		out.println("<td>" + rs.getInt("request_id") + "</td>");
                		out.println("<td>" + rs.getString("title") + "</td>");
                		out.println("<td>" + rs.getString("description") + "</td>");
                		out.println("<td>" + rs.getString("request_date") + "</td>");
                		out.println("<td>" + rs.getString("request_dept") + "</td>");
                		out.println("<td>" + rs.getString("approval_person") + "</td>");
                		out.println("<td>" + rs.getString("approval_date") + "</td>");
                		String stat = rs.getString("status");
                		String color = "red";
                		if(stat.equals("Approved")){
                			color = "blue";
                		}else if(stat.equals("Pending")){
                			color = "green";
                		}
                		out.println("<td style='color: " + color + ";'>" + stat + "</td>");
                        out.println("</tr>");
                	}
                %>
            </tbody>
        </table> 
    </div>
</div>
</body>
</html>

