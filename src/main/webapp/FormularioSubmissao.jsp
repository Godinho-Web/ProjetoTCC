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
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="css/all.min.css"/>
</head>

<body style="background-color: #25702F">
	<div style="background-color: #E4E4E4; text-align: center;border-radius: 8px">
		<h1>Formulario de Submissão</h1>
	</div>
	
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
	<div class="container">
		<div style="background-color: #E4E4E4;border-radius: 8px" class="row" >
		
			<div role="main" class="col-md-6">	
				<form action="EnviarArquivo" enctype="multipart/form-data" method="post">
						<input type="hidden" name="id_trabalho" value="<%= id_trabalho %>"/>
						</br>
						<input type="hidden" name="id_aluno" value="<%= id_aluno %>"/>
						<label for="exampleFormControlInput1" class="form-label">Nome:</label>
						<input type="text" name="nome" value="<%= nome %>" class="form-control" type="text" placeholder="Nome" aria-label="default input example" />
						</br>
						
						RA:
						<input type="text" name="ra" value="<%= RA %>"class="form-control" type="text" placeholder="RA" aria-label="default input example"/>
						</br>
						
						Email:
						<input type="text" name="email" value="<%= email %>"class="form-control" type="text" placeholder="E-mail" aria-label="default input example"/>
						</br>
						
						Professor:
						<select name="id_professor" class="form-select" aria-label="Default select example">
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
						<select name="id_curso" class="form-select" aria-label="Default select example">
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
			</div>
			<aside role="complement" class="col-md-6">
			</br>
					Titulo:
					<input type="text" name="titulo" value="<%= titulo %>"class="form-control" type="text" placeholder="Titulo" aria-label="default input example"/>
					</br>
					
					Resumo:
					<input type="text" name="resumo" value="<%= resumo %>"class="form-control" type="text" placeholder="Resumo" aria-label="default input example"/>
					</br>
					
					Palavras Chave(3-5):
					<input type="text" name="pchave" value="<%= palavras_chaves %>"class="form-control" type="text" placeholder="Palavras Chave" aria-label="default input example"/>
					</br>
					<div>
						Arquivo: <input type="file" name="foto"/>
					</div>
					</br>
					<div >
						Na qualidade de titular dos direitos de autor(a) da publicação, de acordo com a Lei n° 9610/98, 
						autorizo a Libertas - Faculdades Integradas a disponibilizar em formato impresso e eletrônico no 
						repositório de trabalhos acadêmicos da instituição (na internet), para fins de consulta, leitura, 
						impressão e/ou download individual a titulo de divulgação científica, o texto integral da obra acima citada, 
						sem responsabilidade do ressarcimento de direitos autorais e sem pagamento de quaisquer direitos autorais patrimoniais 
						por parte da Libertas - Faculdades Integradas. 
					</div>
					</br>
					<input type="radio" name="autorizacao" value="<%= autorizacao %>" />
					<label>Sim</label>
					
					<input type="radio" name="autorizacao"  value="<%= autorizacao %>" />
					<label>Não</label>
					</br>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<input type="submit" class="btn btn-outline-success" value="Enviar">
						<a href="index.jsp"><input type="button" class="btn btn-outline-info"  value="Voltar "></a>
					</div>
			</form>
			</aside>
		</div>	
	</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>