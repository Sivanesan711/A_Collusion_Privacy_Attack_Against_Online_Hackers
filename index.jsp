<%-- 
    Document   : index
    Created on : Feb 21, 2020, 3:44:47 PM
    Author     : admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/ionicons.min.css" />
    	<link rel="stylesheet" href="css/font-awesome.min.css" />
    	<!--Google Webfont-->
		<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,300italic,400italic,500,500italic,600,600italic,700' rel='stylesheet' type='text/css'>
    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="images/fav.png"/>
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
          
        
        
        %>
        <section id="banner">
			<div class="container">
		        <!-- Sign Up Form
		        ================================================= -->
        		<div class="sign-up-form">
					<a href="index.html" class="logo"><img src="images/logo.png" alt="Friend Finder"/></a>
					<h2 class="text-white">Find My Friends</h2>
					<div class="line-divider"></div>
					<div class="form-wrapper">
						<p class="signup-text">SIGN IN now and meet awesome people around the world</p>
						<form action="login.jsp">
							<fieldset class="form-group">
                                                            <input type="text" required="" class="form-control" id="example-name"  name="mail" placeholder="Enter Mail">
							</fieldset>
							<fieldset class="form-group">
                                                            <input type="password" required=""class="form-control" id="example-password"  name="password" placeholder="Enter a password">
							</fieldset>
						
						<p>By signning up you agree to the terms</p>
						<button class="btn-secondary">SIGN IN</button>
                                                </form>
					</div>
                                        <a href="register.html">NewUser SIGN UP</a><br><br><a href="admin.html">Admin</a>
					<img class="form-shadow" src="images/bottom-shadow.png" alt="" />
				</div><!-- Sign Up Form End -->
			</div>
		</section>
    <!-- Scripts
    ================================================= -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.appear.min.js"></script>
	<script src="js/jquery.incremental-counter.js"></script>
    <script src="js/script.js"></script>  
    <%
        }
}}
catch(Exception ex)
{
out.print( ex );
}
%>
    </body>
</html>
