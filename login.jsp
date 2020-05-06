<%-- 
    Document   : login
    Created on : Jan 24, 2020, 6:17:52 PM
    Author     : Admin
--%>

<%@page import="java.net.InetAddress"%>
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
            InetAddress i=InetAddress.getLocalHost();
           String ipaddress=i.getHostAddress(); String hostname=i.getHostName();
           try{
            Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
        PreparedStatement st = con.prepareStatement("Select * from hackers");
         ResultSet ch = st.executeQuery(); 
          if(ch.next())
          {
             int status1= ch.getInt("status");
          
            if(status1 >=3) 
            {
                response.sendRedirect("blocked.html");
            }
            else{
          
            
        String mail = request.getParameter("mail");  
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
        PreparedStatement pst = conn.prepareStatement("Select * from registration where mail=? and password=?");
        pst.setString(1, mail);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery(); 
         
        if(rs.next()) 
        {       HttpSession ses=request.getSession();
                String name=rs.getString("name");
                String id=rs.getString("id");
                ses.setAttribute("name", name);
                ses.setAttribute("id", id);
            %>
            <script>
             alert("Login Successful")
             window.location.replace("home.jsp");
            </script>
            <%  
        }
        
        else
          {
            
           
           PreparedStatement pstt = conn.prepareStatement("Select * from hackers where uname=? and ipaddress=?");
           pstt.setString(1, hostname);
           pstt.setString(2, ipaddress);
           ResultSet rss = pstt.executeQuery();
        if(rss.next()) 
        {  
int Status=rss.getInt("status");
int add=Status+1;


            
           PreparedStatement up = conn.prepareStatement("update hackers set  status=?");
                             up.setInt(1,add);
                             up.executeUpdate();
        }
       else
         {
           PreparedStatement in = conn.prepareStatement("insert into hackers(uname,ipaddress) values(?,?) ");
                             in.setString(1, hostname);
                             in.setString(2, ipaddress);
                             in.executeUpdate();
         }
           %>
       <script>
           alert("invalid user")
            window.location.replace("index.jsp");
       </script>
       
             
         
           <% }}}}
catch(Exception ex)
{
  out.print(ex);
}
        %>
    </body>
</html>
