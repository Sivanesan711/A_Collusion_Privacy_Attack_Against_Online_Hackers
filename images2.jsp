<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    
int id =  Integer.parseInt(request.getParameter("id"));
  try{      
    Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia" ,"root","root");    
 PreparedStatement pst = conn.prepareStatement("Select image from post where id="+id );
   // String strQuery = "select imagew from image where id=+id ORDER BY ";
    ResultSet rs = pst.executeQuery();

    String imgLen="";
    if(rs.next()){
      imgLen = rs.getString(1);
       }  
    rs = pst.executeQuery();
    if(rs.next()){
      int len = imgLen.length();
      byte [] rb = new byte[len];
      InputStream readImg = rs.getBinaryStream(1);
      int index=readImg.read(rb, 0, len);  
      pst.close();
      response.reset();
      response.getOutputStream().write(rb,0,len); 
      response.getOutputStream().flush();        
    }
  }
  catch (Exception e){
    e.printStackTrace();
  }
%>

</body>
</html>