<%-- 
    Document   : RegisterEMP
    Created on : Jun 2, 2015, 3:39:44 PM
    Author     : Thulisile
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link rel = "stylesheet" type="text/css" href="Webstyle.css"/>
<title>Decision</title>
<link href="Webstyle.css" rel="stylesheet" type="text/css" />
    </head>
    
    <body>
        <div class="style"><img src="tsc.jpg" width="382" height="132" alt="hj"/></div>
        
        <%
    String user=null;
    String pass=null;
    String EMPID=null;
    
    String DB_URL="jdbc:mysql://localhost:3306/tsc_assets";
            String USER="jutu";
            String PASS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
               Statement st=con.createStatement();
               ResultSet res=st.executeQuery("SELECT * from users where username='"+request.getParameter("USERNAME")+"' and password='"+request.getParameter("PASSWORD")+"'");
               while(res.next()){
                   user=res.getString(1);
                   pass=res.getString(2);
               EMPID= res.getString(3);
               
               System.out.println(res.getString(3));
               break;
               }
            // con.close();
    
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
    else if((request.getParameter("user").equals(user) && request.getParameter("pass").equals(pass))){
        HttpSession hp=request.getSession(true);
        hp.setAttribute("user", request.getParameter("user"));
         hp.setAttribute("EMPID", EMPID);
              
        
        
        
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

<hr/>
<div>
    
 </div>
         <table>
            <tr>
               

                                
                         
            
       
                                
                                
                            <td>
                            <img src="logo.png" title="NEW EMPLOYEE"/>  
                            </td>
                            
                            <br>
      <br>
      <br>
                <td>
                    <div>
                        
                    <form name="Register">
                        <br>
      <br>
      <br>
                        <table>
                            
                           
                            <tr>
                                <td><label>Username:</label></td>
                                <td><input type="text" name="username"/></td>
                            </tr>
                            <tr>
                                <td><label>Password:</label></td>
                                <td><input type="text" name="pass1"/></td>
                            </tr>
                            <tr>
                                <td><label>Employee ID:</label></td>
                                <td><input type="text" name="EMP_ID"/></td>
                                
                            </tr>
                            
                            <tr><td> <input type="submit" name="Reg" value="Register"/>
                                </td><td> <input type="reset" name="clr" value="clear"/></td>
                            </tr>
                        </table>
                    </form>
                    </div>
            
                </td>

            </tr>
        </table>

<%
            if(request.getParameter("Reg")!=null){
              String DB_UR="jdbc:mysql://localhost:3306/tsc_assets";
              String USE="jutu";
              String PAS="jutu1234";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
           Connection co = DriverManager.getConnection(DB_UR, USE, PAS);
               Statement s=con.createStatement();
               st.executeUpdate("INSERT INTO users (USERNAME,PASSWORD, EMP_ID) "
                       + " VALUES ('"+request.getParameter("username")+"','"+ request.getParameter("pass1")+"','"+ request.getParameter("EMP_ID")+"',3)");

             co.close();
            }
            %>
            
    </body>
</html>
