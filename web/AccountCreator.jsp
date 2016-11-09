<%-- 
    Document   : AccountCreator
    Created on : 19 Feb 2015, 10:05:36 PM
    Author     : livhu
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account creator:<% out.println(request.getParameter("astid")); %></title>
            <link href="Webstyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
          <div class="style"><img src="tsc.jpg" width="382" height="132" alt="hj"/></div>
<%
    
    HttpSession hp=request.getSession(true);
     String emp=hp.getAttribute("EMPID").toString();
     
if(request.getParameter("logout")!=null){
    request.getSession().removeAttribute("user");
    request.getSession().removeAttribute("EMPID");
}
%>
<div class="head">
    <%
    if((request.getParameter("log")==null)&request.getSession().getValue("user")==null){
    %>
<form method="get" >
<input type="text" name="user"  maxlength="150" value="" placeholder="Username"/>
<input type="password" name="pass"  maxlength="150" value="" placeholder="Password"/>
<input name="log" type="submit" value="Login"/> 
</form>

 <% }
    else if(request.getSession().getValue("user")!=null){%>
    <form>
           Welcome:<% out.print(request.getSession().getValue("user")); %> <input type="submit" name="logout" value="Logout"/>
       </form> 

    <%
    }
    else if((request.getParameter("user").equals("user") && request.getParameter("pass").equals("1234"))){
        
        hp.setAttribute("user", request.getParameter("user"));
       %> 
       <form>
           Welcome:<% out.print(hp.getAttribute("user")); 
           emp=hp.getAttribute("EMPID").toString();
           %> <input type="submit" name="logout" value="Logout"/>
       </form>   
   
    <%
    }
    else{
   out.println("logic loading");
    }
    %>
</div>

<hr/> 
<div >
    <table> <tr>
    <td><div class="libu"><a href="index.jsp"/>Home page</a></div></td>
    <td><div class="libu"><a href="Dasboard.jsp"/>Report</a></div></td>
    <td><div class="libu"><a href="EmpAssets.jsp"/>Database</a></div></td>
    <td><div class="libu"><a href="RegisterEMP.jsp"/>Register</a></div></td>
    <td><div class="libu"><a href="contactPage.html"/>Contact us</a></div></td>
    <td><div class="libu"><a href="index.html"/>Logout</a></div></td>
        </tr>
    </table>
</div>
<hr/>  
        
        
        <center>
        <form>
            <input type="hidden" name="empid" value="<% out.println(request.getParameter("astid").toString()); %>"/>
            
            <table>
        
       <%
    if(request.getParameter("send")!=null){
       String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
            String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
           System.out.println(con);
               Statement st=con.createStatement();
               System.out.println("Connecting to STATEMENT");
               st.executeUpdate("INSERT INTO users (USERNAME, PASSWORD, EMP_ID,DEPARTMENTS) VALUES ('"+request.getParameter("user").toString()+"', '"+request.getParameter("pass").toString()+"','"+request.getParameter("empid").toString()+"','"+request.getParameter("dep").toString()+"')");
             con.close();
             out.println("<tr><td colspan=\"2\"><div>New user created </div></td</tr>");
    }
             
             
       %>
        
        
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="user"  /></td>
                   
                </tr>
                <tr>
                    <td>password:</td>
                    <td><input type="password" name="pass"  /></td>
                </tr>
                <tr>
                    <td>User type:</td>
                    <td><input type="text" name="dep"/></td>
                </tr>
          
                <tr>
                    <td><input type="submit" name="send" value="Create user"/></td>
                    <td><input type="reset" value="clear"/></td>
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>
