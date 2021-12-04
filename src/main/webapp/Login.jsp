<%@page import="org.libertas.tcc.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="css/all.min.css" />
</head>
<body style="background-color: #25702F; font-family: lato">

	<%
		int id_admin=0;
		String email="";
		String senha="";  // PARTE JAVASCPRIT DO CODIGO DE LOGIN
		if (request.getParameter("id_admin")!=null){
			id_admin = Integer.parseInt(request.getParameter("id_admin"));
			Admin ad = new Admin();
			email = ad.getEmail();
			senha = ad.getSenha();
		}
	
	
	%>
	<br>
	<br>
	<div style="position: absolute; width: 100%; height: 100%">
		<div
			style="background-color: #E4E4E4; border-radius: 8px; width: 500px; height: 300px; position: absolute; top: 50%; left: 50%; margin-top: -250px; margin-left: -250px"
			class="container">
			<form class="px-4 py-3" action="Autenticacao" method="post">
				<div class="mb-3">
					<label for="exampleDropdownFormEmail1" class="form-label">Endereço
						de e-mail</label> <input type="email" name="email" class="form-control"
						id="exampleDropdownFormEmail1" placeholder="email@example.com"
						value="<%= email %>" />
				</div>
				<div class="mb-3">
					<label for="exampleDropdownFormPassword1" class="form-label">Senha</label>
					<input type="password" name="senha" class="form-control"
						id="exampleDropdownFormPassword1" placeholder="Password"
						value="<%= senha %>" />
				</div>
				<div class="mb-3"></div>
				<button type="submit" class="btn btn-outline-success"
					style="margin-right: 20px">Entrar</button>

				<a href="index.jsp"><input type="button"
					class="btn btn-outline-info" value="Voltar">
			</form>
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>