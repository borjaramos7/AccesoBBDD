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
if(request.getParameter("limit")==null){
    
   limit=0;
}else{
    limit=Integer.parseInt(request.getParameter("limit"));
    
}

Class.forName("com.mysql.jdbc.Driver");
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios","root", "");
Statement s = conexion.createStatement();
ResultSet listado = s.executeQuery ("SELECT t_usuarios.id,t_usuarios.nombre as nombre,apellido1,apellido2,t_provincias.nombre as provincia FROM t_usuarios,t_provincias WHERE t_provincias.cod=t_usuarios.prov_cod ORDER BY t_usuarios.id LIMIT "+limit+",20 ;");
Statement x = conexion.createStatement();
ResultSet Numero_p = x.executeQuery("SELECT COUNT(*)as total FROM t_usuarios");
Numero_p.next();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos los usuarios</title>
    </head>
    <body>
        <h1>Listado de usuarios</h1>
        <h2>Numero de usuarios: <%  %></h2>
        <table>
            <tr>
                <td>Nombre</td>
                <td>Apellido1</td>
                <td>Apellido2</td>
                <td>Provincia</td>
            </tr>
            
            <% while (listado.next()) { %>
            <% } %>
            <% } %>
        </table>
    </body>
</html>
