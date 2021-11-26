<%@page import="org.libertas.tcc.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="css/all.min.css"/>
</head>
<body>

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
	<br><br>
	 <div style="background-color: #E4E4E4;border-radius: 8px" class="container">
		<div class="col-md-5" >
		  <form class="px-4 py-3">
		    <div class="mb-3">
		      <label for="exampleDropdownFormEmail1" class="form-label">Endereço de e-mail</label>
		      <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com" value="<%= email %>"/>
		    </div>
		    <div class="mb-3">
		      <label for="exampleDropdownFormPassword1" class="form-label">Senha</label>
		      <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password" value="<%= senha %>"/>
		    </div>
		    <div class="mb-3">
		    </div>
		    <button type="submit" class="btn btn-primary">Entrar</button>
		    <a href="index.jsp"><input type="button" class="btn btn-primary" value="Voltar">
		  </form>
	   </div> 
<script src="js/bootstrap.min.js"></script>
</body>
</html>