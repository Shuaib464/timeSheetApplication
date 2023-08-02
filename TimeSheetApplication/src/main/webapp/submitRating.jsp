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
        System.out.println("in rating submission page.....");
     String rating = request.getParameter("rating");
     System.out.println(rating+".....");
     int r = Integer.parseInt(rating);
     int taskId = Integer.parseInt(request.getParameter("taskid"));
     String qry = "UPDATE task SET rating=? WHERE taskId=?";
     try{
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
    	 PreparedStatement sta = con.prepareStatement(qry);
    	 sta.setInt(1, r);
    	 sta.setInt(2, taskId);
    	 sta.executeUpdate();
    	 System.out.println("rating submission done...");
    	 
    	%>
    	 <script>
    	    alert("rating submitted successfully");
    	 </script>
    	 <jsp:include page="viewManagerEmp.jsp"></jsp:include>    	
    	<%
     } catch(Exception e){
    	 out.println(e);
     }
     %>
</body>
</html>