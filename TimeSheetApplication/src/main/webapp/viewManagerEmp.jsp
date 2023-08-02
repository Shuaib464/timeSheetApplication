<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <%
    System.out.println("in viewManagerEmp ....");
    

    int id = (int)session.getAttribute("userId");
    System.out.println(id+" = id");
    
    //db code for displaying table of registered employees
    String qry = "select * from emp where registeredBy = ?";
   
   %>
   
   <!-- table for displaying all users in hr.jsp -->
 <div id="box">	
   <table border="1">  
    <tr>
      <th> Emp ID </th>
      <th> Name </th>
      <th> All Tasks </th>
      <th> Assign Task </th>
    </tr>
   <%
         try{
        	 Class.forName("com.mysql.jdbc.Driver");
        	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
        	 PreparedStatement sta = con.prepareStatement(qry);
        	 sta.setInt(1, id);
        	 ResultSet rs = sta.executeQuery();
        	 System.out.println("query executed");
        	 while(rs.next()){
        		 %>
        		    <tr>
    					<td><%= rs.getInt(1) %></td>
    					<td><%=rs.getString(2) %></td>
    					<td> <a href="allTaskForm.jsp?id=<%=rs.getInt(1) %>">view Tasks</a></td>
    					<td> <a href="assignTaskForm.jsp?id=<%=rs.getInt(1)%>">assign</a></td>
    				</tr>
    			<%	
        	 }
        	%>	
        	  </table>
        	</div>  
        	<%
         }catch(Exception e){
        	 out.println(e);
         }
    %>
</body>
</html>