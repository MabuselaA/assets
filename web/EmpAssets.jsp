<%-- 
    Document   : EmpAssets
    Created on : 17 Feb 2015, 10:39:42 PM
    Author     : livhu
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Webstyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body onLoad="sunSlideShow()">
        
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
    <table border="2"><tr>
                <td>
                    <div >
        <div class="libu">
            <a href="AssetRegistry.jsp" >Asset Registry</a>
        </div>
        <div class="libu">
       <a href="EmployeeRegistry.jsp" >Employee Registry</a>
        </div>
        
        </div>
                </td>
            <td>  
        <img src="tsc.jpg" alt="slide-show" id="mySlider" width="900" height="450">
    <script>
    var quotes = new Array ("data1.jpg", "data2.jpg" ,"tsc.jpg");

var i = 0


function sunSlideShow()
{
    document.getElementById("mySlider").src = (  quotes[i] );

    if (i<2)
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
    </body>
</html>
