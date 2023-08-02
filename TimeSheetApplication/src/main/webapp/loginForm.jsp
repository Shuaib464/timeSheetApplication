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
 input[type=submit], input[type=reset] {
  background-color: #04AA6D;
  border: none;
  color: white;
  padding: 15px 30px;
  border-radius: 8px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>
    <h1><center>Login Page</center></h1>
    <form action="login.jsp">
     <table>
       
        <tr><td> Mobile -: <input type="text" name="empMob"> </td></tr>
        <tr><td> Password -: <input type="password" name="empPass"></td></tr>
        <tr><td><input type="submit" value="login"></td></tr>
       
       
    </table>
   </form>
</body>
</html>