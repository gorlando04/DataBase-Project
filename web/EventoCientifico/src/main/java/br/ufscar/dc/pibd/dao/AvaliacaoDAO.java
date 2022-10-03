package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Avaliacao;

public class AvaliacaoDAO extends GenericDAO{

    public void InsertAvalia(Avaliacao avaliacao) {

        String sql = "call InsertAvalia(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, avaliacao.getIdAvalia());
            statement.setString(1, avaliacao.getIdTrabalho());
            statement.setString(2, avaliacao.getIdAvaliador());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void InsertCriterioAvaliacao(Avaliacao avaliacao) {

        String sql = "call InsertCriterioAvaliacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, avaliacao.getIdEdital());
            statement.setString(1, avaliacao.getCriterioAvaliado());
            statement.setString(2, avaliacao.getDescricaoCriterio());
            
            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void InsertPrazoAvaliacao(Avaliacao avaliacao) {

        String sql = "call InsertPrazoAvaliacao(?, ?)";

        try {
            
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, avaliacao.getDataAtribuicao());
            statement.setString(1, avaliacao.getPrazo());
            
            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void InsertAvaliacao(Avaliacao avaliacao) {

        String sql = "call InsertAvaliacao(?, ?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, avaliacao.getIdCriterioAvaliado());
            statement.setString(1, avaliacao.getDataAtribuicao());
            statement.setString(2, avaliacao.getConflito());
            statement.setString(3, avaliacao.getDataResposta());
            statement.setString(4, avaliacao.getJustificativa());
            statement.setString(5, avaliacao.getNotaAtribuida());
            
            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

}