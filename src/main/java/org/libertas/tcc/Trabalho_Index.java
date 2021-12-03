package org.libertas.tcc;

public class Trabalho_Index {
	private int id_trabalho;
	private String titulo;
	private String nome;
	private String email;
	private String arquivo;
	private String nomepr;
	private String nomecur;
	private String resumo;
	private String validacao;
	private String autorizacao;
	
	
	
	public String getValidacao() {
		return validacao;
	}
	public void setValidacao(String validacao) {
		this.validacao = validacao;
	}
	public String getAutorizacao() {
		return autorizacao;
	}
	public void setAutorizacao(String autorizacao) {
		this.autorizacao = autorizacao;
	}
	public int getId_trabalho() {
		return id_trabalho;
	}
	public void setId_trabalho(int id_trabalho) {
		this.id_trabalho = id_trabalho;
	}
	public String getPalavras_chaves() {
		return palavras_chaves;
	}
	public void setPalavras_chaves(String palavras_chaves) {
		this.palavras_chaves = palavras_chaves;
	}
	private String palavras_chaves;
	
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getArquivo() {
		return arquivo;
	}
	public void setArquivo(String arquivo) {
		this.arquivo = arquivo;
	}
	public String getNomepr() {
		return nomepr;
	}
	public void setNomepr(String nomepr) {
		this.nomepr = nomepr;
	}
	public String getNomecur() {
		return nomecur;
	}
	public void setNomecur(String nomecur) {
		this.nomecur = nomecur;
	}
	public String getResumo() {
		return resumo;
	}
	public void setResumo(String resumo) {
		this.resumo = resumo;
	}
	
	
	
}
