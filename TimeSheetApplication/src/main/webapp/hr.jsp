<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.*"%>
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
    <h1><center>Registration</center></h1>
    
    <form action="register.jsp"> 
      <table>
        
            <tr><td> Name-: <input type="text" name="empName"> </td></tr>
            <tr><td> Mobile-: <input type="text" name="empMob"> </td></tr>
            <tr><td> Password-: <input type="password" name="empPass"> </td></tr>
            <tr><td> Role-: <select name="empRole">
                            <option value="1">Admin</option>
                            <option value="2">Manager</option>  
                            <option value="3">Employee</option>
                        </select>
             </td> </tr>
            <tr><td> <input type="submit" value="register"></td> </tr>
        
    </table>
   </form>
   
     
   
   
 <!-- table for displaying all users in hr.jsp -->
 <div id="box">	
   <table border="1">  
    <tr>
      <th> ID </th>
      <th> Name </th>
      <th> Mobile </th>
      <th> Password </th>
      <th> Role </th>
    </tr>
 <%
 try{
	 String qry = "select * from emp";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
    
    Statement sta = con.createStatement();
    ResultSet rs = sta.executeQuery(qry);
    
    while(rs.next()){
    		  %>
    		    
    				<tr>
    					<td><%= rs.getInt(1) %></td>
    					<td><%=rs.getString(2) %></td>
    					<td><%=rs.getString(3) %></td>
    					<td><%=rs.getString(4) %></td>
    					<td><% if(rs.getInt(5)==1){
    						     out.print("Admin");
    					     } else if(rs.getInt(5)==2){
    					    	 out.print("Manager");
    					     } else if(rs.getInt(5)==3){
    					    	 out.println("Employee");
    					     }				    	 
    						
    						%></td>
    				</tr>

    			
    		<%	  
    	  }
    %>
    </table>
  	</div>
    <%
         
 } catch(Exception e){
	 out.println(e);
 }
 %>
   
</body>
</html>