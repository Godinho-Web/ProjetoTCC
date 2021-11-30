package org.libertas.tcc;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EnviarArquivo
 */
@WebServlet("/EnviarArquivo")
@MultipartConfig
public class EnviarArquivo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnviarArquivo() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resposta="";
		try {
			
		
			// faz upload do arquivo
			Part filePart = request.getPart("foto");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			
			// define a pasta que será salva o  arquivo
			String pasta = "D:\\Faculdade\\2021\\2Sem\\Ling Progr 2\\arquivos\\";
			//String pasta = "/var/lib/tomcat9/webapps/arquivosGrupo1/";
			
			int i = 1;
			while(new File(pasta + fileName).exists()) {
				fileName = i + fileName;
				i++;
			}
			//salva o arquivo
			filePart.write(pasta + fileName);		
			
			
			
			
			Trabalho t = new Trabalho();
			Aluno a = new Aluno();
			a.setNome(request.getParameter("nome"));
			a.setRA(Integer.parseInt(request.getParameter("ra")));
			//a.setRA(123);
			a.setEmail(request.getParameter("email"));
			a.setId_curso(Integer.parseInt(request.getParameter("id_curso")));
			
			int id_aluno = 0;
			AlunoDao adao = new AlunoDao();
			Aluno ara = adao.consultar_ra(a.getRA());
			if (ara.getId_aluno()>0){
				a.setId_aluno(ara.getId_aluno());
				adao.alterar(a);
				t.setId_aluno(ara.getId_aluno());
			} else {
				id_aluno = adao.inserir(a);
				t.setId_aluno(id_aluno);
			}
			// t.setId_trabalho(Integer.parseInt(request.getParameter("id_trabalho")));
			
			t.setTitulo(request.getParameter("titulo"));
			t.setResumo(request.getParameter("resumo"));
			t.setPalavras_chaves(request.getParameter("pchave"));
			//t.setArquivo(request.getParameter("arquivo"));
			t.setArquivo(fileName);
			//t.setData(request.getParameter("data"));
			t.setValidacao(request.getParameter("validacao"));
			t.setAutorizacao(request.getParameter("autorizacao"));
			t.setId_professor(Integer.parseInt(request.getParameter("id_professor")));
			//t.setId_professor(1);
			t.setId_curso(Integer.parseInt(request.getParameter("id_curso")));
			//t.setId_curso(1);
			
			TrabalhoDao tdao = new TrabalhoDao();
			if (t.getId_trabalho()>0){
				tdao.alterar(t);
				resposta = "Registro Alterado com sucesso !!\r\n"
						+ "	<br/>\r\n"
						+ "	<a href=\"FormularioSubmissao.jsp\">Ok</a>";
			} else {
				tdao.inserir(t);
				resposta = "Registro Inserido com sucesso !!\r\n"
						+ "	<br/>\r\n"
						+ "	<a href=\"FormularioSubmissao.jsp\">Ok</a>";
			}
			
			
			 
		} catch (Exception e) {
			e.printStackTrace();
			resposta="falha ao salvar dados<br>"+e.getMessage();
		}	
		
		try {
			PrintWriter saida = response.getWriter();
			resposta = "<html><body>"+resposta+"</body></html>";
			saida.println(resposta);
			saida.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
				//D:\Faculdade\2021\2Sem\Ling Progr 2\arquivos
	}
	

}
