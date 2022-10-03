package br.ufscar.dc.pibd.domain;

public class Trabalho {
    private Long idTrabalho;
    private Long idEdital;
    private String titulo;
    private String palavraChave1;
    private String palavraChave2;
    private String palavraChave3;
    private String palavraChave4;
    private String palavraChave5;
    private String idiomaPrincipal;
    private String idioma2;
    private String idioma3;
    private String descricao;
    private String status;
    private String tipoTrabalho;
    private int areaTrabalho;

    public Trabalho(Long idTrabalho, Long idEdital, String titulo, String palavraChave1, String palavraChave2, String palavraChave3, String palavraChave4, String palavraChave5, String idiomaPrincipal, String idioma2, String idioma3, String descricao, String status, String tipoTrabalho, int areaTrabalho) {
        this.idTrabalho = idTrabalho;
        this.idEdital = idEdital;
        this.titulo = titulo;
        this.palavraChave1 = palavraChave1;
        this.palavraChave2 = palavraChave2;
        this.palavraChave3 = palavraChave3;
        this.palavraChave4 = palavraChave4;
        this.palavraChave5 = palavraChave5;
        this.idiomaPrincipal = idiomaPrincipal;
        this.idioma2 = idioma2;
        this.idioma3 = idioma3;
        this.descricao = descricao;
        this.status = status;
        this.tipoTrabalho = tipoTrabalho;
        this.areaTrabalho = areaTrabalho;
    }
    
    public Long getIdTrabalho() {
        return idTrabalho;
    }

    public void setIdTrabalho(Long idTrabalho) {
        this.idTrabalho = idTrabalho;
    }

    public Long getIdEdital() {
        return idEdital;
    }

    public void setIdEdital(Long idEdital) {
        this.idEdital = idEdital;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getPalavraChave1() {
        return palavraChave1;
    }

    public void setPalavraChave1(String palavraChave1) {
        this.palavraChave1 = palavraChave1;
    }

    public String getPalavraChave2() {
        return palavraChave2;
    }

    public void setPalavraChave2(String palavraChave2) {
        this.palavraChave2 = palavraChave2;
    }

    public String getPalavraChave3() {
        return palavraChave3;
    }

    public void setPalavraChave3(String palavraChave3) {
        this.palavraChave3 = palavraChave3;
    }

    public String getPalavraChave4() {
        return palavraChave4;
    }

    public void setPalavraChave4(String palavraChave4) {
        this.palavraChave4 = palavraChave4;
    }

    public String getPalavraChave5() {
        return palavraChave5;
    }

    public void setPalavraChave5(String palavraChave5) {
        this.palavraChave5 = palavraChave5;
    }

    public String getIdiomaPrincipal() {
        return idiomaPrincipal;
    }

    public void setIdiomaPrincipal(String idiomaPrincipal) {
        this.idiomaPrincipal = idiomaPrincipal;
    }

    public String getIdioma2() {
        return idioma2;
    }

    public void setIdioma2(String idioma2) {
        this.idioma2 = idioma2;
    }

    public String getIdioma3() {
        return idioma3;
    }

    public void setIdioma3(String idioma3) {
        this.idioma3 = idioma3;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTipoTrabalho() {
        return tipoTrabalho;
    }

    public void setTipoTrabalho(String tipoTrabalho) {
        this.tipoTrabalho = tipoTrabalho;
    }

    public int getAreaTrabalho() {
        return areaTrabalho;
    }

    public void setAreaTrabalho(int areaTrabalho) {
        this.areaTrabalho = areaTrabalho;
    }

   

    
}
