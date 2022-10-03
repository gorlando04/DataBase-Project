package br.ufscar.dc.pibd.domain;

public class Palestras {

	private int idAbordagem;
	private String tituloDaPalestra;
    private String resumoDaPalestra;
    private String materialDeApoio;
    
    public Palestras(int idAbordagem) {
        this.idAbordagem = idAbordagem;
    }

    public Palestras(String tituloDaPalestra, String resumoDaPalestra, String materialDeApoio) {
        
    	this.tituloDaPalestra = tituloDaPalestra;
    	this.resumoDaPalestra = resumoDaPalestra;
    	this.materialDeApoio = materialDeApoio;
    }

    public Palestras(int idAbordagem, String tituloDaPalestra, String resumoDaPalestra, String materialDeApoio) {
        this(tituloDaPalestra, resumoDaPalestra, materialDeApoio);
        this.idAbordagem = idAbordagem;
    }
    
	public int getIdAbordagem() {
		return idAbordagem;
	}
	public void setIdAbordagem(int idAbordagem) {
		this.idAbordagem = idAbordagem;
	}

	public String getTituloDaPalestra() {
		return tituloDaPalestra;
	}
	public void setTituloDaPalestra(String tituloDaPalestra) {
		this.tituloDaPalestra = tituloDaPalestra;
	}

	public String getResumoDaPalestra() {
		return resumoDaPalestra;
	}
	public void setResumoDaPalestra() {
		this.resumoDaPalestra = resumoDaPalestra;
	}

	public String getMaterialDeApoio() {
		return materialDeApoio;
	}
	public void setMaterialDeApoio() {
		this.materialDeApoio = materialDeApoio;
	}
    
}
