<%-- 
    Document   : DatosArea
    Created on : 29/07/2020, 08:03:34 PM
    Author     : HP
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Área</title>
        <link href="CSS/EstilosArea.css" rel="stylesheet" type="text/css"/>
        <%!
            String consulta;
            String consulta1;
            Connection cn;
            PreparedStatement pst;
            PreparedStatement pst1;
            ResultSet rs;
            ResultSet rs1;
            String s_accion;
            String s_idarea;
            String s_nombre;
            String s_estado;
            
        %>
    </head>
    <body>
        <%
               try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idarea = request.getParameter("f_idarea");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select nombre, estado  "
                                + " from area "
                                + " where"
                                + " idarea = " + s_idarea + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
        <form name="EditarAreaForm" action="DatosArea.jsp" method="GET">
            <table border="0" align="center" class="ar">
                <thead>
                    <tr>
                        <th colspan="2">Editar Area</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(2)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idarea" value="<% out.print(s_idarea); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%
                }
            }else{
        %>
        <form name="AgregarÁreaForm" action="DatosArea.jsp" method="GET">
            <table border="1" cellspacing="0" cellpadding="" align = "center" class="ar">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Área</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
        }
        %>
        
       <table border="1" cellspacing="0" cellpadding="" align = "center" class="area">
            <thead>
                <tr>
                    <th colspan="8">Datos Área</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>
                    
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from area "
                                    + " where "
                                    + " idarea = " + s_idarea + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta =  " insert into "
                                    + " area (nombre, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  area  "
                                + "  set  "
                                + "  nombre = '"+ s_nombre +"',"
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idarea = "+ s_idarea +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idarea, nombre, estado "
                        + " from area ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    consulta1 = " select idrol  "
                                + " from sugerencias "
                                + " where"
                                + " idrol = " + ide + "; ";
                    
                    pst1 = cn.prepareStatement(consulta1);
                    rs1 = pst1.executeQuery();
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        
                        
                    <%
                    if (rs1.next()) {
                    %>
                    <td><img src="IMAGENES/noeliminar.jpeg" ><i  ></font></td>
                    <%   }else{
                    %>
                    <td><a href="DatosArea.jsp?f_accion=E&f_idarea=<%out.print(ide);%>"><img src="IMAGENES/elimina.jpeg" alt="eliminar" class="Eliminar"/></a></td>
                    <%   }
                    %>
                    <td><a href="DatosArea.jsp?f_accion=M1&f_idarea=<%out.print(ide);%>"><img src="IMAGENES/editar.jpeg" alt="editar" class="Editar"/></a></td>
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
        <tr align ='center'>
            <td colspan="5"><a href="MENU.jsp"><input type="button" value="SALIR" name="f_salir" /></a></td>   
                        </tr> 
        </table>
    </body>
</html>
