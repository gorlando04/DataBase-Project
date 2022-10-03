package br.ufscar.dc.pibd.domain;

public class OrdemAutoria {

	private int idAutor;
	private int ordemAutor;
    
    public OrdemAutoria(int idAutor) {
        this.idAutor = idAutor;
    }

    public OrdemAutoria(int ordemAutor) {
        
    	this.ordemAutor = ordemAutor;
    }

    public OrdemAutoria(int idAutor, int ordemAutor) {
        this(ordemAutor);
        this.idAutor = idAutor;
    }
    
	public int getIdAutor() {
		return idAutor;
	}
	public void setIdAutor(int idAutor) {
		this.idAutor = idAutor;
	}

	public int getOrdemAutor() {
		return ordemAutor;
	}
	public void setOrdemAutor(int ordemAutor) {
		this.ordemAutor = ordemAutor;
	}
}
