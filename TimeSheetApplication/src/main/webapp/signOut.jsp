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
   // removing the session attributes
      session.removeAttribute("userId");
   
   %>
      <jsp:include page="loginForm.jsp"></jsp:include>
   
</body>
</html>