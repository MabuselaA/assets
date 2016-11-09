<%-- 
    Document   : Dasboard
    Created on : 17 Feb 2015, 10:43:10 AM
    Author     : livhu
--%>

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
            <a href="AssetReport.jsp" >Asset Report</a>
        </div>
        <div class="libu">
       <a href="emploeeReport.jsp" >Employee Report</a>
        </div>
        <div class="libu">
        <a href="bookingReport.jsp" >Booking Report</a>
        </div>
        
        </div>
                </td>
            <td>
                <form >

<table width="843"  border="1">
  <tr>
    <td width="164">Analyse cost </td>
    <td width="296">
        
      <label>Catagory
      <select name="catagory">
        <option>Stationary</option>
        <option>Food</option>
		<option>All</option>
      </select>
</label>

      </td>
    <td width="361"><label>No_users:
<input name="no" type="text" />
</label></td>
  </tr>
  <tr>
    <td>Resource planning </td>
    <td>
      <label>
        <input type="checkbox" name="checkbox" value="checkbox" />
        Inflasion</label>
		<label>
        <input type="checkbox" name="checkbox" value="checkbox" />
        VAT</label>
		<label>
        <input type="checkbox" name="checkbox" value="checkbox" />
        Premium</label>
        </td>
    <td><label>
	<select name="select">
        <option selected="selected">Item value</option>
        <option>bulk</option>
		
      </select>
	<input type="text"/></label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
     
        <input type="submit" name="report" value="Produce Report" />
      
    </td>
    <td><input type="reset" name="Submit2" value="Clear" /></td>
  </tr>
    
</table>
</form> 
                
                
            </td>
                <td></td>
            </tr>
        </table>
    
    
    
    <%
    
    
    if(request.getParameter("report")!=null){
    %>
    <h1>Cost Plan</h1>
    <table width="843"  border="1">
  <tr>
    <td width="164">Analyse cost </td>
    <td width="296">
        
        <label>Catagory:
            <% out.println(request.getParameter("catagory"));%>
</label>

      </td>
    <td width="361"><label>No_users:
 <% out.println(request.getParameter("no"));%>
</label></td>
  </tr>
  <tr>
    <td>Resource planning </td>
    <td>
      <label>
        <input type="checkbox" name="checkbox" value="checkbox" />
        Inflasion</label>
		<label>
        <input type="checkbox" name="checkbox" value="checkbox" />
        VAT</label>
		<label>
        <input type="checkbox" name="checkbox" value="checkbox" />
        Premium</label>
        </td>
    <td><label>
	
		 <% out.println(request.getParameter("select"));%>
      
	</label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
     
        <input type="submit" name="Submit" value="Produce Report" />
      
    </td>
    <td><input type="reset" name="Submit2" value="Clear" /></td>
  </tr>
    
</table>
        <%}%>
</center>
</body>
</html>
