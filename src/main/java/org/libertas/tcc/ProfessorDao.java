package org.libertas.tcc;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class ProfessorDao {
	public Professor consultar(int id_professor) {
		Professor p = new Professor();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Professor WHERE id_professor = " + id_professor;
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			if (res.next()) {
				p.setNome(res.getString("nome"));
			}
			res.close();
			
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
		
		
		// TERMINO DO METODO QUE CONSULTA UM PROFESSOR 21-11-2021 LUIZ
	}
	
	public List<Professor> listar(){
		List<Professor> dados = new LinkedList<Professor>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Professor ORDER BY Nome";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			while (res.next()) {
				Professor p = new Professor();
				p.setId_professor(res.getInt("id_professor"));
				p.setNome(res.getString("nome"));
				dados.add(p);
			}
			
			res.close();
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dados;
		
		// TERMINO DO METODO QUE LISTA TODOS OS PROFESSORES 21-10-2021 LUIZ
	}
}
