package org.libertas.tcc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	private Connection  conexao;
	public Conexao() {
		try {
			// Criando conexao com o banco de dados
			Class.forName("org.mariadb.jdbc.Driver").newInstance();
			String url = "jdbc:mariadb://192.168.1.178:30003/ratofumante"; // USAR ESSE LOCAL
			//String url = "jdbc:mariadb://186.248.131.178:30003/ratofumante"; // USAR ESSE FORA DA FACUL
			//String url = "jdbc:mariadb://remotemysql.com:3306/2EyRmeqEIM";
			conexao = DriverManager.getConnection(url, "grupo1", "SopaDeLetrinhas.1");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConexao() {
		return conexao;
	}
}
