<%-- 
    Document   : index
    Created on : 17 Feb 2015, 11:55:53 AM
    Author     : livhu
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link rel = "stylesheet" type="text/css" href="Webstyle.css"/>
<title>Decision</title>
<link href="Webstyle.css" rel="stylesheet" type="text/css" />
</head>

<body onLoad="sunSlideShow()">
<div class="style"><img src="tsc.jpg" width="382" height="132" alt="hj"/></div>
<%
    String user=null;
    String pass=null;
    String EMPID=null;
    String dep=null;
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
               dep= res.getString(4);
               System.out.println(res.getString(3));
               break;
               }
             con.close();
    
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
               hp.setAttribute("type", dep);
        
        
        
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
    <table border="2"><tr>
            
            <td>
    <img src="tsc.jpg" alt="slide-show" id="mySlider" width="900" height="450">
    <script>
    var quotes = new Array ("tsc.jpg", "ast.jpeg");

var i = 0


function sunSlideShow()
{
    document.getElementById("mySlider").src = (  quotes[i] );

    if (i<3)
    {
        i++;
    }

    else

        i = 0;

    setTimeout("sunSlideShow()", 3000);

}

 </script>
            </td>
        </tr>
    </table>
</center>
<hr/>
<div>
      <p> 
  The purpose of this document is to provide detailed design of which will guide the
development process of the software. The document will hold the following
information, Database design, GUI design, and an overview of the solution. The
program being documented is asset decision support system. HR database and
supporting systems are related this system as we need information about
employees. An asset registry is also part of the supporting software. The
following documents are important to understanding the context of the software
project: research document, cost and benefits and policy documents relating to
assets.  
     
     </p>
 </div>
</body>
</html>

