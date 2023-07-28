<%@page contentType="text/html" pageEncoding="UTF-8"%> <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>Validate</title>
    </head>
    <body>
        <%
            String user=request.getParameter("name");
            String pass=request.getParameter("pass");
            session.setAttribute("SESSION_NAME", user);
            session.setAttribute("SESSION_PASS", pass);
        %>
        <%@page import="java.lang.*" %>
        <%@page import="java.io.*" %>
        <%@page import="java.sql.*" %>
        <%
            response.setContentType("text/html");
            int f=0;
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agriculture","root","root");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from farmer where uname='"+user+"' AND pass='"+pass+"'");
                while(rs.next()){
                if(user.equals(rs.getString(2)))
                {
                    f=1;
                    response.sendRedirect("interface2.html");
                }
            }
                if(f==0){
                       response.sendRedirect("login.jsp");
                        }
            con.close();
            }
            catch(Exception e)
            {
                out.println("Error:"+e.getMessage());
            }
        %>
    </body>
</html>