<%-- 
    Document   : bookingReport
    Created on : 20 Feb 2015, 9:40:08 AM
    Author     : livhu
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Webstyle.css" rel="stylesheet" type="text/css" />
         
    </head>
    <body>
             
        <div class="style"><img src="tsc.jpg" width="382" height="132" alt="hj"/></div>
<%
if(request.getParameter("logout")!=null){
    request.getSession().removeAttribute("user");
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
        HttpSession hp=request.getSession(true);
        hp.setAttribute("user", request.getParameter("user"));
       %> 
       <form>
           Welcome:<% out.print(hp.getAttribute("user")); %> <input type="submit" name="logout" value="Logout"/>
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
    <td><div class="libu"><a href="Contacts us.html"/>Contact us</a></div></td>
     <td><div class="libu"><a href="index.html"/>Logout</a></div></td>
        </tr>
    </table>
</div>
    <hr/>
    <center>
        <table>
            <thead>ASSET USAGE REPORT</thead>
        <%
       String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
           String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
            
             Statement st=con.createStatement();
            ResultSet executeQuery = st.executeQuery("select  NAME,SURNAME,EMAIL"
                    + ",DESCRIPTION,AVAILABLILITY from booking,employee,asset "
                    + "where employee.EMP_ID = booking.EMP_ID  "
                    + "and booking.ASSET_ID= asset.ASSET_ID");
            ResultSetMetaData hd=executeQuery.getMetaData();
          out.print("<tr class=\"jph\">"+"<th>"+ hd.getColumnName(1)+"</th>"
                      +"<th>"+hd.getColumnName(2)+"</th>"
                      +"<th>"+hd.getColumnName(3)+"</th>"
                      +"<th>"+hd.getColumnName(4)+"</th>"
                      + "<th>"+hd.getColumnName(5)+"</th>"
                                           
                      + "</tr>");
            while(executeQuery.next()){
              out.print("<tr class=\"jph\">"+"<td>"+executeQuery.getString(1)+"</td>"
                      +"<td>"+executeQuery.getString(2)+"</td>"
                      +"<td>"+executeQuery.getString(3)+"</td>"
                      +"<td>"+executeQuery.getString(4)+"</td>"
                      + "<td>"+executeQuery.getString(5)+"</td>"                    
                      + "</tr>");
             
          }
          
          con.close();
          %>
    </table>
    </center>
   
    </body>
</html>
