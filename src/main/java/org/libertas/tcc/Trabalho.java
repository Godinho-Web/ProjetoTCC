package org.libertas.tcc;

public class Trabalho {
	private int id_trabalho;
	private String titulo;
	private String resumo;
	private String palavras_chaves;
	private String arquivo;
	private String data;
	private String validacao;
	private String autorizacao;
	private int id_aluno;
	private int id_professor;
	
	public int getId_trabalho() {
		return id_trabalho;
	}
	public void setId_trabalho(int id_trabalho) {
		this.id_trabalho = id_trabalho;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getResumo() {
		return resumo;
	}
	public void setResumo(String resumo) {
		this.resumo = resumo;
	}
	public String getPalavras_chaves() {
		return palavras_chaves;
	}
	public void setPalavras_chaves(String palavras_chaves) {
		this.palavras_chaves = palavras_chaves;
	}
	public String getArquivo() {
		return arquivo;
	}
	public void setArquivo(String arquivo) {
		this.arquivo = arquivo;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
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
	public int getId_aluno() {
		return id_aluno;
	}
	public void setId_aluno(int id_aluno) {
		this.id_aluno = id_aluno;
	}
	public int getId_professor() {
		return id_professor;
	}
	public void setId_professor(int id_professor) {
		this.id_professor = id_professor;
	}
	
	
}
