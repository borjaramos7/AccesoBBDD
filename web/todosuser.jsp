<%-- 
    Document   : todosuser
    Created on : 11-mar-2016, 15:41:45
    Author     : 2DAW
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
Integer limit = 0;
if(request.getParameter("limit")==null){ limit=0;}
else{limit=Integer.parseInt(request.getParameter("limit"));}

Class.forName("com.mysql.jdbc.Driver");
Connection conex = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios","root", "");
Statement stat1 = conex.createStatement();
ResultSet listauser = stat1.executeQuery ("SELECT us.id,us.nombre as nombre,apellido1,apellido2,pr.nombre as provincia FROM t_usuarios us,t_provincias pr WHERE pr.cod=us.prov_cod ORDER BY pr.nombre LIMIT "+limit+",20 ;");

Statement stat2 = conex.createStatement();
ResultSet numuser = stat2.executeQuery("SELECT COUNT(*)as total FROM t_usuarios");
numuser.next();
int numuserint= Integer.parseInt(numuser.getString("total"));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos los usuarios</title>
    </head>
    <body>
        <h1 align="center">Listado de usuarios</h1>
        <h2 align="center">Numero de usuarios: <% out.println(numuser.getString("total")); %></h2>
        <table align="center" style="border:3px solid bisque;width:50%;height:65%;border-collapse: collapse;">
            <tr style="border-bottom:1px solid bisque;font-weight: bold;background-color:antiquewhite">
                <td>Nombre</td>
                <td>Apellido1</td>
                <td>Apellido2</td>
                <td>Provincia</td>
            </tr>
            
            <% while (listauser.next()) { %>
            <tr>
            <td><% out.println(listauser.getString("nombre")); %></td>
            <td><% out.println(listauser.getString("apellido1")); %></td>
            <td><% out.println(listauser.getString("apellido2")); %></td>
            <td><% out.println(listauser.getString("provincia")); %></td>
            </tr>
            <% }
            conex.close();%>
            </table>
            <p style="color:graytext;text-align:center; ">
            <% if(limit>=20){%>
            
            <a href="todosuser.jsp?limit=<%=(limit-20)%>">Anterior</a>
                <%} if(limit+20<numuserint){%>
                &nbsp;&nbsp;
                <a href="todosuser.jsp?limit=<%=(limit+20)%>">Siguiente</a>
            </p>
            <%}%>
        
    </body>
</html>
