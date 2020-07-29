<%-- 
    Document   : LOGIN
    Created on : 29/07/2020, 05:23:41 PM
    Author     : crystopher 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        
    </head>
    <body>
        <form name="f_validar" action="VALIDA.jsp">
            <div>
                
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th aling="center" colspan="2" >INGRESE USUARIO Y CLAVE</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Usuario: </td>
                        <td><input type="text" name="f_usuario" value="" /></td>
                    </tr>
                    <tr>
                        <td>Contraseña: </td>
                        <td><input type="password" name="f_contraseña" value="" /></td>
                    </tr>
                    <tr>
                        <td>Tipo: </td>
                        <td>
                            <form>
                        <select style="text-align:center" name="f_tipo"  >
                          <option>Examen Parcial</option>
                          <option>Práctica Laboratorio</option>
                          <option>Examen Final</option>
                        </select>
                        </div>
                        </form>
                            </td>
                    </tr>
                    <tr align ='center'>
                        <td colspan="2"><input type="submit" value="INGRESAR" name="f_ingresar" /></td>      
                    </tr>
                </tbody>
            </table>
                </div>
        </form>
    </body>
</html>