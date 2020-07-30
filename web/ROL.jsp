<%-- 
    Document   : ROL
    Created on : 29/07/2020, 09:04:11 PM
    Author     : GAMER
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Rol</title>
        <link href="CSS/Estilosrol.css" rel="stylesheet" type="text/css"/>
        <img src="IMAGENES/rol.png" alt="rol img" class="rol"/>
        <img src="IMAGENES/rolp.png" alt="rolp img" class="rolp"/>
        <img src="IMAGENES/role.png" alt="role img" class="role"/>
        <img src="IMAGENES/rolle.png" alt="rolle img" class="rolle"/>
        <%!
            String consulta;
            String consulta1;
            Connection cn;
            PreparedStatement pst;
            PreparedStatement pst1;
            ResultSet rs;
            ResultSet rs1;
            String s_accion;
            String s_idrol;
            String s_tipo;
            String s_estado;
            
        %>
    </head>
    <body>
        <%
               try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idrol = request.getParameter("f_idrol");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select tipo, estado  "
                                + " from rol "
                                + " where"
                                + " idrol = " + s_idrol + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
        <form name="EditarRolForm" action="ROL.jsp" method="GET">
            
            <table border="1" align="center" class="rol">
                
                <thead>
                    <tr>
                        <th colspan="2">Editar Rol</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tipo: </td>
                        <td><input type="text" name="f_tipo" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(2)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idrol" value="<% out.print(s_idrol); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%
                }
            }else{
        %>
        <form name="AgregarRolForm" action="ROL.jsp" method="GET">
            <table border="1" align="center" class="rol">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Rol</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tipo: </td>
                        <td><input type="text" name="f_tipo" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                          
                            <input type="submit" value="Agregar" name="f_enviar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
        }
        %>
        
        <table border="1" cellspacing="0" cellpadding="" align = "center" class="general">
            <thead>
                <tr>
                    <th colspan="8">Datos Rol</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Tipo</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>
                    
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from rol "
                                    + " where "
                                    + " idrol = " + s_idrol + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_tipo = request.getParameter("f_tipo");
                        s_estado = request.getParameter("f_estado");
                        consulta =  " insert into "
                                    + " rol (tipo, estado) "
                                    + " values ('"+ s_tipo +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_tipo = request.getParameter("f_tipo");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  rol  "
                                + "  set  "
                                + "  tipo = '"+ s_tipo +"',"
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idrol = "+ s_idrol +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                
                consulta= " Select *\n "
                        + " from rol ";
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
                        <td><a href="ROL.jsp?f_accion=E&f_idrol=<%out.print(ide);%>"><img src="IMAGENES/elimina.jpeg" alt="eliminar" class="Eliminar"/></a></td>
                    <%   }
                    %> 
                        <td><a href="ROL.jsp?f_accion=M1&f_idrol=<%out.print(ide);%>"><img src="IMAGENES/editar.jpeg" alt="editar" class="Editar"/></a></td>

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
