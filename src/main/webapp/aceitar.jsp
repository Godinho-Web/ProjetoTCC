<%@page import="org.libertas.tcc.TrabalhoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
	int id_trabalho = Integer.parseInt(request.getParameter("id_trabalho"));
	TrabalhoDao tdao = new TrabalhoDao();
	
	tdao.aceitar(id_trabalho);


%>

<p>Trabalho aceito com sucesso</p>
<a href="admin_todostb.jsp">Voltar</a>
</body>
</html>