<%-- 
    Document   : login
    Created on : Jan 24, 2020, 6:17:52 PM
    Author     : Admin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           
       int totalAttempts = 3;
             
        String mail = request.getParameter("mail");  
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
        PreparedStatement pst = conn.prepareStatement("Select * from admin where mail=? and password=?");
        pst.setString(1, mail);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery(); 
         if (totalAttempts != 0) {
        if(rs.next()) 
        {      
            
            %>
            
            <script>
             alert("Login Successful")
             window.location.replace("ahome.jsp");
            </script>
     <%  
        }
       
        else{
              totalAttempts--;
              %>
       <script>
           alert("invalid user")
            window.location.replace("index.jsp");
       </script>
       
             
         
           <% }}
        %>
    </body>
</html>
