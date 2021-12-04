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
			<a href="index.jsp"><img style="margin-left: 60px" src="logo_libertas_integradas_topo.png" width="280px" height="175px"></a>
			
			<nav class="navbar navbar-light bg-#25702F" style="font-size: 25px">
				  <div class="container-fluid" style="background-color: #25702F; color: white">
				    <button class="navbar-toggler" style="background-color: white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
				      <span class="navbar-toggler-icon" style="background-color: white"></span>
				    </button>
				    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				      <div class="offcanvas-header" style="background-color: #25702F">
				        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="font-size: 35px; color: white">Menu</h5>
				        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				      </div>
				      <div class="offcanvas-body" style="background-color: #25702F">
				        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				          <li class="nav-item">
				            <a class="nav-link active" aria-current="page" style=" color: inherit" href="index.jsp">Início</a>
				          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="FormularioSubmissao.jsp" style=" color: inherit">Submissão</a>
				          </li>
				          <li class="nav-item">
				            <a class="nav-link" href="Login.jsp" style=" color: inherit">Admin</a>
				          </li>
				     
				      </div>
				    </div>  
				  </div>
				</nav>
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
				<form class="was-validated" action="EnviarArquivo" enctype="multipart/form-data" method="post">   
						<input type="hidden" name="id_trabalho" value="<%= id_trabalho %>"/>
						<input type="hidden" name="id_aluno" value="<%= id_aluno %>"/>
						<br>
						<label for="exampleFormControlInput1">Nome:</label>
						<input type="text" name="nome" value="<%= nome %>" class="form-control" type="text" placeholder="Nome" aria-label="default input example" required/>
						</br>
						RA:
						<input type="text" name="ra" value="<%= RA %>"class="form-control" type="text" placeholder="RA" aria-label="default input example" required/>
						</br>
						E-mail:
						<input type="text" name="email" value="<%= email %>"class="form-control" type="text" placeholder="E-mail" aria-label="default input example" required/>
						</br>
						Professor:
						<select name="id_professor" class="form-select" aria-label="Default select example" required>
							<%
								ProfessorDao pdao = new ProfessorDao();
								for (Professor p: pdao.listar()){
									String sel = "";
									if (p.equals(sel)){  
										sel = " SELECTED ";
									}
									out.print("<option value="+p.getId_professor()+sel+">");
									out.print(p.getNome());
									out.print("</option>");
								
							}

							%>
						</select>
						</br>
						
						Curso:
						<select name="id_curso" class="form-select" aria-label="Default select example" required>
							<%
								CursoDao cdao = new CursoDao();
								for (Curso c: cdao.listar()){
									String sel = "";
									if (c.equals(sel)){
										sel = " SELECTED ";
									}
									out.print("<option value="+c.getId_curso()+sel+">");
									out.print(c.getNome());
									out.print("</option>");	
							}

							%>
						</select>
						</br>
			</div>
			<aside role="complement" class="col-md-6">
				<br>
					Título:
					<input type="text" name="titulo" value="<%= titulo %>"class="form-control" type="text" placeholder="Titulo" aria-label="default input example" required/>
					</br>
					
					Palavras Chave(3-5):
					<input type="text" name="pchave" value="<%= palavras_chaves %>"class="form-control" type="text" placeholder="Exemplo: teste1, teste2, teste3" aria-label="default input example" required/>
					</br>
				<!-- 	Resumo:
					<input type="text" name="resumo" value="<%= resumo %>"class="form-control" type="text" placeholder="Resumo" aria-label="default input example"/>
					</br>
				 -->
					Resumo:
					<div class="form-floating">
  						<textarea class="form-control" value="<%= resumo %> placeholder="Resumo" id="resumo" style="height: 170px" name="resumo" required></textarea>
					</div>
					<br>
					Arquivo: 
					<br>
					<div class="input-group mb-3">
						<input type="file" name="foto"  class="form-control" id="inputGroupFile02" required/>
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
					<input type="radio" name="autorizacao" value="sim" checked required/>
					<label>Sim</label>
					<input type="radio" name="autorizacao"  value="nao" required/>
					<label>Não</label>
					</br>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="height: 55px">
						<input type="submit" class="btn btn-outline-success"  value="Enviar" style="margin-right: 15px; height: 40px">
						<a href="index.jsp"><input type="button" class="btn btn-outline-info"  style="height: 40px"  value="Voltar"></a>
					</div>
				</aside>	
			
			</form>
		</div>	
	</div>
	<br><br>
	
	<footer style="background-color: #E4E4E4; padding: 15px; text-align: center;border-radius: 5px"> 
    <p>Desenvolvido por:</p>
     <p> João Felipe Delfino - <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg> <a href="https://www.linkedin.com/in/joão-felipe-delfino-133962211/" target="_blank" style="text-decoration: none;
	color:  $info;">Linkedin</a></p>
    <p>Luiz Felipe Godinho - <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg> <a href="https://www.linkedin.com/in/luiz-felipe-godinho-0600251b5/" target="_blank" style="text-decoration: none;
	color:  $info">Linkedin</a></p>
    <p> Thiago C. Lima - <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg> <a href="https://www.linkedin.com/in/thiago-lima-65a693205/" target="_blank" style="text-decoration: none;
	color:  $info;">Linkedin</a></p>
    <p>Copyright &copy; 2021</p>
  </footer>
<script src="js/bootstrap.min.js"></script>
</body>
</html>