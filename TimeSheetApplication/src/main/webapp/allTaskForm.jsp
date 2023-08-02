<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
<style>
   a{
      margin-left: 40em;
      margin-top: 15px;
   }
</style>
</head>
<body>
  <%
  int id =Integer.parseInt (request.getParameter("id"));
  
  System.out.println("in all task form -: "+id);
  
  session.setAttribute("empId", id);
  System.out.println(session.getAttribute("empId"));
  
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
      <th> Rating </th>
      <th> Submission </th>
    </tr>
    
    <%
         String qry = "select * from task where empId=?";
         try{
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
        	 PreparedStatement sta = con.prepareStatement(qry);
        	 sta.setInt(1, id);
        	 ResultSet rs = sta.executeQuery();
        	 System.out.println("view all tasks to manager query executed");
        	 while(rs.next()){
        		 %>
        		    <tr>
        		      <form action="submitRating.jsp">
    					<td><%= rs.getInt(1) %></td>
    					<td><%=rs.getString(2) %></td>
    					<input type="hidden" value="<%=rs.getInt(1) %>" name="taskid">
    					<%if(rs.getString(3)==null){%>
    					<td> </td>
    					<%}else{ %> <td><%=rs.getString(3) %></td><%} %>
   
    					<td><%=rs.getString(4) %></td>
    					
    					<%if(rs.getString(5)==null){%>
    					<td> </td>
    					<%}else{ %> <td><%=rs.getString(5) %></td><%} %>
    					
    					<%if(rs.getString(6)==null){%>
    					<td> </td>
    					<%}else{ %> <td><%=rs.getString(6) %></td><%} %>
    					
    					<%if(rs.getString(7)==null){%>
    					<td> </td>
    					<%}else{ %> <td><%=rs.getString(7) %></td><%} %>
    					
    					<%if(rs.getInt(8)!=0){%>
    					<td><%= rs.getInt(8) %></td>
    					<%}else{ %><td> <input type="number" name="rating" value="enter rating"> </td>
    					<td> <input type="submit" value="submit"></td> <%} %>
    				   </form>  
    				</tr>
    			<%	
        	 }
        	%>
        	  </table>
        	</div>
       
        <h3><a href="managerProfile.jsp">Home Page</a></h3>
        	<%
         }catch(Exception e){
        	 out.println(e);
         }
    %>
    
</body>
</html>