<%-- 
    Document   : register
    Created on : Jan 24, 2020, 5:49:46 PM
    Author     : Admin
--%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList list = new ArrayList();
	ServletContext context = getServletContext();
	String dirName =context.getRealPath("profile\\");
	String paramname = null;
	String name = null, mail = null, phone = null, age = null, city = null, password= null, file= null;
	File file1 = null;
	FileInputStream fs = null, fs1 = null;
	try {
		MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
		Enumeration params = multi.getParameterNames();
		while (params.hasMoreElements())
                {
			paramname = (String) params.nextElement();
                  
                      if (paramname.equalsIgnoreCase("name")) {
				name = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("mail")) {
				mail = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("phone")) {
				phone = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("age")) {
				age = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("city")) {
				city = multi.getParameter(paramname);
			}
                        if (paramname.equalsIgnoreCase("password")) {
				password = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("file")) {
				file = multi.getParameter(paramname);
			}
			
		}
		int f = 0;
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) 
                {
			paramname = (String) files.nextElement();
			if (paramname.equals("d1")) {
				paramname = null;
			}

			if (paramname != null)
                        {
				f = 1;
				file = multi.getFilesystemName(paramname);
				String fPath = context.getRealPath("profile\\" + file);
				file1 = new File(fPath);
				fs = new FileInputStream(file1);
				list.add(fs);
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia", "root", "root");
       PreparedStatement ps=con.prepareStatement("insert into registration(name,mail,phone,age,city,password,image)values(?,?,?,?,?,?,?)");
            Statement stmt=con.createStatement();
				 {
				
					
					ps.setString(1, name);
					ps.setString(2, mail);
					ps.setString(3, phone);
					ps.setString(4, age);
                                        ps.setString(5, city);
                                        ps.setString(6, password);
					 if (f == 1) {
						fs1 = (FileInputStream) list.get(0);
						ps.setBinaryStream(7, fs1, fs1.available());
					}
					int x = ps.executeUpdate();
					if (x > 0) {
						 %>
            <script>
                
                window.location.replace("index.jsp");
            </script>
            <%
	}
                                        else {
						 %>
            <script>
                alert("Something Went Worng");
                window.location.replace("register.html");
            </script>
            <%
	}

				}

			}
		}

	} 
        catch (Exception e) {
		e.printStackTrace();
		out.print(e.getMessage());
                {
						 %>
<!--            <script>
                alert("Product Added Successful");
                window.location.replace("phome.jsp");
            </script>-->
            <%
	}
	}
%>

    </body>
</html>
