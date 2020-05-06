
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="databaseconnection.EncryptUtils"%>
<html>
    <head>
       <title>Eiser ecommerce</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.css" />
  <link rel="stylesheet" href="vendors/linericon/style.css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" />
  <link rel="stylesheet" href="css/themify-icons.css" />
  <link rel="stylesheet" href="css/flaticon.css" />
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
  <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css" />
  <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
  <link rel="stylesheet" href="vendors/animate-css/animate.css" />
  <link rel="stylesheet" href="vendors/jquery-ui/jquery-ui.css" />
  <!-- main css -->
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/responsive.css" />
  <style>
      .register{
          width: 350px;
          height:500px;
          background: rgba(0,0,0,0.5);
          position: absolute;
          left: 70px;
          top: 50px;
      }
      input
      {
          background-color:  inherit;
      }
      ::placeholder {
          text-align: center;
  color: whitesmoke;
  opacity: 1;}
     input[type="submit"] {
         background-color:green;
          text-align: center;
  color: whitesmoke;
  opacity: 1;}
     button{
        background: #000\9;
     }
      
  </style>
    </head>
    <body>
       <header class="header_area">
    <div class="top_menu">
      <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <div class="float-left">
              <p>Phone: +01 256 25 235</p>
              <p>email: info@eiser.com</p>
            </div>
          </div>
           <div class="col-lg-5">
            <div class="float-right">
              <ul class="right_side">
                <li>
                  <a href="ahome.jsp">
                    home
                  </a>
                </li>
                <li>
                  <a href="viewpublisher.jsp">
                    publisher's
                  </a>
                </li>
                <li>
                  <a href="viewuser.jsp">
                    user's
                  </a>
                </li>
                <li>
                  <a href="product.html">
                   product's
                  </a>
                </li>
                
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="main_menu">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light w-100">
          <!-- Brand and toggle get grouped for better mobile display -->
          <a class="navbar-brand logo_h" href="home.html">
            <img src="img/logo.png" alt="" />
          </a>
         
          <!-- Collect the nav links, forms, and other content for toggling -->
         
          </div>
       
      </div>
   
  </header>
  <!--================Header Menu Area =================-->

  <!--================Home Banner Area =================-->
   <section class="feature_product_area section_gap_bottom_custom">
     
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h2><span>Status Of Product's</span></h2>
            <div class="row">
            <table>
      <%
try
{

 Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping" ,"root","root");    
 PreparedStatement pst = conn.prepareStatement("Select * from product ");
ResultSet rs=pst.executeQuery();
String companyname="",pname="",details="",price="", ii="",status="";
 int i=0;
while(rs.next())
{

        
        companyname=rs.getString("companyname"); 
        pname= rs.getString("pname"); 
        details=rs.getString("details"); 
        price=rs.getString("price"); 
        status=rs.getString("status");
        ii=rs.getString("id");
        i=Integer.parseInt(ii);
        String name=EncryptUtils.base64encode(companyname);
        String pp=EncryptUtils.base64encode(price);
 
%>
 
              <div class="col-lg-4 col-md-6">
          <div class="single-product">
            <div class="product-img">
                <a href="checkout.html"> <img class="img-fluid w-100 h-200" src="images.jsp?id=<%=ii%>" alt="" /></a>
              <div class="p_icon">
                 <a href="checkout.html">
                  <i class="ti-shopping-cart"></i>
                  </a>
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                  <h4><%=name%></h4>
                <h4> <%=pname%></h4>
                <p>(<%=details%>)</p>
              </a>
              <div class="mt-3">
                <span class="mr-4">$ <%=pp%></span>
                <span class="mr-4"> <%=status%> </span>
                <a href="approvel.jsp?id=<%=i%>&&status=approved">approve</a>/
                 <a href="approvel.jsp?id=<%=i%>&&status=cancel">cancel</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
       
    <%

}
%>
    </table>
    <%
    rs.close();
    pst.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>
          </div>
        </div>
      </div>
    </div>
</section>
           <footer class="footer-area section_gap">
    <div class="container">
      <div class="row">
        <div class="col-lg-2 col-md-6 single-footer-widget">
          <h4>Top Products</h4>
          <ul>
            <li><a href="#">Managed Website</a></li>
            <li><a href="#">Manage Reputation</a></li>
            <li><a href="#">Power Tools</a></li>
            <li><a href="#">Marketing Service</a></li>
          </ul>
        </div>
        <div class="col-lg-2 col-md-6 single-footer-widget">
          <h4>Quick Links</h4>
          <ul>
            <li><a href="#">Jobs</a></li>
            <li><a href="#">Brand Assets</a></li>
            <li><a href="#">Investor Relations</a></li>
            <li><a href="#">Terms of Service</a></li>
          </ul>
        </div>
        <div class="col-lg-2 col-md-6 single-footer-widget">
          <h4>Features</h4>
          <ul>
            <li><a href="#">Jobs</a></li>
            <li><a href="#">Brand Assets</a></li>
            <li><a href="#">Investor Relations</a></li>
            <li><a href="#">Terms of Service</a></li>
          </ul>
        </div>
        <div class="col-lg-2 col-md-6 single-footer-widget">
          <h4>Resources</h4>
          <ul>
            <li><a href="#">Guides</a></li>
            <li><a href="#">Research</a></li>
            <li><a href="#">Experts</a></li>
            <li><a href="#">Agencies</a></li>
          </ul>
        </div>
        <div class="col-lg-4 col-md-6 single-footer-widget">
          <h4>Newsletter</h4>
          <p>You can trust us. we only send promo offers,</p>
          <div class="form-wrap" id="mc_embed_signup">
            <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
              method="get" class="form-inline">
              <input class="form-control" name="EMAIL" placeholder="Your Email Address" onfocus="this.placeholder = ''"
                onblur="this.placeholder = 'Your Email Address '" required="" type="email">
              <button class="click-btn btn btn-default">Subscribe</button>
              <div style="position: absolute; left: -5000px;">
                <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
              </div>

              <div class="info"></div>
            </form>
          </div>
        </div>
      </div>
      <div class="footer-bottom row align-items-center">
        <p class="footer-text m-0 col-lg-8 col-md-12"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by developer</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        <div class="col-lg-4 col-md-12 footer-social">
          <a href="#"><i class="fa fa-facebook"></i></a>
          <a href="#"><i class="fa fa-twitter"></i></a>
          <a href="#"><i class="fa fa-dribbble"></i></a>
          <a href="#"><i class="fa fa-behance"></i></a>
        </div>
      </div>
    </div>
  </footer>
    </body>
</html>
