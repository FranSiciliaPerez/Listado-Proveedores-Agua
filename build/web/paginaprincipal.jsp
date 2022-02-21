<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página principal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="icon" href="./paginaprincipal_files/imagenes/favicon.png">
        <link rel="stylesheet" href="paginaprincipal_files/estilos/styles.css">
    </head>
    <body>

        <nav class="navbar sticky-top navbar-expand-lg bg-light">
            <div class="container">
                <a class="navbar-brand" href="#"><img style= "width: 60px" src="./paginaprincipal_files/imagenes/logo.png" class="logo" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul style="align-items: center;" class="navbar-nav mr-auto w-100 justify-content-end">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <img style="width: 50px" src="./paginaprincipal_files/imagenes/usuario.png" class="usuario" alt="">
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Inicio </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section id="hero"><section id="table">
                <div class="container table-responsive py-5" > 
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Marca</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Localidad</th>
                                <th scope="col">Modificar</th>
                                <th scope="col">Borrar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/suministroagua"
                            ,"root", "");
                            Statement s = conexion.createStatement();
                            ResultSet listado = s.executeQuery ("SELECT * FROM proveedores");
                            while (listado.next()) {
                            out.println(listado.getString("NomProve") + " " + listado.getString("CantProduct") + "<br>");
                        }
                        conexion.close();
                        %>
                        <tr>
                            <th scope="row">Solan de Cabra</th>
                            <td>0'75L</td>
                            <td>0'75L</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit">
                                    <i class="fas fa-user-edit" aria-hidden="true"></i>
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                    <i class="fas fa-dumpster" aria-hidden="true"></i>
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <button id="añadir" type="button" class="btn btn-success" data-toggle="modal" data-target="#añadirfila">
                    Introducir Agua⠀<i class="far fa-plus-square" aria-hidden="true"></i>
                </button>
                <div class="modal fade" id="añadirfila" tabindex="-1" role="dialog" aria-labelledby="añadirfilaLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="añadirfilaLabel">Introducir agua</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="añadirfilaLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="añadirfilaLabel">Modificar Esta Fila</h5>
                                <button type="button" class="close" data-dismiss="modal"> 
                                    <i class="fas fa-user-edit" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModalCenter"  tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
                    <img src="./paginaprincipal_files/imagenes/basura.png" class="eliminar" alt="">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">¿Quieres eliminar este agua?</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                </body>
                </html>
