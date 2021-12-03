<%@page import="org.mariadb.jdbc.util.ParameterList"%>
<%@page import="org.libertas.tcc.Trabalho_Index"%>
<%@page import="org.libertas.tcc.Trabalho"%>
<%@page import="org.libertas.tcc.TrabalhoDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Trabalhos</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="css/all.min.css"/>
</head>
<body  style="background-color: #25702F; font-family: lato">
		<header>
		<div style="display: flex; height: 220px; background-color: #25702F">
			<img style="margin-left: 60px" src="logo_libertas_integradas_topo.png" width="280px" height="175px">
			
			<nav class="navbar navbar-light bg-#25702F" style="font-size: 25px">
				  <div class="container-fluid" style="background-color: #25702F; color: white">
				    <button class="navbar-toggler" style="background-color: white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
				      <span class="navbar-toggler-icon" style="background-color: white"></span>
				    </button>
				    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				      <div class="offcanvas-header" style="background-color: #25702F">
				        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="font-size: 35px; color: white">Menu</h5>
				        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				      </div>
				      <div class="offcanvas-body" style="background-color: #25702F">
				        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				          <li class="nav-item">
				            <a class="nav-link active" aria-current="page" style=" color: inherit" href="index.jsp">Início</a>
				          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="FormularioSubmissao.jsp" style=" color: inherit">Submissão</a>
				          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="Login.jsp" style=" color: inherit">Admin</a>
				          </li>
				     
				      </div>
				    </div>  
				  </div>
				</nav>
		</div>
	</header>	
	<h1 style="background-color: #E4E4E4; border-radius: 5px; text-align: center; 
		 margin-left: auto; margin-right: auto" class="container">Trabalhos de Conclusão de Curso</h1>
			<br><br>
		<div  margin-left: auto; margin-right: auto" class="container">
			<form class="d-flex" action="index.jsp" method="post">
	        	<input class="form-control me-2" type="search" placeholder="Buscar ..." aria-label="Buscar" name="pesquisa" value="${param.pesquisa}"/>
	        <button class="btn btn-light" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
 					 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
			</button>
	      	</form>
	      	
		</div>
	<jsp:useBean id="tidao" class="org.libertas.tcc.TrabalhoDao" scope="page"/>
	<c:forEach var="ti" items="${tidao.buscar(param.pesquisa)}">
	<br><br><br><br>
	<table class="table table-striped" >
		<div  style="background-color: #E4E4E4; border-radius: 5px; margin-left: auto; margin-right: auto; padding-top: 15px" class="container">
			<div  style="margin-left: auto; margin-right: auto" class="container">
			  <!-- Stack the columns on mobile by making one full-width and the other half-width -->
			  <div class="container" >
				  <div class="row">
				    <div class="col"><b>Título: </b>${ti.titulo}</div>
				  </div>
				
				  <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
				  <div class="row">
				    <div class="col"><b>Nome: </b>${ti.nome}</div>
				    <div class="col"><b>E-mail: </b>${ti.email}</div>
				    <!--  <div class="col"><//%= ti.getArquivo() %></div>-->
				    <div class="col"></div>
				    <div class="col"><a href="../arquivosGrupo1/${ti.arquivo}"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-pdf-fill" viewBox="0 0 16 16">
 										 <path d="M5.523 12.424c.14-.082.293-.162.459-.238a7.878 7.878 0 0 1-.45.606c-.28.337-.498.516-.635.572a.266.266 0 0 1-.035.012.282.282 0 0 1-.026-.044c-.056-.11-.054-.216.04-.36.106-.165.319-.354.647-.548zm2.455-1.647c-.119.025-.237.05-.356.078a21.148 21.148 0 0 0 .5-1.05 12.045 12.045 0 0 0 .51.858c-.217.032-.436.07-.654.114zm2.525.939a3.881 3.881 0 0 1-.435-.41c.228.005.434.022.612.054.317.057.466.147.518.209a.095.095 0 0 1 .026.064.436.436 0 0 1-.06.2.307.307 0 0 1-.094.124.107.107 0 0 1-.069.015c-.09-.003-.258-.066-.498-.256zM8.278 6.97c-.04.244-.108.524-.2.829a4.86 4.86 0 0 1-.089-.346c-.076-.353-.087-.63-.046-.822.038-.177.11-.248.196-.283a.517.517 0 0 1 .145-.04c.013.03.028.092.032.198.005.122-.007.277-.038.465z"/>
 										 <path fill-rule="evenodd" d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3zM4.165 13.668c.09.18.23.343.438.419.207.075.412.04.58-.03.318-.13.635-.436.926-.786.333-.401.683-.927 1.021-1.51a11.651 11.651 0 0 1 1.997-.406c.3.383.61.713.91.95.28.22.603.403.934.417a.856.856 0 0 0 .51-.138c.155-.101.27-.247.354-.416.09-.181.145-.37.138-.563a.844.844 0 0 0-.2-.518c-.226-.27-.596-.4-.96-.465a5.76 5.76 0 0 0-1.335-.05 10.954 10.954 0 0 1-.98-1.686c.25-.66.437-1.284.52-1.794.036-.218.055-.426.048-.614a1.238 1.238 0 0 0-.127-.538.7.7 0 0 0-.477-.365c-.202-.043-.41 0-.601.077-.377.15-.576.47-.651.823-.073.34-.04.736.046 1.136.088.406.238.848.43 1.295a19.697 19.697 0 0 1-1.062 2.227 7.662 7.662 0 0 0-1.482.645c-.37.22-.699.48-.897.787-.21.326-.275.714-.08 1.103z"/>
									</svg></a></div>
				  </div>
				
				<div>
				  <!-- Columns are always 50% wide, on mobile and desktop -->
				  <div class="row">
				    <div class="col"><b>Professor: </b>${ti.nomepr}</div>
				    <div class="col"><b>Curso: </b>${ti.nomecur}</div>
				  </div>
				   <div class="row">
				    <div class="col"><b>Resumo: </b>${ti.resumo}</div>
				  </div>
					
				</div>
			</div>
		</div>
		</c:forEach>
	</table>	
	<script src="js/bootstrap.min.js"></script>
</body>
</html>