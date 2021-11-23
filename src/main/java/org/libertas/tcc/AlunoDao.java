package org.libertas.tcc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AlunoDao {
	public int inserir(Aluno a) {
		try {
			Conexao con = new Conexao();
			String sql = "INSERT INTO Aluno "
					+ "(Nome,Email,id_curso,RA)"
					+ " VALUES "
					+ "(?,?,?,?)";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, a.getNome());
			ps.setString(2, a.getEmail());
			ps.setInt(3, a.getId_curso());
			ps.setInt(4, a.getRA());
			ps.execute();
			
			int id_aluno = 0;
			sql = "SELECT LAST_INSERT_ID() AS id_aluno";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			if (res.next()) {
				id_aluno =  res.getInt("id_aluno");
			} 
			
			con.getConexao().close();
			return id_aluno;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		// TERMINANDO METODO ENSINANDO AUTOR LUIZ 18/11/2021
	}
	
	public void alterar(Aluno a) {
		try {
			Conexao con = new Conexao();
			String sql = "UPDATE Aluno "
					+ " SET Nome=?, Email=?, id_curso=?, RA=? "
					+ " WHERE id_aluno=?";
			
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, a.getNome());
			ps.setString(2, a.getEmail());
			ps.setInt(3, a.getId_curso());
			ps.setInt(4, a.getRA());
			ps.setInt(5, a.getId_aluno());
			ps.execute();
			
			con.getConexao();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TERMINO DO METODO QUE ALTERA OS DADOS LUIZ 18/11/2021
	}
	
	public void excluir(int id_aluno) {
		try {
			Conexao con = new Conexao();
			
			String sql = "DELETE FROM Aluno WHERE id_aluno="+id_aluno;
			Statement instrucao = con.getConexao().createStatement();
			instrucao.execute(sql);
			
			con.getConexao();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// FIM DO METODO DE EXCLUSAO DE ALUNO - LUIZ 18/11/2021
	}
	
	
	public Aluno consultar(int id_aluno) {
		Aluno a = new Aluno();
		
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Aluno WHERE id_aluno= " + id_aluno;
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res =  instrucao.executeQuery(sql);
			if (res.next()) {
				a.setNome(res.getString("nome"));
				a.setEmail(res.getString("email"));
				a.setId_curso(res.getInt("id_curso"));
				a.setRA(res.getInt("RA"));
				a.setId_aluno(res.getInt("id_aluno"));
				
			}
			res.close();
			
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;  //  FIM DO METODO CONSULTAR - LUIZ 18/11/2021
	}
	
	public Aluno consultar_ra(int RA) {
		Aluno a = new Aluno();
		
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Aluno WHERE RA= " + RA;
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res =  instrucao.executeQuery(sql);
			if (res.next()) {
				a.setNome(res.getString("nome"));
				a.setEmail(res.getString("email"));
				a.setId_curso(res.getInt("id_curso"));
				a.setRA(res.getInt("RA"));
				a.setId_aluno(res.getInt("id_aluno"));
				
			}
			res.close();
			
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;  //  FIM DO METODO CONSULTAR - LUIZ 18/11/2021
	}

}
