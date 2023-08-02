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
   System.out.println("in assign task...");
   String project = request.getParameter("projectName");
  // String description = request.getParameter("desc");
   String empTask = request.getParameter("task");
   int empId = (int)session.getAttribute("empId");
    System.out.println("emp Id-:"+empId);
  System.out.println(session.getAttribute("empId"));
   
   String qry = "insert into task (taskId, project, task, empId) values(?,?,?,?)";
   
   //db code for inserting assign task values
   
   try{
	   Class.forName("com.mysql.jdbc.Driver");
 	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
 	  PreparedStatement sta = con.prepareStatement(qry);
 	  sta.setInt(1, 0);
 	  sta.setString(2, project);
 //	  sta.setString(3, description);
 	  sta.setString(3, empTask);
 	  sta.setInt(4, empId);
 	  sta.executeUpdate();
 	  System.out.println("insert query executed");
   } catch(Exception e){
	   out.println(e);
   }
   
   %>
   <jsp:include page="managerProfile.jsp"></jsp:include>
</body>
</html>