<%-- 
    Document   : VALIDA
    Created on : 29/07/2020, 05:23:55 PM
    Author     : crystopher 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VALIDA</title>
        <%!
            String s_usuario;
            String s_contraseña;
            String s_tipo;
        %>
    </head>
    <body>
        <%
            
            s_tipo = request.getParameter("f_tipo");
            s_usuario = request.getParameter("f_usuario");
            s_contraseña = request.getParameter("f_contraseña");
            if (s_usuario.equals("TEAM") && s_contraseña.equals("12345")&& s_tipo.equals("Práctica Laboratorio")) {
                response.sendRedirect("MENU.jsp");
            } else {
                response.sendRedirect("LOGIN.jsp");
            }
        %>
    </body>
</html>

