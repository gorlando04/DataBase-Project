package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import br.ufscar.dc.pibd.domain.CandidatoAPalestrante;

public class CandidatoAPalestranteDAO extends GenericDAO{

    public void insertCandidato(CandidatoAPalestrante candidatoAPalestrante) {

        String sql = "call InsertCandidatoAPalestrante (?, ?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getPessoaQueIndicou());
            statement.setString(2, candidatoAPalestrante.getContatoPessoaIndicou());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void insertDescricaoCandidato(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call InsertDescricaoCandidato (?, ?, ?, ?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getMiniCurriculo());
            statement.setString(1, candidatoAPalestrante.getAreaDeAtuacao());
            statement.setString(2, candidatoAPalestrante.getNome());
            statement.setBytes(3, candidatoAPalestrante.getFoto());
            statement.setString(4, candidatoAPalestrante.getEmailPrincipal());
            
            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insertLinksTrabalhosCandPalest(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call InsertLinksTrabalhosCandPalest(?, ?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getTitulo());
            statement.setString(2, candidatoAPalestrante.getUniclink());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insertEmailsSecundariosCandPalest(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call InsertEmailsSecundariosCandPalest(?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getEmails());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insertTelefonesCandidatoPalest(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call InsertTelefonesCandidatoPalest(?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getTelefones());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateCandidatoAPalestrante(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call UpdateCandidatoAPalestrante (?, ?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getPessoaQueIndicou());
            statement.setString(2, candidatoAPalestrante.getContatoPessoaIndicou());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateDescricaoCandidato(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call UpdateDescricaoCandidato (?, ?, ?, ?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getMiniCurriculo());
            statement.setString(1, candidatoAPalestrante.getAreaDeAtuacao());
            statement.setString(2, candidatoAPalestrante.getNome());
            statement.setBytes(3, candidatoAPalestrante.getFoto());
            statement.setString(4, candidatoAPalestrante.getEmailPrincipal());
            
            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateLinksTrabalhosCandPalest(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call UpdateLinksTrabalhosCandPalest(?, ?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getTitulo());
            statement.setString(2, candidatoAPalestrante.getUniclink());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateEmailsSecundariosCandPalest(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call UpdateEmailsSecundariosCandPalest(?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getEmails());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateTelefonesCandidatoPalest(CandidatoAPalestrante candidatoAPalestrante){

        String sql = "call UpdateTelefonesCandidatoPalest(?, ?)";

        try {

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, candidatoAPalestrante.getEmailPrincipal());
            statement.setString(1, candidatoAPalestrante.getTelefones());

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}