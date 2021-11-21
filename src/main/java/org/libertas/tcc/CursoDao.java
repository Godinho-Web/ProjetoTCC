package org.libertas.tcc;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class CursoDao {
	public Curso consultar(int id_curso) {
		Curso c = new Curso();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Curso WHERE id_curso = " + id_curso;
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			if (res.next()) {
				c.setNome(res.getString("nome"));
			}
			res.close();
			
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
		
		
		// TERMINO DO METODO QUE CONSULTA UM PROFESSOR 21-11-2021 LUIZ
	}
	
	public List<Curso> listar(){
		List<Curso> dados = new LinkedList<Curso>();
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Curso ORDER BY Nome";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			while (res.next()) {
				Curso c = new Curso();
				c.setId_curso(res.getInt("id_curso"));
				c.setNome(res.getString("nome"));
				dados.add(c);
			}
			
			res.close();
			con.getConexao().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dados;
		
		// TERMINO DO METODO QUE LISTA TODOS OS CURSOS 21-10-2021 LUIZ
	}
}	
