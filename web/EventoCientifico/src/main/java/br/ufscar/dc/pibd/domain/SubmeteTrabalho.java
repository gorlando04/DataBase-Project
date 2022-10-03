package br.ufscar.dc.pibd.domain;

public class SubmeteTrabalho {

	private int idAutor;
	private int idTrabalho;
	private int idAutoria;
    
	// coloquei esses dois ids aqui pq na tabelas eles são pk, mas não sei se é assim mesmo (ou se faz diferença)
    public SubmeteTrabalho(int idAutor, int idTrabalho) {
        this.idAutor = idAutor;
		this.idTrabalho = idTrabalho;
    }

    public SubmeteTrabalho(int idAutoria) {
        
    	this.idAutoria = idAutoria;
    }
    
	public int getIdAutor() {
		return idAutor;
	}
	public void setIdAutor(int idAutor) {
		this.idAutor = idAutor;
	}

	public int getIdTrabalho() {
		return idTrabalho;
	}
	public void setIdTrabalho(int idTrabalho) {
		this.idTrabalho = idTrabalho;
	}
    
	public int getIdAutoria() {
		return idAutoria;
	}
	public void setIdAutoria(int idAutoria) {
		this.idAutoria = idAutoria;
	}
}
