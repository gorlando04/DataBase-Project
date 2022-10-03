package br.ufscar.dc.pibd.domain;

public class Login {

	private AutorBrasileiro autorBrasileiro;
	private AutorEstrangeiro autorEstrangeiro;
	private AvaliadorBrasileiro avaliadorBrasileiro;
	private AvaliadorEstrangeiro avaliadorEstrangeiro;
	private MembroOrganizacaoBrasileiro membroOrganizacaoBrasileiro;
	private MembroOrganizacaoEstrangeiro membroOrganizacaoEstrangeiro;
	
	public Login(AutorBrasileiro autorBrasileiro, AutorEstrangeiro autorEstrangeiro, AvaliadorBrasileiro avaliadorBrasileiro, 
			AvaliadorEstrangeiro avaliadorEstrangeiro,MembroOrganizacaoBrasileiro membroOrganizacaoBrasileiro, MembroOrganizacaoEstrangeiro membroOrganizacaoEstrangeiro) {
        this.autorBrasileiro = autorBrasileiro;
        this.autorEstrangeiro = autorEstrangeiro;
        this.avaliadorBrasileiro = avaliadorBrasileiro;
        this.avaliadorEstrangeiro = avaliadorEstrangeiro;
        this.membroOrganizacaoBrasileiro = membroOrganizacaoBrasileiro;
        this.membroOrganizacaoEstrangeiro = membroOrganizacaoEstrangeiro;
    }
	
	public AutorBrasileiro getAutorBrasileiro() {
		return autorBrasileiro;
	}
	public void setAutorBrasileiro(AutorBrasileiro autorBrasileiro) {
		this.autorBrasileiro = autorBrasileiro;
	}
	public AutorEstrangeiro getAutorEstrangeiro() {
		return autorEstrangeiro;
	}
	public void setAutorEstrangeiro(AutorEstrangeiro autorEstrangeiro) {
		this.autorEstrangeiro = autorEstrangeiro;
	}
	public AvaliadorBrasileiro getAvaliadorBrasileiro() {
		return avaliadorBrasileiro;
	}
	public void setAvaliadorBrasileiro(AvaliadorBrasileiro avaliadorBrasileiro) {
		this.avaliadorBrasileiro = avaliadorBrasileiro;
	}
	public AvaliadorEstrangeiro getAvaliadorEstrangeiro() {
		return avaliadorEstrangeiro;
	}
	public void setAvaliadorEstrangeiro(AvaliadorEstrangeiro avaliadorEstrangeiro) {
		this.avaliadorEstrangeiro = avaliadorEstrangeiro;
	}
	public MembroOrganizacaoBrasileiro getMembroOrganizacaoBrasileiro() {
		return membroOrganizacaoBrasileiro;
	}
	public void setMembroOrganizacaoBrasileiro(MembroOrganizacaoBrasileiro membroOrganizacaoBrasileiro) {
		this.membroOrganizacaoBrasileiro = membroOrganizacaoBrasileiro;
	}
	public MembroOrganizacaoEstrangeiro getMembroOrganizacaoEstrangeiro() {
		return membroOrganizacaoEstrangeiro;
	}
	public void setMembroOrganizacaoEstrangeiro(MembroOrganizacaoEstrangeiro membroOrganizacaoEstrangeiro) {
		this.membroOrganizacaoEstrangeiro = membroOrganizacaoEstrangeiro;
	}
	
	
}
