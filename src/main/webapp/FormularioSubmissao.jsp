<%@page import="org.libertas.tcc.Curso"%>
<%@page import="org.libertas.tcc.CursoDao"%>
<%@page import="org.libertas.tcc.Professor"%>
<%@page import="org.libertas.tcc.ProfessorDao"%>
<%@page import="org.libertas.tcc.Trabalho"%>
<%@page import="org.libertas.tcc.TrabalhoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de Submissão</title>
</head>
<body style="background-color: green">
	<h1>Formulario de Submissão</h1>
	
	<%
		String nome="";
		String email="";
		String RA="";
		int id_trabalho=0;
		String titulo="";
		String resumo="";
		String palavras_chaves="";
		String arquivo="";
		String data="";
		String validacao="";
		String autorizacao="";
		int id_aluno=0;
		int id_professor=0;
		int id_curso=0;
		if (request.getParameter("id_trabalho")!=null){
			// QUANDO FOR ALTERAR, BUSCA NO BD OS DADOS
			id_trabalho = Integer.parseInt(request.getParameter("id_trabalho"));
			TrabalhoDao tdao = new TrabalhoDao();
			Trabalho t = tdao.consultar(id_trabalho);
			titulo = t.getTitulo();
			resumo = t.getResumo();
			palavras_chaves = t.getPalavras_chaves();
			arquivo = t.getArquivo();
			data = t.getData();
			validacao = t.getValidacao();
			autorizacao = t.getAutorizacao();
			id_aluno = t.getId_aluno();
			id_professor = t.getId_professor();
			id_curso = t.getId_curso();
		}
		
		
	
	
	
	%>
<form action="ConfirmaSubmissao" enctype="multipart/form-data" method="post">
		<input type="hidden" name="id_trabalho" value="<%= id_trabalho %>"/>
		Nome:
		<input type="text" name="nome" value="<%= nome %>" />
		</br>
		
		RA:
		<input type="text" name="ra" value="<%= RA %>" />
		</br>
		
		Email:
		<input type="text" name="email" value="<%= email %>"/>
		</br>
		
		Professor:
		<select name="id_professor">
			<%
				ProfessorDao pdao = new ProfessorDao();
				for (Professor p: pdao.listar()){
					String sel = "";
					if (p.equals(sel)){
						sel = " SELECTED ";
					}
					out.print("<option value="+p.getId_professor()+sel+">");
					out.print(p.getNome() + "/" + p.getId_professor());
					out.print("</option>");
				
			}
			
			
			%>
		
		
		</select>
		</br>
		
		Curso:
		<select name="id_curso">
			<%
				CursoDao cdao = new CursoDao();
				for (Curso c: cdao.listar()){
					String sel = "";
					if (c.equals(sel)){
						sel = " SELECTED ";
					}
					out.print("<option value="+c.getId_curso()+sel+">");
					out.print(c.getNome() + "/" + c.getId_curso());
					out.print("</option>");
				
			}
			
			
			%>
		
		
		</select>
		</br>
		
		Titulo:
		<input type="text" name="titulo" value="<%= titulo %>" />
		</br>
		
		Resumo:
		<input type="text" name="titulo" value="<%= resumo %>" />
		</br>
		
		Palavras Chave(3-5):
		<input type="text" name="pchave" value="<%= palavras_chaves %>" />
		</br>
		
		Arquivo: <input type="file" name="foto"/>
		
		
		<input type="radio" name="autorizacao" value="<%= autorizacao %>" />
		<label>Sim</label>
		<input type="radio" name="autorizacao"  value="<%= autorizacao %>" />
		<label>Não</label>
		<input type="submit" value="Enviar">


</form>

</body>
</html>