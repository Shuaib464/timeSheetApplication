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
     //fetching emp id
     int id =Integer.parseInt (request.getParameter("id"));
     System.out.println("eId -: "+id);
    // <tr><td> Description -: <textarea rows="3" cols="15" name="desc"></textarea> </td></tr>
     session.setAttribute("empId", id);
     System.out.println(session.getAttribute("empId"));
    %>


     <!-- form for assigning task -->
    <h1><center>Assign Task</center></h1>
    
    <form action="assignTask.jsp"> 
      <table>
        
            <tr><td> Project Name-: <input type="text" name="projectName"> </td></tr>
           
            <tr><td> Task-: <input type="text" name="task"> </td></tr>
           
            <tr><td> <input type="submit" value="assign"></td> </tr>
        
    </table>
   </form>
</body>
</html>