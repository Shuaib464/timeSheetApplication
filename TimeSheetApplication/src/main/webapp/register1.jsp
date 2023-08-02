<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
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
     System.out.println("in register1...");
      String name = request.getParameter("empName");
      String mobile = request.getParameter("empMob");
      String pass = request.getParameter("empPass");
      String role = (request.getParameter("empRole"));
     // int counter = (int)(request.getAttribute("count"));
    //  System.out.println(request.getAttribute("count"));
      String qry = "insert into emp values(?,?,?,?,?,?)";
      int userId = (int)session.getAttribute("userId"); 
      //db code for registering a user
      try{
    	  Class.forName("com.mysql.jdbc.Driver");
    	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
    	  PreparedStatement sta = con.prepareStatement(qry);
    	  sta.setInt(1, 0);
    	  sta.setString(2, name);
    	  sta.setString(3, mobile);
    	  sta.setString(4, pass);
    	  sta.setString(5, role);
   
    	  sta.setInt(6, userId);
    	  
    	  sta.executeUpdate();
    	 
    	  if(role.equals("2") ){
    		  %>
  		    <jsp:include page="adminProfile.jsp"></jsp:include>
  		  <%
    	  } else if(role.equals("3")){
    		  System.out.println("enter condtion in register 1");
    		 
    		// int id = (int)session.getAttribute("userId");
    		 int counter = (int)session.getAttribute("empCount");
    		 System.out.println(userId +" i d");
    		 System.out.println(counter +" - counter");
    		  
    		 /*
    		  sta = con.prepareStatement("update emp set counter = ? where id = ? ");
    		  sta.setInt(1, (counter+1));
    		  sta.setInt(2, id);
    		  sta.executeUpdate();
    		  */
    		  System.out.println("counter query executed");
    		  session.removeAttribute("empCount");
    		  System.out.println("counter value removed");
    		  session.setAttribute("empCount", counter+1);
    		  System.out.println("new counter value is -:"+session.getAttribute("empCount"));
    		  %>
  		    <jsp:include page="managerProfile.jsp"></jsp:include>
  		  <%
    	  }
    	 
    	        
      }catch(Exception e){
    	  out.print(e);
      }
   
   %>
</body>
</html>