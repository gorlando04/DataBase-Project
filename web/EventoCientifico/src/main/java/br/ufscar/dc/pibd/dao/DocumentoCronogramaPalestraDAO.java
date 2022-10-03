package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.DocumentoCronogramaPalestra;

public class DocumentoCronogramaPalestraDAO extends GenericDAO{
    
    public void insert(DocumentoCronogramaPalestra doc) {
	
		String sql = "call InsertDocumentosCronogramaPalestra(?, ?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, doc.getIdAbordagem());
            statement.setTime(1, doc.getDataEntrega());
            statement.setBytes(2, doc.getDocumento());
            statement.setString(3, doc.getTitulo());
            statement.setString(4, doc.getTipo());
            statement.setString(5, doc.getStatusAtendimentoEnvio());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public DocumentoCronogramaPalestra get(Long idAbordagem){
        DocumentoCronogramaPalestra doc = null;

        String sql = "SELECT * From DocumentoCronogramaPalestra WHERE idAbordagem=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idAbordagem);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Time dataEntrega = resultSet.getTime("dataEntrega");
                byte[] documento = resultSet.getBytes("documento");
                String titulo = resultSet.getString("tituloDocumento");
                String tipo = resultSet.getString("tipo");
                String status = resultSet.getString("statusAtendimentoEnvio");

                doc = new DocumentoCronogramaPalestra(idAbordagem, dataEntrega, documento, titulo, tipo, status);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return doc;
    }

    public List<DocumentoCronogramaPalestra> getAll(){
        List<DocumentoCronogramaPalestra> listaDocs = new ArrayList<>();
        String sql = "SELECT * From DocumentosCronogramaPalestra";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idAbordagem = resultSet.getLong("idAbordagem");
                Time dataEntrega = resultSet.getTime("dataEntrega");
                byte[] documento = resultSet.getBytes("documento");
                String titulo = resultSet.getString("tituloDocumento");
                String tipo = resultSet.getString("tipo");
                String status = resultSet.getString("statusAtendimentoEnvio");

                DocumentoCronogramaPalestra doc = new DocumentoCronogramaPalestra(idAbordagem, dataEntrega, documento, titulo, tipo, status);
                listaDocs.add(doc);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaDocs;
    }

    public void update(DocumentoCronogramaPalestra doc){

        String sql = "call UpdateDocumentosCronogramaPalestra(?, ?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, doc.getIdAbordagem());
            statement.setTime(1, doc.getDataEntrega());
            statement.setBytes(2, doc.getDocumento());
            statement.setString(3, doc.getTitulo());
            statement.setString(4, doc.getTipo());
            statement.setString(5, doc.getStatusAtendimentoEnvio());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
