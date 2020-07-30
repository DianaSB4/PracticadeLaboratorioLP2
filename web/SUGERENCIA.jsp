<%-- 
    Document   : SUGERENCIA
    Created on : 29/07/2020, 09:51:35 PM
    Author     : DIANA SANTOS
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Sugerencia</title>
        <link href="CSS/EstiloSugerencias.css" rel="stylesheet" type="text/css"/>
        <img src="IMAGENES/sugerencia.png" alt="sugerencia img" class="Sugerenciass"/>
        <img src="IMAGENES/sugerencias.png" alt="Sugerencias img" class="Sugerencias"/>
        <img src="IMAGENES/sugle.png" alt="sugle img" class="sugle"/>
        <%!
            String consulta;
            String consulta1;
            Connection cn;
            PreparedStatement pst;
            PreparedStatement pst1;
            ResultSet rs;
            ResultSet rs1;
            String s_accion;
            String s_idsugerencias;
            String s_descripcion;
            String s_fecha;
            String s_estado;
            String s_idpersona;
            String s_idarea;
            String s_idrol;
           
        %>
    </head>
    <body>
        <%
               try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idsugerencias = request.getParameter("f_idsugerencias");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select descripcion, fecha, estado, idpersona, idarea, idrol "
                                + " from sugerencias "
                                + " where"
                                + " idsugerencias = " + s_idsugerencias + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
        <form name="EditarSugerenciaForm" action="SUGERENCIA.jsp" method="GET">
            <table border="1" align="center" class="sug">
                <thead>
                    <tr>
                        <th colspan="2">Editar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Descripcion: </td>
                        <td><input type="text" name="f_descripcion" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Fecha: </td>
                        <td><input type="text" name="f_fecha" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(3)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr>
                        <td>IDpersona: </td>
                        <td><input type="text" name="f_idpersona" value="<% out.print(rs.getString(4)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>IDarea: </td>
                        <td><input type="text" name="f_idarea" value="<% out.print(rs.getString(5)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>IDrol: </td>
                        <td><input type="text" name="f_idrol" value="<% out.print(rs.getString(6)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idsugerencias" value="<% out.print(s_idsugerencias); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%
                }
            }else{
        %>
        <form name="AgregarSugerenciaForm" action="SUGERENCIA.jsp" method="GET">
            <table border="1" align="center" class="sug">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Descripcion: </td>
                        <td><input type="text" name="f_descripcion" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                    <tr>
                        <td>Fecha: </td>
                        <td><input type="text" name="f_fecha" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>    
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr>    
                        <td>IDpersona: </td>
                        <td><input type="text" name="f_idpersona" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr>    
                        <td>IDarea: </td>
                        <td><input type="text" name="f_idarea" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr>    
                        <td>IDrol: </td>
                        <td><input type="text" name="f_idrol" value="" maxlength="1" size="2"/></td>
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
        
        <table border="1" cellspacing="0" cellpadding="" align = "center" class="Sugerencias">
            <thead>
                <tr>
                    <th colspan="9">Datos Sugerencia</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Descripcion</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Persona</th>
                    <th>Area</th>
                    <th>Rol</th>
                    <th colspan="3">Acciones</th>
                    
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from sugerencias "
                                    + " where "
                                    + " idsugerencias = " + s_idsugerencias + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_descripcion = request.getParameter("f_descripcion");
                        s_fecha = request.getParameter("f_fecha");
                        s_estado = request.getParameter("f_estado");
                        s_idpersona = request.getParameter("f_idpersona");
                        s_idarea = request.getParameter("f_idarea");
                        s_idrol = request.getParameter("f_idrol");
                        consulta =  " insert into "
                                    + " sugerencias (descripcion, fecha, estado, idpersona, idarea, idrol) "
                                    + " values ('"+s_descripcion+"','"+s_fecha+"','"+s_estado+"','"+s_idpersona+"','" +s_idarea+"','" +s_idrol+ "' )";
                        //out.print(consulta);
                        
                        
                        
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                        
                        
                    }else if (s_accion.equals("M2")) {
                        s_descripcion = request.getParameter("f_descripcion");
                        s_fecha = request.getParameter("f_fecha");
                        s_estado = request.getParameter("f_estado");
                        s_idpersona = request.getParameter("f_idpersona");
                        s_idarea = request.getParameter("f_idarea");
                        s_idrol = request.getParameter("f_idrol");
                        consulta = " update  sugerencias  "
                                + "  set  "
                                + "  descripcion = '"+ s_descripcion +"',"
                                + "  fecha = '"+ s_fecha +"', "
                                + "  estado = '"+ s_estado +"', "
                                + "  idpersona = '"+ s_idpersona +"', "
                                + "  idarea = '"+ s_idarea +"', "
                                + "  idrol = '"+ s_idrol +"' "
                                + "  where "
                                + "  idsugerencias = "+ s_idsugerencias +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select s.idsugerencias, s.descripcion, s.fecha, s.estado, p.nombre, a.nombre, r.tipo\n "
                        + " from sugerencias s, persona p, area a, rol r\n"
                        + " where s.idpersona = p.idpersona and s.idarea = a.idarea and s.idrol = r.idrol\n"
                        + " group by s.idsugerencias, s.descripcion, s.fecha, s.estado, p.nombre, a.nombre, r.tipo";
                
        
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                
                while (rs.next()) {  
                    ide = rs.getString(1);
   
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        <td><%out.print(rs.getString(7));%></td>

                        <td><a href="SUGERENCIA.jsp?f_accion=E&f_idsugerencias=<%out.print(ide);%>"><img src="IMAGENES/elimina.jpeg" alt="eliminar" class="Eliminar"/></a></td>
                       
                        <td><a href="SUGERENCIA.jsp?f_accion=M1&f_idsugerencias=<%out.print(ide);%>"><img src="IMAGENES/editar.jpeg" alt="editar" class="Editar"/></a></td>
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
        <tr align ='center'>
            <td colspan="9"><a href="MENU.jsp"><input type="button" value="SALIR" name="f_salir" /></a></td>   
                        </tr>
        
        </table>
    </body>
</html>