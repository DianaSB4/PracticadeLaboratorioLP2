<%-- 
    Document   : MENU
    Created on : 29/07/2020, 05:24:08 PM
    Author     : crystopher 
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MENU</title>
        <link href="CSS/EstiloMenu.css" rel="stylesheet" type="text/css"/>
        <img src="IMAGENES/bdmenu.png" alt=""/>
    </head>
    <body>
        <div class="menu"> 
            DATABASE - BUZÓN 
        <table border="1" align="center" class="menu"> 
           
     
            <thead>
                <tr>
                    <th>MENÚ DE OPCIONES</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="http://localhost:8084/PracticaLaboratorio/ROL.jsp"> Datos rol </a></td>
                </tr>
                <tr>
                    <td><a href="http://localhost:8084/PracticaLaboratorio/PERSONA.jsp"> Datos persona </a></td>
                </tr>
                <tr>
                    <td><a href="http://localhost:8084/PracticaLaboratorio/SUGERENCIA.jsp"> Datos sugerencia </a></td>
                </tr>
                <tr>
                    <td><a href="http://localhost:8084/PracticaLaboratorio/DatosArea.jsp"> Datos área </a></td>
                </tr>
                <tr align ='center'>
                    <td colspan="2"><a href="LOGIN.jsp"><input type="button" value="SALIR" name="f_salir" /></a></td>   
                </tr> 
            </tbody>
        </table>
        </div>
    </body>
</html>