package br.ufscar.dc.pibd.domain;

import java.sql.Date;

public class PeriodoSubmissoesEdital {
    private Long idCronogramaEdital;
    private Date inicioPeriodoS;
    private Date fimPeriodoS;

    public PeriodoSubmissoesEdital(Long idCronogramaEdital, Date inicioPeriodoS, Date fimPeriodoS){
        this.idCronogramaEdital = idCronogramaEdital;
        this.inicioPeriodoS = inicioPeriodoS;
        this.fimPeriodoS = fimPeriodoS;
    }

    public Long getIdCronogramaEdital(){
        return this.idCronogramaEdital;
    }

    public void setIdCronogramaEdital(Long idCronogramaEdital){
        this.idCronogramaEdital = idCronogramaEdital;
    }

    public Date getinicioPeriodoS(){
        return this.inicioPeriodoS;
    }

    public void setinicioPeriodoS(Date inicioPeriodoS){
        this.inicioPeriodoS = inicioPeriodoS;
    }

    public Date getfimPeriodoS(){
        return this.fimPeriodoS;
    }

    public void setfimPeriodoS(Date fimPeriodoS){
        this.fimPeriodoS = fimPeriodoS;
    }
}
