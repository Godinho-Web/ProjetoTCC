package org.libertas.tcc;

import java.io.File;
import java.io.IOException;
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
		
		// faz upload do arquivo
		Part filePart = request.getPart("foto");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		
		// define a pasta que será salva o  arquivo
		//String pasta = "D:\\Faculdade\\2021\\2Sem\\Ling Progr 2\\arquivos\\";
		String pasta = "/var/lib/tomcat9/webapps/arquivosGrupo1/";
		
		int i = 1;
		while(new File(pasta + fileName).exists()) {
			fileName = i + fileName;
			i++;
		}
		//salva o arquivo
		filePart.write(pasta + fileName);		
				
				//D:\Faculdade\2021\2Sem\Ling Progr 2\arquivos
	}

}
