<%-- 
    Document   : publish
    Created on : Feb 7, 2020, 3:46:31 PM
    Author     : Admin
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
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
	String file = null,  caption= null;
	File file1 = null;
	FileInputStream fs = null, fs1 = null;
         HttpSession ses=request.getSession();
         String id=ses.getAttribute("id").toString();
         String name=ses.getAttribute("name").toString();
	try {
		MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
		Enumeration params = multi.getParameterNames();
		while (params.hasMoreElements())
                {
			paramname = (String) params.nextElement();
                  
                      if (paramname.equalsIgnoreCase("caption")) {
				caption = multi.getParameter(paramname);
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
       PreparedStatement ps=con.prepareStatement("insert into post(caption,image,id,name)values(?,?,?,?)");
            Statement stmt=con.createStatement();
				 {
				
					
					
                                        ps.setString(1, caption);
                                         ps.setString(3, id);
                                         ps.setString(4, name);
					 if (f == 1) {
						fs1 = (FileInputStream) list.get(0);
						ps.setBinaryStream(2, fs1, fs1.available());
					}
					int x = ps.executeUpdate();
					if (x > 0) {
						 %>
            <script>
                
                window.location.replace("home.jsp");
            </script>
            <%
	}
                                        else {
						 %>
            <script>
                alert("Something Went Worng");
                window.location.replace("home.jsp");
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
