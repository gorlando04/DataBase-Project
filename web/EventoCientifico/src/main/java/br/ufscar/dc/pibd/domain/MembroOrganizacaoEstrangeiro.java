package br.ufscar.dc.pibd.domain;

import java.util.Date;

public class MembroOrganizacaoEstrangeiro {

	private Long id;
	private String primeiroNome;
    private String sobrenome;
    private String cep;
    private int numero;
    private String filiacao;
    private int ddi;
    private int ddd;
    private int prefixo;
    private int numeroTelefone;
    private String login;
    private String dominio;
    private String nroPassaporte;
    private Date dataEmissao;
    private Date dataExpiracao;
    private String govEmissor;
    private String pais;
    private String estado;
    private String cidade;
    private String bairro; 
    private String logradouro;
    private String complemento;
    private int idComite;
    private String ehResponsavel;
    private String ehCorresponsavel;
    
    public MembroOrganizacaoEstrangeiro(Long id) {
        this.id = id;
    }

    public MembroOrganizacaoEstrangeiro(String primeiroNome, String sobrenome, String cep, int numero, String filiacao,
            int ddi, int ddd, int prefixo, int numeroTelefone, String login, String dominio, 
            String nroPassaporte, Date dataEmissao, Date dataExpiracao, String govEmissor, String pais, String estado, String cidade, String bairro, String complemento,
            int idComite, String ehResponsavel, String ehCorresponsavel) {
        
    	this.primeiroNome = primeiroNome;
    	this.sobrenome = sobrenome;
    	this.cep = cep;
    	this.numero = numero;
    	this.filiacao = filiacao;
    	this.ddi = ddi;
    	this.ddd = ddd;
    	this.prefixo = prefixo;
    	this.numeroTelefone = numeroTelefone;
    	this.login = login;
    	this.dominio = dominio; 
    	this.nroPassaporte = nroPassaporte;
    	this.dataEmissao = dataEmissao;
    	this.dataExpiracao = dataExpiracao;
    	this.govEmissor = govEmissor;
        this.pais = pais;
        this.estado = estado;
        this.cidade = cidade;
        this.bairro = bairro;
        this.complemento = complemento;
        this.idComite = idComite;
        this.ehResponsavel = ehResponsavel;
        this.ehCorresponsavel = ehCorresponsavel;
    }
    
    public MembroOrganizacaoEstrangeiro(Long id, String primeiroNome, String sobrenome, String cep, int numero, String filiacao,
            int ddi, int ddd, int prefixo, int numeroTelefone, String login, String dominio, 
            String nroPassaporte, Date dataEmissao, Date dataExpiracao, String govEmissor, String pais, String estado, String cidade, String bairro, String complemento,
            int idComite, String ehResponsavel, String ehCorresponsavel) {
        this(primeiroNome, sobrenome, cep, numero, filiacao,
                ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                nroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, complemento,
                idComite, ehResponsavel, ehCorresponsavel);
        this.id = id;
    }
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPrimeiroNome() {
		return primeiroNome;
	}
	public void setPrimeiroNome(String primeiroNome) {
		this.primeiroNome = primeiroNome;
	}
	public String getSobrenome() {
		return sobrenome;
	}
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getFiliacao() {
		return filiacao;
	}
	public void setFiliacao(String filiacao) {
		this.filiacao = filiacao;
	}
	public int getDdi() {
		return ddi;
	}
	public void setDdi(int ddi) {
		this.ddi = ddi;
	}
	public int getDdd() {
		return ddd;
	}
	public void setDdd(int ddd) {
		this.ddd = ddd;
	}
	public int getPrefixo() {
		return prefixo;
	}
	public void setPrefixo(int prefixo) {
		this.prefixo = prefixo;
	}
	public int getNumeroTelefone() {
		return numeroTelefone;
	}
	public void setNumeroTelefone(int numeroTelefone) {
		this.numeroTelefone = numeroTelefone;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getDominio() {
		return dominio;
	}
	public void setDominio(String dominio) {
		this.dominio = dominio;
	}
	public String getNroPassaporte() {
		return nroPassaporte;
	}
	public void setNroPassaporte(String nroPassaporte) {
		this.nroPassaporte = nroPassaporte;
	}
	public Date getDataEmissao() {
		return dataEmissao;
	}
	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}
	public Date getDataExpiracao() {
		return dataExpiracao;
	}
	public void setDataExpiracao(Date dataExpiracao) {
		this.dataExpiracao = dataExpiracao;
	}
	public String getGovEmissor() {
		return govEmissor;
	}
	public void setGovEmissor(String govEmissor) {
		this.govEmissor = govEmissor;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public int getIdComite() {
		return idComite;
	}
	public void setIdComite(int idComite) {
		this.idComite = idComite;
	}
	public String getEhResponsavel() {
		return ehResponsavel;
	}
	public void setEhResponsavel(String ehResponsavel) {
		this.ehResponsavel = ehResponsavel;
	}
	public String getEhCorresponsavel() {
		return ehCorresponsavel;
	}
	public void setEhCorresponsavel(String ehCorresponsavel) {
		this.ehCorresponsavel = ehCorresponsavel;
	}
    
    
}
