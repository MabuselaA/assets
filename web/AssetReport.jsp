<%-- 
    Document   : AssetReport
    Created on : 20 Feb 2015, 9:39:10 AM
    Author     : livhu
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    <td><div class="libu"><a href="contactPage.html"/>Contact us</a></div></td>
    <td><div class="libu"><a href="index.html"/>Logout</a></div></td>
        </tr>
    </table>
</div>
    <hr/>
    <center>
        
        <table>
            <tr> <thead>Asset Report</thead></tr>
            
            <%    
            String DB_URL1="jdbc:mysql://localhost:3306/tsc_assets";
           String USER1="jutu";
            String PASS1="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con1 = DriverManager.getConnection(DB_URL1, USER1, PASS1);
            
             Statement st1=con1.createStatement();
            ResultSet executeQuery1 = st1.executeQuery("SELECT * FROM asset");
            ResultSetMetaData hd1=executeQuery1.getMetaData();
          out.print("<tr class=\"jph\">"+"<th>"+ hd1.getColumnName(1)+"</th>"
                      +"<th>"+hd1.getColumnName(2)+"</th>"
                      +"<th>"+hd1.getColumnName(3)+"</th>"
                      +"<th>"+hd1.getColumnName(4)+"</th>"
                      + "<th>"+hd1.getColumnName(5)+"</th>"
                     
                      
                      + "</tr>");
            while(executeQuery1.next()){
              out.print("<tr class=\"jph\">"+"<td>"+executeQuery1.getString(1)+"</td>"
                      +"<td>"+executeQuery1.getString(2)+"</td>"
                      +"<td>"+executeQuery1.getString(3)+"</td>"
                      +"<td>"+executeQuery1.getString(4)+"</td>"
                      + "<td>"+executeQuery1.getString(5)+"</td>"      
                      + "</tr>");
             
          }
         
          con1.close();
          
            %>
            
        </table>
    </center>
    </body>
</html>
