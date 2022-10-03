package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.CertificadoAvaliador;

public class CertificadoAvaliadorDAO extends GenericDAO{
    
    public void insert(CertificadoAvaliador certificado) {
	
		String sql = "call InsertCertificadoAvaliador(?,?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, certificado.getIdAvaliador());
            statement.setInt(1, certificado.getCodCertificado());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public CertificadoAvaliador get(int cod){
        CertificadoAvaliador certificado = null;

        String sql = "SELECT * From CertificadoAvaliador WHERE codCertificado=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, cod);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long idAvaliador = resultSet.getLong("idAvaliador");

                certificado = new CertificadoAvaliador(idAvaliador, cod);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return certificado;
    }

    public List<CertificadoAvaliador> getAll(){
        List<CertificadoAvaliador> listaCertificados = new ArrayList<>();
        String sql = "SELECT * From CertificadoAvaliador";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idAvaliador = resultSet.getLong("idAvaliador");
                int cod = resultSet.getInt("codCertificado");

                CertificadoAvaliador certificado = new CertificadoAvaliador(idAvaliador, cod);
                listaCertificados.add(certificado);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCertificados;
    }

    public void update(CertificadoAvaliador certificado){

        String sql = "call UpdateCertificadoAvaliador(?,?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, certificado.getIdAvaliador());
            statement.setInt(1, certificado.getCodCertificado());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
