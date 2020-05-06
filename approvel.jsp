<%-- 
    Document   : approvel
    Created on : Feb 3, 2020, 4:04:48 PM
    Author     : Admin
--%>

< %@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

      
<%
    
    String id=request.getParameter("id");
    String status=request.getParameter("status");
    Class.forName("com.mysql.jdbc.Driver");
    Connection app=DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia","root","root");
    
    if(status.equalsIgnoreCase("approved"))
    {   System.out.print(id+status);
        PreparedStatement ps=app.prepareStatement("update post set status='Approved' where id='"+id+"'");
        ps.executeUpdate();
    }
    else if (status.equalsIgnoreCase("cancel"))
    {
        PreparedStatement ps=app.prepareStatement("update post set status='Cancel' where id='"+id+"'");
        ps.executeUpdate();
    }
    
    response.sendRedirect("approvel.jsp");
%>
   
