<%@page import="org.libertas.tcc.TrabalhoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body style="background-color: #25702F; font-family: lato">
<%
	int id_trabalho = Integer.parseInt(request.getParameter("id_trabalho"));
	TrabalhoDao tdao = new TrabalhoDao();
	
	tdao.aceitar(id_trabalho);


%>
	<div style="position: absolute; width: 100%; height: 100%"> 
		 <div style="background-color: #E4E4E4;border-radius: 8px;width: 500px; height: 300px; position: absolute;top: 50%; left: 50%; margin-top: -250px; margin-left: -250px" class="container">
			<p style="text-align: center; font-size: 30px; color: green">Trabalho aceito com sucesso</p>
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="height: 55px">  
				 <a href="admin_todostb.jsp"><input type="button" class="btn btn-outline-dark" value="Voltar"></a>
		 	</div>  
		</div>
	</div>
</body>
</html>