<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
   a{
      margin-left: 45em;
      margin-top: 15px;
   }
</style>
</head>
<body>
     <%
        //fetching id of employee
        int id = (int)(session.getAttribute("userId"));
     %>
   
    <!-- table for displaying all assigned tasks of employee -->
 
 <div id="box">	
   <table border="1">  
    <tr>
      <th> Task ID </th>
      <th> Project Name </th>
      <th> Description </th>
      <th> Task </th>
      <th> Completion Hours </th>
      <th> Completion Date </th>
      <th> Remark </th>
      
    </tr>  
        
    <%
        //db code for fetching all tasks
        try{ 
        	 String qry = "select * from task where empId=? AND completeHour IS NOT NULL AND date IS NOT NULL";
       	  Class.forName("com.mysql.jdbc.Driver");
       	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
       	  PreparedStatement sta = con.prepareStatement(qry);
       	  sta.setInt(1, id);
       	  ResultSet rs = sta.executeQuery();
       	  System.out.println("task retrieval query executed");
       	  while(rs.next()){
       		  %>
       		  
       		  <tr>
    					<td><%= rs.getInt(1) %></td>
    					<td><%=rs.getString(2) %></td>
    					<td><%= rs.getString(3) %></td>
    					<td><%=rs.getString(4) %></td>
    					<td><%= rs.getString(5) %></td>
    					<td><%=rs.getString(6) %></td>
    					<td><%=rs.getString(7) %></td>
    					
    				</tr>
    			<%	
        	 }
        	%>
        	  </table>
        	</div>
          
          <a href="empProfile.jsp">Home Page</a>
       		  <%
       	  
        } catch(Exception e){
        	out.println(e);
        }
     %>
</body>
</html>