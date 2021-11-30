<%@page import="org.libertas.tcc.Curso"%>
<%@page import="org.libertas.tcc.CursoDao"%>
<%@page import="org.libertas.tcc.ProfessorDao"%>
<%@page import="org.libertas.tcc.Professor"%>
<%@page import="org.libertas.tcc.AlunoDao"%>
<%@page import="org.libertas.tcc.Trabalho"%>
<%@page import="org.libertas.tcc.Aluno"%>
<%@page import="org.libertas.tcc.TrabalhoDao"%>
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
			<form class="d-flex">
	        	<input class="form-control me-2" type="search" placeholder="Buscar ..." aria-label="Buscar">
	        	<button class="btn btn-light" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
 					 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
			</button>
	      	</form>
	      	
		</div>
	<%
		ProfessorDao pdao = new ProfessorDao();
		for (Professor p: pdao.listar()){
			
		CursoDao cdao = new CursoDao();
		for (Curso c: cdao.listar()){
			
			
		AlunoDao adao = new AlunoDao();
		for (Aluno a: adao.listar()){
	
	// FOR PARA PERCORRER ALUNO E TRABALHO, COM FINALIDADE DE PUXAR OS VALORES PARA PREENCHIMENTO DA GRADE DE TRABALHOS
		TrabalhoDao tdao = new TrabalhoDao();
		for (Trabalho t: tdao.listar()){
		
	%>
	<br><br><br><br>
	<div  style="background-color: #E4E4E4; border-radius: 5px; margin-left: auto; margin-right: auto" class="container">
		<div  style="margin-left: auto; margin-right: auto" class="container">
		  <!-- Stack the columns on mobile by making one full-width and the other half-width -->
		  <div>
			  <div>
			    <div><%= t.getTitulo() %></div>
			  </div>
			
			  <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
			  <div>
			    <div><%= a.getNome() %></div>
			    <div><%= a.getEmail() %></div>
			    <div><%= t.getArquivo() %></div>
			  </div>
			
			<div>
			  <!-- Columns are always 50% wide, on mobile and desktop -->
			  <div>
			    <div><%= p.getNome() %></div>
			    <div><%= c.getNome() %></div>
			  </div>
			   <div>
			    <div><%= t.getResumo() %></div>
			  </div>
				
				<% 
					}
					}
					}
					}
				%>
			
			</div>
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>