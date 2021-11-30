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
	
<body style="background-color: #25702F; font-family: lato">
<!-- NAV, LOGOTIPO, MENU 
**********
**********
**********
**********-->
<header>
		<div style="display: flex; height: 220px; background-color: #25702F">
			<img style="margin-left: 60px" src="logo_libertas_integradas_topo.png" width="280px" height="175px">
			
			<nav class="navbar navbar-light bg-#25702F" style="font-size: 25px">
				  <div class="container-fluid" style="background-color: #25702F">
				    <button class="navbar-toggler" style="background-color: white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
				      <span class="navbar-toggler-icon" style="background-color: white"></span>
				    </button>
				    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				      <div class="offcanvas-header">
				        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="font-size: 35px">Menu</h5>
				        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				      </div>
				      <div class="offcanvas-body">
				        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				          <li class="nav-item">
				            <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
				          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="FormularioSubmissao.jsp">Submissao</a>
				          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="Login.jsp">Admin</a>
				          </li>
				     
				      </div>
				    </div>  
				  </div>
				</nav>
		</div>
	</header>	
	<h1 style="background-color: #E4E4E4; border-radius: 5px; text-align: center; 
		 margin-left: auto; margin-right: auto" class="container">Formulário de Submissão</h1>
	
	<!-- PARTE JAVASCPRIT DO CODIGO QUE COMUNICA COM O BANCO E PEGA AS CLASSES E VALORES
	*********
	*********
	*********
	********* -->
	
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
	
	<!-- FORMULARIO DE SUBMISSAO  A SEGUIR
	********
	********
	********
	********
	-->
	<div class="container">
		<div style="background-color: #E4E4E4;border-radius: 8px" class="row" >
		
			<div role="main" class="col-md-6">	
				<form action="EnviarArquivo" enctype="multipart/form-data" method="post">   
						<input type="hidden" name="id_trabalho" value="<%= id_trabalho %>"/>
						<input type="hidden" name="id_aluno" value="<%= id_aluno %>"/>
						<br>
						<label for="exampleFormControlInput1">Nome:</label>
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
				<br>
					Titulo:
					<input type="text" name="titulo" value="<%= titulo %>"class="form-control" type="text" placeholder="Titulo" aria-label="default input example"/>
					</br>
					
					Palavras Chave(3-5):
					<input type="text" name="pchave" value="<%= palavras_chaves %>"class="form-control" type="text" placeholder="Palavras Chave" aria-label="default input example"/>
					</br>
					Resumo:
					<input type="text" name="resumo" value="<%= resumo %>"class="form-control" type="text" placeholder="Resumo" aria-label="default input example"/>
					</br>
					Arquivo: 
					<br>
					<div class="input-group mb-3">
						<input type="file" name="foto"  class="form-control" id="inputGroupFile02"/>
						<label class="input-group-text" for="inputGroupFile02">Upload</label>
					</div>
					</br>
					<div>
						<p>
						&nbsp;&nbsp;&nbsp; Na qualidade de titular dos direitos de autor(a) da publicação, de acordo com a Lei n° 9610/98, 
						autorizo a Libertas - Faculdades Integradas a disponibilizar em formato impresso e eletrônico no 
						repositório de trabalhos acadêmicos da instituição (na internet), para fins de consulta, leitura, 
						impressão e/ou download individual a titulo de divulgação científica, o texto integral da obra acima citada, 
						sem responsabilidade do ressarcimento de direitos autorais e sem pagamento de quaisquer direitos autorais patrimoniais 
						por parte da Libertas - Faculdades Integradas. 
						</p>
					</div>
					</br>
					<input type="radio" name="autorizacao" value="sim" />
					<label>Sim</label>
					<input type="radio" name="autorizacao"  value="nao" />
					<label>Não</label>
					</br>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="height: 50px">
						<input type="submit" class="btn btn-outline-success"  value="Enviar" style="margin-right: 15px">
						<a href="index.jsp"><input type="button" class="btn btn-outline-info"  value="Voltar"></a>
					</div>
			</form>
			</aside>
		</div>	
	</div>
	<br><br>
<script src="js/bootstrap.min.js"></script>
</body>
</html>