package org.libertas.tcc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Buscar
 */
@WebServlet("/Buscar")
public class Buscar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Buscar() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resposta = "";
		try {
			
			//Trabalho_Index ti = new Trabalho_Index();
			
			String parametro = (request.getParameter("pesquisar"));
			
			TrabalhoDao tdao = new TrabalhoDao();
			for (Trabalho_Index ti: tdao.buscar(parametro)){
				resposta = resposta+ti.getNome()+ "\n";
			}
			
			//resposta = "Busca feita com sucesso!!\r\n"
					//+ "	<br/>\r\n"
					//+ "	<a href=\"index_buscar.jsp\">Ok</a>";
			
			
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
		

	}

}
