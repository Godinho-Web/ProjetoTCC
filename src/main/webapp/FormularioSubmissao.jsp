<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de Submissão</title>
</head>
<body>
<h1>Formulario de Submissão</h1>
<form action="ConfirmaSubmissao" method="post">
		Nome:
		<input type="text" name="nome"   >
		</br>
		
		Email:
		<input type="text" name="email">
		</br>
		
		Professor:
		<input type="text" name="professor">
		</br>
		
		Curso:
		<input type="text" name="curso">
		</br>
		
		Titulo:
		<input type="text" name="titulo">
		</br>
		
		Palavras Chave(3-5):
		<input type="text" name="pchave">
		</br>
		
		
		<input type="radio" value="teste">
		Sim
		<input type="radio" value="teste">
		Não
		<input type="submit" value="Enviar">


</form>

</body>
</html>