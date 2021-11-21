<%@page import="org.libertas.tcc.TrabalhoDao"%>
<%@page import="org.libertas.tcc.Aluno"%>
<%@page import="org.libertas.tcc.Trabalho"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Trabalho t = new Trabalho();
		Aluno a = new Aluno();
		a.setNome(request.getParameter("nome"));
		a.setRA(Integer.parseInt(request.getParameter("RA")));
		a.setEmail(request.getParameter("email"));
		t.setId_trabalho(Integer.parseInt(request.getParameter("id_trabalho")));
		t.setTitulo(request.getParameter("titulo"));
		t.setResumo(request.getParameter("resumo"));
		t.setPalavras_chaves(request.getParameter("palavras_chaves"));
		t.setId_aluno(Integer.parseInt(request.getParameter("id_aluno")));
		t.setId_professor(Integer.parseInt(request.getParameter("id_professor")));
		t.setId_curso(Integer.parseInt(request.getParameter("id_curso")));
		
		TrabalhoDao tdao = new TrabalhoDao();
		if (t.getId_trabalho()>0){
			tdao.alterar(t);
		} else {
			tdao.inserir(t);
		}
		
	
	%>
	
	Registro Inserido e/ou Alterado com sucesso !!
	<br/>
	<a href="FormularioSubmissao.jsp">Ok</a>

</body>
</html>