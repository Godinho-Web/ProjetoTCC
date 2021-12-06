package org.libertas.tcc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {
	public Admin pegaUm(String email) {
		Admin admin = null;
		try {
			Conexao con = new Conexao();
			String sql = "SELECT * FROM Admin WHERE Email=?";
			PreparedStatement ps = con.getConexao().prepareStatement(sql);
			ps.setString(1, email);
			ResultSet res = ps.executeQuery();
			
			if (res.next()) {
				admin = new Admin();
				admin.setEmail(res.getString("Email"));
				admin.setSenha(res.getString("Senha"));
				
			}
			res.close();
			con.getConexao().close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
}
