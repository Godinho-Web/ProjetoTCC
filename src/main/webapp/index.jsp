<%@page import="org.libertas.tcc.AlunoDao"%>
<%@page import="org.libertas.tcc.Trabalho"%>
<%@page import="org.libertas.tcc.Aluno"%>
<%@page import="org.libertas.tcc.TrabalhoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhos</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="css/all.min.css"/>
</head>
<body>
	<h1>Trabalho de Conclusao de Curso</h1>
	
		<nav class="navbar navbar-light bg-light fixed-top">
		  <div class="container-fluid">
		  	<h1>Trabalho de Conclusao de Curso</h1>
		    
		    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		      <div class="offcanvas-header">
		        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
		        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		      </div>
		      <div class="offcanvas-body">
		        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
		          <li class="nav-item">
		            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="FormularioSubmissao.jsp">Submissao</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="FormularioSubmissao.jsp">Admin</a>
		          </li>
		     
		      </div>
		    </div>
		  </div>
		</nav>
	<%
		AlunoDao adao = new AlunoDao();
		for (Aluno a: adao.listar()){
	
	// FOR PARA PERCORRER ALUNO E TRABALHO, COM FINALIDADE DE PUXAR OS VALORES PARA PREENCHIMENTO DA GRADE DE TRABALHOS
		TrabalhoDao tdao = new TrabalhoDao();
		for (Trabalho t: tdao.listar()){
		
	%>
	<br><br><br><br>
	<div class="container">
	  <!-- Stack the columns on mobile by making one full-width and the other half-width -->
	  <div class="row">
	    <div class="col-md-8"><%= t.getTitulo() %></div>
	  </div>
	
	  <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
	  <div class="row">
	    <div class="col-6 col-md-4"><%= a.getNome() %></div>
	    <div class="col-6 col-md-4"><%= a.getEmail() %></div>
	    <div class="col-6 col-md-4"><%= t.getArquivo() %></div>
	  </div>
	
	<div>
		<tr>
			<td><%= t.getTitulo() %></td>
		</tr>	
		<tr>
			<td><%= a.getNome() %></td>
			<td><%= a.getEmail() %></td>
			<td><%= t.getArquivo() %></td>
		</tr>
		<tr>		
			<td><%= t.getId_professor() %></td>
			<td><%= t.getId_curso() %></td>
			<td><%= t.getResumo() %></td>
		</tr>
	  <!-- Columns are always 50% wide, on mobile and desktop -->
	  <div class="row">
	    <div class="col-6"><%= t.getId_professor() %></div>
	    <div class="col-6"><%= t.getId_curso() %></div>
	    <div class="col-6"><%= t.getId_curso() %></div>
	  </div>
		
		<% 
			}
		}
		%>
		
	</div>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>