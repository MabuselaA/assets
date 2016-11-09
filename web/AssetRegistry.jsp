<%-- 
    Document   : AssetRegistry
    Created on : 18 Feb 2015, 11:37:41 AM
    Author     : livhu
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <%
     if(request.getParameter("chk")!=null){
            String [] chk= request.getParameterValues("out");
            StringBuilder sb = new StringBuilder();
            for(String str:chk)
            System.out.println(sb.append("out="+str));
            response.sendRedirect("http://localhost:8080/UbuntuDSS/Booking.jsp?"+sb.toString());
            
            }
     %>
     
      
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asset Registry</title>
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
    <table border="2"><tr>
                <td>
                    <div >
        <div class="libu">
            <a href="AssetRegistry.jsp" >Asset Registry</a>
        </div>
        <div class="libu">
       <a href="EmployeeRegistry.jsp" >Employee Registry</a>
        </div>
        <div class="libu">
        <a href="Booking.jsp" >Booking</a>
        </div>
        
        </div>
                </td>
            <td>  
        

                <form>
       <table border="0" cellpadding="2" cellspacing="0" rules="all" style="border:solid 1px">
            <%
            if(request.getParameter("delete")!=null){
              String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
           String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
               Statement st=con.createStatement();
String[] str = request.getParameterValues("out");
StringBuilder sb = new StringBuilder();
for(String vl:str){
sb.append("'"+vl+"'");
}
               st.executeUpdate("Delete from asset where ASSET_ID in("+sb.toString()+"");
             con.close();
            }
            %>
            
            
            }
            <%
            
            
            
            if(request.getParameter("upd")!=null){
              String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
            String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
               Statement st=con.createStatement();
               System.out.println(request.getParameter("atr0")+"ereerr");
               int i=st.executeUpdate("update asset set STATUS='"+request.getParameter("atr2")+"', AVAILABLILITY ='"+request.getParameter("atr4")+"', DESCRIPTION='"+request.getParameter("atr3")+"'where ASSET_ID='"+request.getParameter("atr0")+"'");
               System.out.println(i);
               con.close();
            }
            
            %>
        
            <%
            if(request.getParameter("Create")!=null){
              String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
               Statement st=con.createStatement();
               st.executeUpdate("INSERT INTO asset (ASSET_ID, SERIAL_NO, STATUS, DESCRIPTION, AVAILABLILITY,SERVICE_INTERVAL) "
                       + " VALUES ('"+request.getParameter("crt0")+"','"+ request.getParameter("crt1")+"','"+ request.getParameter("crt2")+"','"+ request.getParameter("crt3")+"', '"+request.getParameter("crt4")+"','3 Months')");

             con.close();
            }
            %>
            
            <%    
            String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
           String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
            
             Statement st=con.createStatement();
            ResultSet executeQuery = st.executeQuery("SELECT * FROM asset");
            ResultSetMetaData hd=executeQuery.getMetaData();
          out.print("<tr class=\"jph\">"+"<th>"+ hd.getColumnName(1)+"</th>"
                      +"<th>"+hd.getColumnName(2)+"</th>"
                      +"<th>"+hd.getColumnName(3)+"</th>"
                      +"<th>"+hd.getColumnName(4)+"</th>"
                      + "<th>"+hd.getColumnName(5)+"</th>"
                      +"<th>Mark</th>"
                      +"<th>&nbsp</th>"
                      
                      + "</tr>");
            while(executeQuery.next()){
              out.print("<tr class=\"jph\">"+"<td>"+executeQuery.getString(1)+"</td>"
                      +"<td>"+executeQuery.getString(2)+"</td>"
                      +"<td>"+executeQuery.getString(3)+"</td>"
                      +"<td>"+executeQuery.getString(4)+"</td>"
                      + "<td>"+executeQuery.getString(5)+"</td>"
                      + "<td>");
              if(executeQuery.getString(5).equals("YES"))
              {
                  out.print(" <input type=\"checkbox\" name=\"out\" value=\""+executeQuery.getString(1)+"\"/>");}
              else{
              out.print("Unavailable");
              }
              out.print("</td>"
                      +"<td><a href=\" http://jumpstartlabsdev:8080/UbuntuDSS/AssetRegistry.jsp?delete="+executeQuery.getString(1)+"\">"+"Delete</a>"
                      +"<td><a href=\" http://jumpstartlabsdev:8080/UbuntuDSS/AssetRegistry.jsp?update="+executeQuery.getString(1)+"\">"+"Update</a>"
                      
                      + "</td>"
                      + "</tr>");
              if(executeQuery.getString(1).equals(request.getParameter("update"))){
              out.print("<tr >"+"<td>"+executeQuery.getString(1)+"</td>"
                       +"<input  type=\"hidden\" name=\"atr0\" value=\""+executeQuery.getString(1)+"\"/>"
                      +"<td><input name=\"atr1\" type=\"text\" value=\" "+executeQuery.getString(2)+"\"/></td>"
                      +"<td>"
                     + "<select option=\" "+executeQuery.getString(3)+"\" name=\"atr2\" >"
                      + "<option>Excellent</option>"
                      + "<option>Good</option>"
                      + "<option>Bad</option>"
                      + "</select>"
                      + "</td>"
                      
                      +"<td><input name=\"atr3\" type=\"text\" value=\" "+executeQuery.getString(4)+"\"/></td>"
                      + "<td>"
                      + "<select select=\""+executeQuery.getString(5)+"\" name=\"atr4\">"
                      + "<option>YES</option>"
                      + "<option>NO</option>"
                      + "</select>"
                      + "</td>"
                      +"<td><input type=\"submit\" name=\"upd\" value=\"Save\"/>"
                      +"<td><input type=\"reset\"  value=\"clear\"/>"
                      + "</td>"
                      + "</tr>");
              }
          }
          if(true){
              out.print("<tr>"+"<td><input name=\"crt0\" type=\"text\" /></td>"
                      +"<td><input name=\"crt1\" type=\"text\" /></td>"
                      +"<td>"
                      + "<select name=\"crt2\" >"
                      + "<option>Excellent</option>"
                      + "<option>Good</option>"
                      + "<option>Bad</option>"
                      + "</select></td>"
                      +"<td><input name=\"crt3\" type=\"text\" /></td>"
                      + "<td>"
                      + "<select  name=\"crt4\">"
                      + "<option>YES</option>"
                      + "<option>NO</option>"
                      + "</select>"
                      + "</td>"
                      +"<td><input type=\"submit\" name=\"Create\" value=\"Save\"/></td>"
                      +"<td><input type=\"reset\"  value=\"clear\"/>"
                      +"<td><input type=\"submit\"  name=\"chk\"value=\"checkout\"/>"
                      + "</td>"
                      + "</tr>");
              }
          con.close();
          
            %>
            
          
            
        </table>
            
        </form>
            </td>
        </tr>
    </table>
    </body>
</html>
