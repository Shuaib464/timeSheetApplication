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
    Date d;
    
    int taskId =Integer.parseInt (request.getParameter("hid"));
    System.out.println("in save task page -: "+taskId);
    
    //fetching values from viewTask page
    String desc = request.getParameter("desc");
    String hours = request.getParameter("hours");
    String date =(request.getParameter("date"));
    System.out.println(date+" ....");
    if(date.isBlank()){
       	d = null;
    } else{
    	  d = Date.valueOf(date);
    }
   
    String remark = request.getParameter("remark");
    System.out.println("value fetched from the form..."+desc+" "+hours+" "+date+" "+remark);
    String qry = "UPDATE task SET description=?, completeHour=?, date=?, remark=? WHERE taskId=?";
   
    try{
   	 Class.forName("com.mysql.jdbc.Driver");
   	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheetapplication","root","55555");
   	 PreparedStatement sta = con.prepareStatement(qry);
   	 sta.setString(1, desc);
   	 sta.setString(2, hours);
   //	 sta.setString(3, date);
     sta.setDate(3, d);
   	 sta.setString(4, remark);
   	 
   	 sta.setInt(5, taskId);
   	 sta.executeUpdate();
   	 System.out.println("updation task query executed");
   	 %>
   	    <jsp:include page="empProfile.jsp"></jsp:include>
   	 <%
    } catch(Exception e){
    	out.println(e);
    }
    %>
</body>
</html>