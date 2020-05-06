<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
	<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="This is social network html5 template available in themeforest......" />
		<meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
		<meta name="robots" content="index, follow" />
		<title>News Feed | Check what your friends are doing</title>

    <!-- Stylesheets
    ================================================= -->
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/ionicons.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link href="css/emoji.css" rel="stylesheet">
    <!--Google Webfont-->
		<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,300italic,400italic,500,500italic,600,600italic,700' rel='stylesheet' type='text/css'>
    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="images/fav.png"/>
	</head>
  <body>

    <!-- Header
    ================================================= -->
		<header id="header">
      <nav class="navbar navbar-default navbar-fixed-top menu">
        <div class="container">

          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
         
            <a class="navbar-brand" href="#"><img src="images/logo.png" alt="logo" /></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right main-menu">
              <li class="dropdown"><a href="timeline-about.jsp">About</a></li>
              <li class="dropdown"><a href="newsfeed-messages.html">Chatroom</a></li>
              <li class="dropdown"><a href="contact.html">Contact</a></li>
              <li class="dropdown"><a href="index.jsp">logout</a></li>
            </ul>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
      </nav>
    </header>
    <!--Header End-->

    <div id="page-contents">
    	<div class="container">
    		<div class="row">
                    <div class="col-md-3 static">
            <div class="profile-card">
<%
    HttpSession ses=request.getSession();
String name=ses.getAttribute("name").toString();
String id=ses.getAttribute("id").toString();

%>
	
            	<img src="images.jsp?id=<%=id%>" alt="user" class="profile-photo" />
            	<h5><a href="timeline.html" class="text-white"><%=name%></a></h5>
            	<a href="#" class="text-white"><i class="ion ion-android-person-add"></i> 1,299 followers</a>
             </div><!--profile card ends-->
            <ul class="nav-news-feed">
              <li><i class="icon ion-ios-paper"></i><div><a href="newsfeed.html">My Newsfeed</a></div></li>
              <li><i class="icon ion-ios-people"></i><div><a href="newsfeed-people-nearby.html">People Nearby</a></div></li>
              <li><i class="icon ion-ios-people-outline"></i><div><a href="newsfeed-friends.html">Friends</a></div></li>
              <li><i class="icon ion-chatboxes"></i><div><a href="newsfeed-messages.html">Messages</a></div></li>
              <li><i class="icon ion-images"></i><div><a href="newsfeed-images.html">Images</a></div></li>
<!--              <li><i class="icon ion-ios-videocam"></i><div><a href="newsfeed-videos.html">Videos</a></div></li>-->
            </ul><!--news-feed links ends-->
            <div id="chat-block">
              <div class="title">Chat online</div>
              <ul class="online-users list-inline">
              <%
          Class.forName("com.mysql.jdbc.Driver");
  Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
 PreparedStatement t = co.prepareStatement("Select name,id from registration");
ResultSet s=t.executeQuery();
String iiii="",cname="";
 
while(s.next())
{
     
      iiii=s.getString("id");
      cname=s.getString("name");
      

          %>
            
                <li><a href="newsfeed-messages.html" title="Linda Lohan"><img src="images3.jsp?id=<%= iiii%>" alt="user" class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
             <% } %> </ul>
            </div><!--chat block ends-->
          </div>
    			<div class="col-md-7">

            <!-- Post Create Box
            ================================================= -->
            <div class="create-post">
            	<div class="row">
                                        <form action="publish.jsp" enctype="multipart/form-data" method="post">

            		<div class="col-md-7 col-sm-7">
                  <div class="form-group">
                    <img src="images.jsp?id=<%=id%>" alt="" class="profile-photo-md" />
                    <textarea name="caption" id="exampleTextarea" cols="30" rows="1" class="form-control" placeholder="Write Your Caption......"></textarea>
                  </div>
                    
                    
                </div>
                    
            		<div class="col-md-5 col-sm-5">
                   <div class="tools">
                    <ul class="publishing-tools list-inline">
                        
                      <li><i class="ion-images"></i><input type="file" name="file" required=""></li>
                     
                    </ul>
                        <button class="btn btn-primary pull-right">Publish</button>
                  </form>
                  </div>
                </div>
            	</div>
                     
            </div> 
             <%
Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
 PreparedStatement pst = conn.prepareStatement("Select * from post where status='Approved'");
ResultSet rs=pst.executeQuery();
String name1="",caption="",ii="";
 int i=0;
while(rs.next())
{
      name1=rs.getString("name");
      caption=rs.getString("caption");
        ii=rs.getString("id");

%>

            <!-- Post Content
            ================================================= -->
            <div class="post-content">
              <img src="images2.jsp?id=<%=ii%>" alt="post-image" class="img-responsive post-image" />
              <div class="post-container">
                <img  src="images.jsp?id=<%=id%>" alt="user" class="profile-photo-md pull-left" />
                <div class="post-detail">
                  <div class="user-info">
                    <h5><a href="timeline.html" class="profile-link"><%=name1%></a> <span class="following">following</span></h5>
                    <p class="text-muted">Published a photo about 3 mins ago</p>
                  </div>
                  <div class="reaction">
                    <a class="btn text-green"><i class="icon ion-thumbsup"></i> 13</a>
                    <a class="btn text-red"><i class="fa fa-thumbs-down"></i> 0</a>
                  </div>
                  <div class="line-divider"></div>
                  <div class="post-text">
                      <p><%=caption%></p>
                  </div>
                  <div class="line-divider"></div>
                  <div class="post-comment">
                    <img src="images/users/user-11.jpg" alt="" class="profile-photo-sm" />
                    <p><a href="timeline.html" class="profile-link"><%=cname%> </a><i class="em em-laughing"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud </p>
                  </div>
                  <div class="post-comment">
                    <img src="images/users/user-4.jpg" alt="" class="profile-photo-sm" />
                    <p><a href="timeline.html" class="profile-link">John</a> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud </p>
                  </div>
                  <div class="post-comment">
                    <img src="images.jsp?id=<%=id%>" alt="" class="profile-photo-sm" />
                    <input type="text" class="form-control" placeholder="Post a comment">
                  </div>
                </div>
              </div>
            </div>
<% } %>
            
            <!-- Post Content
            ================================================= -->
            <div class="post-content">
              <img src="images2.jsp" alt="" class="img-responsive post-image" />
              <div class="post-container">
                <img src="images/users/user-9.jpg" alt="user" class="profile-photo-md pull-left" />
                <div class="post-detail">
                  <div class="user-info">
                    <h5><a href="timeline.html" class="profile-link">Anna Young</a> <span class="following">following</span></h5>
                    <p class="text-muted">Published a photo about 4 hour ago</p>
                  </div>
                  <div class="reaction">
                    <a class="btn text-green"><i class="icon ion-thumbsup"></i> 2</a>
                    <a class="btn text-red"><i class="fa fa-thumbs-down"></i> 0</a>
                  </div>
                  <div class="line-divider"></div>
                  <div class="post-text">
                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>
                  </div>
                  <div class="line-divider"></div>
                  <div class="post-comment">
                    <img src="images/users/user-10.jpg" alt="" class="profile-photo-sm" />
                    <p><a href="timeline.html" class="profile-link">Julia </a>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.</p>
                  </div>
                  <div class="post-comment">
                    <img src="images.jsp?id=<%=id%>" alt="" class="profile-photo-sm" />
                    <input type="text" class="form-control" placeholder="Post a comment">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Newsfeed Common Side Bar Right
          ================================================= -->
          	<div class="col-md-2 static">
            <div class="suggestions" id="sticky-sidebar">
              <h4 class="grey">Who to Follow</h4>
          <%
          Class.forName("com.mysql.jdbc.Driver");
  Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
 PreparedStatement st = connn.prepareStatement("Select name,id from registration");
ResultSet rss=st.executeQuery();
String uname="",iii="";
 
while(rss.next())
{
      uname=rss.getString("name");
      iii=rss.getString("id");
      
          
          %>
    		
              <div class="follow-user">
                <img src="images3.jsp?id=<%=iii%>" alt="" class="profile-photo-sm pull-left" />
                <div>
                  <h5><a href="timeline.html"><%=uname%></a></h5>
                  <a href="#" class="text-green">Add friend</a>
                </div>
              </div>
               <%
} 
                  %>
              </div>
            </div>
          </div>
    		</div>
    	</div>
                 

    <!-- Footer
    ================================================= -->
    <footer id="footer">
      <div class="container">
      	<div class="row">
          <div class="footer-wrapper">
            <div class="col-md-3 col-sm-3">
              <a href=""><img src="images/logo-black.png" alt="" class="footer-logo" /></a>
              <ul class="list-inline social-icons">
              	<li><a href="#"><i class="icon ion-social-facebook"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-twitter"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-googleplus"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-pinterest"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-linkedin"></i></a></li>
              </ul>
            </div>
            <div class="col-md-2 col-sm-2">
              <h6>For individuals</h6>
              <ul class="footer-links">
                <li><a href="">Signup</a></li>
                <li><a href="">login</a></li>
                <li><a href="">Explore</a></li>
                <li><a href="">Finder app</a></li>
                <li><a href="">Features</a></li>
                <li><a href="">Language settings</a></li>
              </ul>
            </div>
            <div class="col-md-2 col-sm-2">
              <h6>For businesses</h6>
              <ul class="footer-links">
                <li><a href="">Business signup</a></li>
                <li><a href="">Business login</a></li>
                <li><a href="">Benefits</a></li>
                <li><a href="">Resources</a></li>
                <li><a href="">Advertise</a></li>
                <li><a href="">Setup</a></li>
              </ul>
            </div>
            <div class="col-md-2 col-sm-2">
              <h6>About</h6>
              <ul class="footer-links">
                <li><a href="">About us</a></li>
                <li><a href="">Contact us</a></li>
                <li><a href="">Privacy Policy</a></li>
                <li><a href="">Terms</a></li>
                <li><a href="">Help</a></li>
              </ul>
            </div>
            <div class="col-md-3 col-sm-3">
              <h6>Contact Us</h6>
                <ul class="contact">
                	<li><i class="icon ion-ios-telephone-outline"></i>+1 (234) 222 0754</li>
                	<li><i class="icon ion-ios-email-outline"></i>info@thunder-team.com</li>
                  <li><i class="icon ion-ios-location-outline"></i>228 Park Ave S NY, USA</li>
                </ul>
            </div>
          </div>
      	</div>
      </div>
      <div class="copyright">
        <p>Thunder Team © 2016. All rights reserved</p>
      </div>
		</footer>
    
    <!--preloader-->
    <div id="spinner-wrapper">
      <div class="spinner"></div>
    </div>
    
    <!-- Scripts
    ================================================= -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&callback=initMap"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky-kit.min.js"></script>
    <script src="js/jquery.scrollbar.min.js"></script>
    <script src="js/script.js"></script>
  </body>
</html>
