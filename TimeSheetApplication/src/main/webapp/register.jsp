<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <% 
      String name = request.getParameter("empName");
      String mobile = request.getParameter("empMob");
      String pass = request.getParameter("empPass");
      String role = (request.getParameter("empRole"));
      
      String qry = "insert into emp values(?,?,?,?,?,?)";
     
      //db code for displaying all record
      try{
    	  Class.forName("com.mysql.jdbc.Driver");
    	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
    	  PreparedStatement sta = con.prepareStatement(qry);
    	  sta.setInt(1, 0);
    	  sta.setString(2, name);
    	  sta.setString(3, mobile);
    	  sta.setString(4, pass);
    	  sta.setString(5, role);
    	  sta.setInt(6, 0);
    	  
    	  sta.executeUpdate();
    	 
    	 
    	 
    %>
       
       <jsp:include page="hr.jsp"></jsp:include>
            
   <%
      }catch(Exception e){
    	  out.print(e);
      }
   
   %>
     
</body>
</html>