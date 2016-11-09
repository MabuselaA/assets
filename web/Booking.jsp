<%-- 
    Document   : Booking
    Created on : 18 Feb 2015, 11:37:55 AM
    Author     : livhu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="tsc.data.DbCon"%>
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



        <hr/> 
        <div >
            <table> <tr>
                    <td><div class="libu"><a href="index.jsp"/>Home page</a></div></td>
                    <td><div class="libu"><a href="Dasboard.jsp"/>Report</a></div></td>
                    <td><div class="libu"><a href="EmpAssets.jsp"/>Database</a></div></td>
                    <td><div class="libu"><a href="RegisterEMP.jsp"/>Register</a></div></td>
                    <td><div class="libu"><a href="contactPage.html"/>Contact us</a></div></td>
                    < <td><div class="libu"><a href="index.html"/>Logout</a></div></td>
                </tr>
            </table>
        </div>
        <hr/>      
    <center>
        <form>
            <input type="hidden" name="" value="<% //out.println(emp); %>"/>

            <table>

               <%
                    if (request.getParameter("submit") != null) {
                        String DB_URL = "jdbc:mysql://localhost:3306/tsc_assets";
                        String USER = "jutu";
                        String PASS = "jutu1234";
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Connecting to a selected database...");
                        Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
                        Statement st = con.createStatement();
                        st.executeUpdate("INSERT INTO book (Equipment, SignOut, SignIn) VALUES ('" + request.getParameter("ASSET_ID").trim() + "', '" + request.getParameter("Equipment").trim() + "','" + request.getParameter("SignOut").trim() + "','" + request.getParameter("SignIn").trim() + "')");
                        out.println("<tr><td colspan=\"2\"><div>New booking recorded</div></td</tr>");
                    }


                %>

              <%--  <%            if (true) {
                        String DB_URL = "jdbc:mysql://localhost:3306/tsc_assets";
                        String USER = "jutu";
                        String PASS = "jutu1234";
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Connecting to a selected database...");
                        Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
                        Statement st = con.createStatement();
                        StringBuilder sb = new StringBuilder();
                        sb.append(request.getParameter("out"));
                        ResultSet res = st.executeQuery("SELECT * FROM asset )");
                        while (res.next()) {
                            out.println("<tr>");
                            out.println("<td>" + res.getString(1) + "</td>" + "<td>" + res.getString(2) + "</td>" + "<td>" + res.getString(3) + "</td>");
                            out.println("<input type=\"hidden\" name=\"astid\"+ value=" + res.getString(1) + "/>");
                            out.println("</tr>");
                        }
                    }
                %>
                <%-- <tr>
                            <td>Asset number:</td>
                            <td><input type="text" name="assetNo" disabled="true" value="<% out.print(request.getParameter("astid")); %>"/></td>
                           
                        </tr>--%>
                <tr>
                    
                  <td>  
                      ASSET_ID
                      </td>
                          
                    <td>
                        EQUIPMENT 
                    </td>

                    <td>
                        SIGN OUT
                    </td>

                    <td>
                        SIGN IN 
                    </td>
                </tr>

                <td>  
                      ASSET_ID
                      </td>
                <td>

                    <select>
                        <option value="modem" name="mod">Modem</option>
                        <option value="laptop">Laptop</option>
                        <option value="projector">Projector</option>
                        <option value="mouse">Mouse</option>
                        <option value="keyboard">Keyboard</option>
                        <option value="screen">Screen</option>


                    </select>    

                </td>



                <td>

                    <input type="datetime-local" name="bdaytime"/>


                </td>

                <td>
                    <input type="datetime-local" name="bdaytime"/>
                    </tr>



            </table>
                <br/>
            <input type="submit">


        </form>
    </center>

</body>

</html>