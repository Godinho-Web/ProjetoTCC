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
</head>
<body>
	<h1>Trabalho de Conclusao de Curso</h1>
	
	<%
		AlunoDao adao = new AlunoDao();
		for (Aluno a: adao.listar()){
	
		TrabalhoDao tdao = new TrabalhoDao();
		for (Trabalho t: tdao.listar()){
		
	%>
	
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
		
		<% 
			}
		}
		%>
		
	</div>
</body>
</html>