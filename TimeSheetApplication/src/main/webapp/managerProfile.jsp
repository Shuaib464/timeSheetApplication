<%@ page import="javax.servlet.*" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
</head>
<body>
   <%
   
   System.out.println("in mangager profile....");
  
   int id = (int)session.getAttribute("userId");
   System.out.println(id+" = id");
   int counter = (int)session.getAttribute("empCount");
   System.out.println(counter +" - count");
   
   %>

   <h1><center>Welcome Manager</center></h1>
   
   <%
    if(counter < 3){
    	%>
    	  <h3><a href="registerForm.jsp">Add Employee</a></h3>
    	<%
    } else{
    	%>
    	  <h3><a href="" onclick="myfunc()">Add Employeee</a></h3>
    	<%
    }
   %>
   
    <h3><a href="viewManagerEmp.jsp">view Registered Employees</a></h3>   
   
    <h2><a href="signOut.jsp" id="signOut">Sign out</a></h2>
    
   
   <script>
      function myfunc(){
    	  alert("Employee Limit exeeded");
      }
   </script>
      
   
   
</body>
</html>