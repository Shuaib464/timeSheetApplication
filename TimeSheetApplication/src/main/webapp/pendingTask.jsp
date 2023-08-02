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
        	 String qry = "select * from task where empId=? AND (completeHour IS NULL OR date IS NULL)";
       	  Class.forName("com.mysql.jdbc.Driver");
       	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
       	  PreparedStatement sta = con.prepareStatement(qry);
       	  sta.setInt(1, id);
       	  ResultSet rs = sta.executeQuery();
       	  System.out.println("task retrieval query executed");
       	  while(rs.next()){
       		  %>
       		  <form action="saveTask.jsp">
       		  <tr>
    					<td><%= rs.getInt(1) %></td>
    					<td><%=rs.getString(2) %></td>
    					<input type="hidden" value="<%=rs.getInt(1) %>" name="hid">
    					<%
    					 if(rs.getString(5)==null){
    					%>
    					<td><input type="text" name="desc" value=" "></td>
    					<%
    					 } else{
    					%>
    					<td><input type="text" name="desc" value="<%=rs.getString(3)%>"></td>
    					<%} %>
    					<td><%=rs.getString(4) %></td>
    					<%
    					 if(rs.getString(5)==null){
    					%>
    					<td><input type="text" name="hours" value=" "></td>
    					<td><input type="date" name="date" value=" "></td>
    					<td><input type="text" name="remark" value=" "></td>
    					<%
    					 } else{
    					%>
    					<td><input type="text" name="hours" value="<%=rs.getString(5)%>"></td>
    					<td><input type="date" name="date" value="<%=rs.getString(6)%>"></td>
    					<td><input type="text" name="remark" value="<%=rs.getString(7)%>"></td>
    					<%} %>
    					
    					<td><input type="submit" value="UPDATE"></td>
    					
    					
    				</tr>
    			 </form>  
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