package br.ufscar.dc.pibd.domain;

import java.sql.Date;

public class PeriodoInscricoesEdital {
    private Long idCronogramaEdital;
    private Date inicioPeriodoI;
    private Date fimPeriodoI;

    public PeriodoInscricoesEdital(Long idCronogramaEdital, Date inicioPeriodoI, Date fimPeriodoI){
        this.idCronogramaEdital = idCronogramaEdital;
        this.inicioPeriodoI = inicioPeriodoI;
        this.fimPeriodoI = fimPeriodoI;
    }

    public Long getIdCronogramaEdital(){
        return this.idCronogramaEdital;
    }

    public void setIdCronogramaEdital(Long idCronogramaEdital){
        this.idCronogramaEdital = idCronogramaEdital;
    }

    public Date getInicioPeriodoI(){
        return this.inicioPeriodoI;
    }

    public void setInicioPeriodoI(Date inicioPeriodoI){
        this.inicioPeriodoI = inicioPeriodoI;
    }

    public Date getFimPeriodoI(){
        return this.fimPeriodoI;
    }

    public void setFimPeriodoI(Date fimPeriodoI){
        this.fimPeriodoI = fimPeriodoI;
    }
}
