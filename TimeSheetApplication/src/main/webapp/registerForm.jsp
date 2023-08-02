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
   <h1><center>Registration</center></h1>
    
    <form action="register1.jsp"> 
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
</body>
</html>