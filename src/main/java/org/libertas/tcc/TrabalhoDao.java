package org.libertas.tcc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


public class TrabalhoDao {
	public void inserir(Trabalho t) {
		try {
			Conexao con = new Conexao();
			String sql = "INSERT INTO Trabalho "
					+ "(Titulo,Resumo,Palavras_chaves,Arquivo,Validacao,Autorizacao,id_aluno,id_professor,id_curso,Data)"
					+ " VALUES "
					+ "(?,?,?,?,?,?,?,?,?,CURDATE())"; // CURDATE PEGA A DATA ATUAL DO COMPUTADOR
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, t.getTitulo());
			ps.setString(2, t.getResumo());
			ps.setString(3, t.getPalavras_chaves());
			ps.setString(4, t.getArquivo());
			//ps.setString(5, t.getData());
			ps.setString(5, t.getValidacao());
			ps.setString(6, t.getAutorizacao());
			ps.setInt(7, t.getId_aluno());
			ps.setInt(8, t.getId_professor());
			ps.setInt(9, t.getId_curso());
			ps.execute();
			
			con.getConexao().close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TERMINANDO METODO INSERIR TRABALHO LUIZ 21/11/2021
	}
	
	public void alterar(Trabalho t) {
		try {
			Conexao con = new Conexao();
			String sql = "UPDATE Trabalho "
					+ " SET Titulo=?, Resumo=?, Palavras_chaves=?, Arquivo=?, Data=?, Validacao=?, Autorizacao=?, id_aluno=?, id_professor=?, id_curso=? "
					+ " WHERE id_trabalho=?";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, t.getTitulo());
			ps.setString(2, t.getResumo());
			ps.setString(3, t.getPalavras_chaves());
			ps.setString(4, t.getArquivo());
			ps.setString(5, t.getData());
			ps.setString(6, t.getValidacao());
			ps.setString(7, t.getAutorizacao());
			ps.setInt(8, t.getId_aluno());
			ps.setInt(9, t.getId_professor());
			ps.setInt(10, t.getId_curso());
			ps.execute();
			
			con.getConexao();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TERMINANDO METODO ALTERAR TRABALHO LUIZ 21/11/2021
	}
	
	
	public void aceitar(int id_trabalho) {
		try {
			Conexao con = new Conexao();
			String sql = "UPDATE Trabalho "
					+ " SET Validacao='Aprovado' "
					+ " WHERE id_trabalho=?";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setInt(1, id_trabalho);
			ps.execute();
			
			con.getConexao();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TERMINANDO METODO ALTERAR TRABALHO LUIZ 21/11/2021
	}
	
	public void excluir(int id_trabalho) {
		try {
			Conexao con = new Conexao();
			
			String sql = "DELETE FROM Trabalho WHERE id_trabalho="+id_trabalho;
			Statement instrucao = con.getConexao().createStatement();
			instrucao.execute(sql);
			
			con.getConexao();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TERMINANDO METODO EXCLUIR TRABALHO LUIZ 21/11/2021
	}
	
	
	public Trabalho consultar(int id_trabalho) {
		Trabalho t = new Trabalho();
		
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Trabalho WHERE id_trabalho= " + id_trabalho;
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res =  instrucao.executeQuery(sql);
			if (res.next()) {
				t.setTitulo(res.getString("titulo"));
				t.setResumo(res.getString("resumo"));
				t.setPalavras_chaves(res.getString("palavras_chaves"));
				t.setArquivo(res.getString("arquivo"));
				t.setData(res.getString("data"));
				t.setValidacao(res.getString("validacao"));
				t.setAutorizacao(res.getString("autorizacao"));
				t.setId_aluno(res.getInt("id_aluno"));
				t.setId_professor(res.getInt("id_professor"));
				t.setId_curso(res.getInt("id_curso"));
				
			}
			res.close();
			
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;  // TERMINANDO METODO CONSULTAR TRABALHO LUIZ 21/11/2021
	}
	
	public List<Trabalho> listar(){
		List<Trabalho> dados = new LinkedList<Trabalho>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Trabalho ORDER BY titulo";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			while (res.next()) {
				Trabalho t = new Trabalho();
				t.setTitulo(res.getString("titulo"));
				t.setResumo(res.getString("resumo"));
				t.setPalavras_chaves(res.getString("Palavras_chaves"));
				t.setArquivo(res.getString("arquivo"));
				t.setData(res.getString("data"));
				t.setValidacao(res.getString("validacao"));
				t.setAutorizacao(res.getString("autorizacao"));
				t.setId_aluno(res.getInt("id_aluno"));
				t.setId_professor(res.getInt("id_professor"));
				t.setId_curso(res.getInt("id_curso"));
				dados.add(t);
			}
			
			res.close();
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dados;
		
		// TERMINO DO METODO QUE LISTA TODOS OS TRABALHOS
	}
	
	
	public List<Trabalho_Index> listar_index(){
		List<Trabalho_Index> dadosin = new LinkedList<Trabalho_Index>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT t.Titulo,a.Nome AS Nome_Aluno,a.Email,t.Arquivo\r\n"
					+ ",p.Nome AS Nome_Professor,c.Nome AS Nome_Curso,t.Resumo FROM Trabalho t\r\n"
					+ "INNER JOIN Professor p ON\r\n"
					+ "t.id_professor = p.id_professor\r\n"
					+ "INNER JOIN Curso c ON\r\n"
					+ "t.id_curso = c.id_curso\r\n"
					+ "INNER JOIN Aluno a ON\r\n"
					+ "t.id_aluno = a.id_aluno\r\n"
					+ "WHERE t.Validacao = 'Aprovado' AND t.Autorizacao = 'sim'\r\n"
					+ "ORDER BY t.Titulo;";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			while (res.next()) {
				Trabalho_Index ti = new Trabalho_Index();
				ti.setTitulo(res.getString("titulo"));
				ti.setNome(res.getString("Nome_Aluno"));
				ti.setEmail(res.getString("email"));
				ti.setArquivo(res.getString("arquivo"));
				ti.setNomepr(res.getString("Nome_Professor"));
				ti.setNomecur(res.getString("Nome_Curso"));
				ti.setResumo(res.getString("resumo"));
				dadosin.add(ti);
			}
			
			res.close();
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dadosin;
		
		// TERMINO DO METODO QUE LISTA TODOS OS TRABALHOS
	}
	
	public List<Trabalho_Index> buscar(String pesquisa){
		List<Trabalho_Index> dadosin = new LinkedList<Trabalho_Index>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT t.Titulo,a.Nome AS Nome_Aluno,a.Email,t.Arquivo"
					+ ",p.Nome AS Nome_Professor,c.Nome AS Nome_Curso,t.Resumo,t.Palavras_chaves FROM Trabalho t "
					+ "INNER JOIN Professor p ON "
					+ "t.id_professor = p.id_professor "
					+ "INNER JOIN Curso c ON "
					+ "t.id_curso = c.id_curso "
					+ "INNER JOIN Aluno a ON "
					+ "t.id_aluno = a.id_aluno "
					+ "WHERE (t.Titulo LIKE ? OR a.Nome LIKE ? OR p.Nome LIKE ? "
					+ "OR c.Nome LIKE ? OR t.Resumo LIKE ? OR t.Palavras_chaves LIKE ?) "
					+ "AND t.Validacao = 'Aprovado' AND t.Autorizacao = 'sim' "
					+ "ORDER BY t.Titulo";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, "%" + pesquisa + "%");
			ps.setString(2, "%" + pesquisa + "%");
			ps.setString(3, "%" + pesquisa + "%");
			ps.setString(4, "%" + pesquisa + "%"); // passando o mesmo nome pois o parametro para buscar é o mesmo
			ps.setString(5, "%" + pesquisa + "%");
			ps.setString(6, "%" + pesquisa + "%");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				Trabalho_Index ti = new Trabalho_Index();
				ti.setTitulo(res.getString("titulo"));
				ti.setNome(res.getString("Nome_Aluno"));
				ti.setEmail(res.getString("email"));
				ti.setArquivo(res.getString("arquivo"));
				ti.setNomepr(res.getString("Nome_Professor"));
				ti.setNomecur(res.getString("Nome_Curso"));
				ti.setResumo(res.getString("resumo"));
				dadosin.add(ti);
			}
			con.getConexao().close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dadosin;
		// 	METODO BUSCAR NO INDEX
	}
	
	
	public List<Trabalho_Index> buscar_admin(String pesquisa){
		List<Trabalho_Index> dadosin = new LinkedList<Trabalho_Index>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT t.Titulo,a.Nome AS Nome_Aluno,a.Email,t.Arquivo"
					+ ",p.Nome AS Nome_Professor,c.Nome AS Nome_Curso,t.Resumo,t.Palavras_chaves,t.id_trabalho FROM Trabalho t "
					+ "INNER JOIN Professor p ON "
					+ "t.id_professor = p.id_professor "
					+ "INNER JOIN Curso c ON "
					+ "t.id_curso = c.id_curso "
					+ "INNER JOIN Aluno a ON "
					+ "t.id_aluno = a.id_aluno "
					+ "WHERE (t.Titulo LIKE ? OR a.Nome LIKE ? OR p.Nome LIKE ? "
					+ "OR c.Nome LIKE ? OR t.Resumo LIKE ? OR t.Palavras_chaves LIKE ?) "
					+ "AND t.Validacao IS NULL "
					+ "ORDER BY t.Titulo";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, "%" + pesquisa + "%");
			ps.setString(2, "%" + pesquisa + "%");
			ps.setString(3, "%" + pesquisa + "%");
			ps.setString(4, "%" + pesquisa + "%"); // passando o mesmo nome pois o parametro para buscar é o mesmo
			ps.setString(5, "%" + pesquisa + "%");
			ps.setString(6, "%" + pesquisa + "%");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				Trabalho_Index ti = new Trabalho_Index();
				ti.setTitulo(res.getString("titulo"));
				ti.setNome(res.getString("Nome_Aluno"));
				ti.setEmail(res.getString("email"));
				ti.setArquivo(res.getString("arquivo"));
				ti.setNomepr(res.getString("Nome_Professor"));
				ti.setNomecur(res.getString("Nome_Curso"));
				ti.setResumo(res.getString("resumo"));
				ti.setId_trabalho(res.getInt("id_trabalho"));
				dadosin.add(ti);
			}
			con.getConexao().close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dadosin;
		// 	METODO BUSCAR NO INDEX
	}
	
	
	public List<Trabalho_Index> buscar_todos(String pesquisa){
		List<Trabalho_Index> dadosin = new LinkedList<Trabalho_Index>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT t.Titulo,a.Nome AS Nome_Aluno,a.Email,t.Arquivo"
					+ ",p.Nome AS Nome_Professor,c.Nome AS Nome_Curso,t.Resumo,t.Palavras_chaves,t.id_trabalho,t.Validacao,t.Autorizacao FROM Trabalho t "
					+ "INNER JOIN Professor p ON "
					+ "t.id_professor = p.id_professor "
					+ "INNER JOIN Curso c ON "
					+ "t.id_curso = c.id_curso "
					+ "INNER JOIN Aluno a ON "
					+ "t.id_aluno = a.id_aluno "
					+ "WHERE t.Titulo LIKE ? OR a.Nome LIKE ? OR p.Nome LIKE ? "
					+ "OR c.Nome LIKE ? OR t.Resumo LIKE ? OR t.Palavras_chaves LIKE ? "
					+ "ORDER BY t.Titulo";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, "%" + pesquisa + "%");
			ps.setString(2, "%" + pesquisa + "%");
			ps.setString(3, "%" + pesquisa + "%");
			ps.setString(4, "%" + pesquisa + "%"); // passando o mesmo nome pois o parametro para buscar é o mesmo
			ps.setString(5, "%" + pesquisa + "%");
			ps.setString(6, "%" + pesquisa + "%");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				Trabalho_Index ti = new Trabalho_Index();
				ti.setTitulo(res.getString("titulo"));
				ti.setNome(res.getString("Nome_Aluno"));
				ti.setEmail(res.getString("email"));
				ti.setArquivo(res.getString("arquivo"));
				ti.setNomepr(res.getString("Nome_Professor"));
				ti.setNomecur(res.getString("Nome_Curso"));
				ti.setResumo(res.getString("resumo"));
				ti.setValidacao(res.getString("validacao"));
				ti.setAutorizacao(res.getString("autorizacao"));
				ti.setId_trabalho(res.getInt("id_trabalho"));
				dadosin.add(ti);
			}
			con.getConexao().close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dadosin;
		// 	METODO BUSCAR NO INDEX
	}
	
	
}
