<%-- 
    Document   : MENU
    Created on : 29/07/2020, 05:24:08 PM
    Author     : crystopher 
--%>



<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Persona</title>
        <link href="CSS/EstilosPersona.css" rel="stylesheet" type="text/css"/>
        <img src="IMAGENES/personasle.png" alt="personasle img" class="personasle"/>

        <%!
            String consulta;
            String consulta1;
            Connection cn;
            PreparedStatement pst;
            PreparedStatement pst1;
            ResultSet rs;
            ResultSet rs1;
            String s_accion;
            String s_idpersona;
            String s_nombre;
            String s_DNI;
            String s_email;
            String s_distrito;
            String s_telefono;
            String s_estado;
            
        %>
        
        
    </head>
    <body>
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idpersona = request.getParameter("f_idpersona");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select  nombre, DNI, email, distrito, telefono, estado  "
                                + " from persona "
                                + " where"
                                + " idpersona = " + s_idpersona + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
    
        
        <form name="EditarPersonaForm" action="PERSONA.jsp" method="GET">
           <table border="2" align="center" class="rol">
                
                <thead>
                    <tr>
                        <th colspan="2">Editar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI:</td>
                        <td><input type="text" name="f_DNI" value="<% out.print(rs.getString(2)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="f_email" value="<% out.print(rs.getString(3)); %>" maxlength="50" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Distrito: </td>
                        <td><input type="text" name="f_distrito" value="<% out.print(rs.getString(4)); %>" maxlength="30" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Telefono: </td>
                        <td><input type="text" name="f_telefono" value="<% out.print(rs.getString(5)); %>" maxlength="9" size="9"/></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(6)); %>" maxlength="1" size="1"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idpersona" value="<% out.print(s_idpersona); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%
                }
            }else{
        %>
        <form name="AgregarPersonaForm" action="PERSONA.jsp" method="GET" >
            <table border="2" align="center" class="rol">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI</td>
                        <td><input type="text" name="f_DNI" value="" maxlength="8" size="8" /></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="f_email" value="" maxlength="50" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Dsitrito: </td>
                        <td><input type="text" name="f_distrito" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Telefono: </td>
                        <td><input type="text" name="f_telefono" value="" maxlength="9" size="9" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="1" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar"  />
                       
                            <input type="hidden" name="f_accion" value="C" />
                            
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
        }
        %>
        
     <table border="2" align="center" class="general">
           
            <thead>
                <tr>
                    <th colspan="9">Datos Persona</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombre</th>
                    <th>DNI</th>
                    <th>Email</th>
                    <th>Distrito</th>
                    <th>Telefono</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>
                </tr>
            </thead>

        <%
           
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =    " delete from persona "
                                    + " where "
                                    + " idpersona = " + s_idpersona + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")  ) {
                     
                        s_nombre = request.getParameter("f_nombre");
                        s_DNI = request.getParameter("f_DNI");
                        s_email = request.getParameter("f_email");
                        s_distrito = request.getParameter("f_distrito");
                        s_telefono = request.getParameter("f_telefono");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " persona( nombre, DNI, email, distrito, telefono, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_DNI +"','"+ s_email +"','"+ s_distrito +"','"+ s_telefono +"','"+ s_estado  +"')";
                        //out.print(consulta);
                        //Boolean.TRUE.parseBoolean(s_nombre);
                        
                    
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_DNI = request.getParameter("f_DNI");
                        s_email = request.getParameter("f_email");
                        s_distrito = request.getParameter("f_distrito");
                        s_telefono = request.getParameter("f_telefono");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  persona  "
                                + "  set  "
                                + "  nombre = '"+ s_nombre +"',"
                                + "  DNI = '"+ s_DNI +"', "
                                + "  email = '"+ s_email +"', "
                                + "  distrito = '"+ s_distrito +"', "
                                + "  telefono = '"+ s_telefono +"', "
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idpersona = "+ s_idpersona +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                
                 consulta = " Select *\n "
                        + " from persona ";
                
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
 
               
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    consulta1 = " select idpersona  "
                                + " from sugerencias "
                                + " where"
                                + " idpersona = " + ide + "; ";
                    pst1 = cn.prepareStatement(consulta1);
                    rs1 = pst1.executeQuery();
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
                        
                    <%
                    if (rs1.next()) {
                    %> 
                    <td><img src="IMAGENES/noeliminar.jpeg" ><i  ></font></td> 
                    <%   }
                    else{
                    %>    
                        <td><a href="PERSONA.jsp?f_accion=E&f_idpersona=<%out.print(ide);%>"><img src="IMAGENES/elimina.jpeg" alt="elimina" class="Eliminar"/></a></td>
                     <%   }
                    %>    
                        <td><a href="PERSONA.jsp?f_accion=M1&f_idpersona=<%out.print(ide);%>"><img src="IMAGENES/editar.jpeg" alt="editar" class="Editar" /></a></td>
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