package org.libertas.tcc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;


public class TrabalhoDao {
	public void inserir(Trabalho t) {
		try {
			Conexao con = new Conexao();
			String sql = "INSERT INTO Trabalho "
					+ "(Titulo,Resumo,Palavras_chaves,Arquivo,Data,Validacao,Autorizacao,id_aluno_,id_professor,id_curso)"
					+ " VALUES "
					+ "(?,?,?,?,?,?,?,?,?,?)";
			
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
				t.setPalavras_chaves(res.getString("palavras_chaves"));
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
}
