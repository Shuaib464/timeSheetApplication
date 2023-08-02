<%@ page import="javax.servlet.*" %>
<%@page import="java.sql.*"%>
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
      String mob = request.getParameter("empMob");
      String pass = request.getParameter("empPass");
     System.out.println(mob);
      
      try{
    	  String qry = "select * from emp where mobile=? AND password=?";
    	  Class.forName("com.mysql.jdbc.Driver");
    	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
    	  PreparedStatement sta = con.prepareStatement(qry);
    	  sta.setString(1, mob);
    	  sta.setString(2, pass);
    	  
    	  ResultSet rs = sta.executeQuery();
    	  
    	  if(rs.next()){
    		  if(rs.getInt(5)==1){
    			session.setAttribute("userId", rs.getInt(1));
    		  %>
    		   <jsp:include page="adminProfile.jsp"></jsp:include>
    		  <%
    		 } else if(rs.getInt(5)==2){
    			 
    			System.out.println("in login....");
    			System.out.println("userId -"+rs.getInt(1));
    			session.setAttribute("userId", rs.getInt(1));
    			String q = "select count(registeredBy) from emp where registeredBy=?";
    			System.out.println("hii..");
    	    	sta = con.prepareStatement(q);
    	    	//sta.setString(1, "registeredBy");
    	    	sta.setInt(1, rs.getInt(1));
    	    	
    	    	ResultSet rs1 = sta.executeQuery();
    	    	if(rs1.next()){
    	    		System.out.println("count value-: "+rs1.getInt(1));
        			session.setAttribute("empCount", rs1.getInt(1));
    	    	}
    	    	
    			 %>
    			 <jsp:include page="managerProfile.jsp"></jsp:include>
    			<%
    		 } else if(rs.getInt(5)==3){
    			 session.setAttribute("userId", rs.getInt(1));
    			 %>
    			 <jsp:include page="empProfile.jsp"></jsp:include>
    			 <%
    		 }
    	  } else{
    		  %>
    		    <script>
    		         alert("incorrect pass");
    		    </script>
    		    <jsp:include page="loginForm.jsp"></jsp:include>
    		  <%
    	  }
      } catch(Exception e){
    	  out.println(e);
      } 
   
   
   
   %> 
</body>
</html>