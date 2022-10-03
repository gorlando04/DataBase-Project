package br.ufscar.dc.pibd.domain;

public class AutorBrasileiro {

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
    private Long cpfPessoa;
    private String pais;
    private String estado;
    private String cidade;
    private String bairro; 
    private String logradouro;
    private String complemento;
    
    public AutorBrasileiro(Long id) {
        this.id = id;
    }

    public AutorBrasileiro(String primeiroNome, String sobrenome, String cep, int numero, String filiacao,
            int ddi, int ddd, int prefixo, int numeroTelefone, String login, String dominio, 
            Long cpfPessoa, String pais, String estado, String cidade, String bairro, String logradouro, String complemento) {
        
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
        this.cpfPessoa = cpfPessoa;
        this.pais = pais;
        this.estado = estado;
        this.cidade = cidade;
        this.bairro = bairro;
        this.logradouro = logradouro;
        this.complemento = complemento;
    }

    public AutorBrasileiro(Long id, String primeiroNome, String sobrenome, String cep, int numero, String filiacao,
            int ddi, int ddd, int prefixo, int numeroTelefone, String login, String dominio, 
            Long cpfPessoa, String pais, String estado, String cidade, String bairro, String logradouro, String complemento) {
        this(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                cpfPessoa, pais, estado, cidade, bairro, logradouro, complemento);
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
	public Long getCpfPessoa() {
		return cpfPessoa;
	}
	public void setCpfPessoa(Long cpfPessoa) {
		this.cpfPessoa = cpfPessoa;
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

    
    
}
