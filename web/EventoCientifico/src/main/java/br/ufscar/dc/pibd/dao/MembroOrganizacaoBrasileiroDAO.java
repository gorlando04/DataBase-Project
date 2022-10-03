package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.MembroOrganizacaoBrasileiro;

public class MembroOrganizacaoBrasileiroDAO extends GenericDAO{

	public void insert(MembroOrganizacaoBrasileiro membroOrganizacaoBrasileiro) {
		
		String sql = "call InsertMembroOrganizacaoBrasileiro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, membroOrganizacaoBrasileiro.getPrimeiroNome());
            statement.setString(2, membroOrganizacaoBrasileiro.getSobrenome());
            statement.setString(3, membroOrganizacaoBrasileiro.getCep());
            statement.setInt(4, membroOrganizacaoBrasileiro.getNumero());
            statement.setString(5, membroOrganizacaoBrasileiro.getFiliacao());
            statement.setInt(6, membroOrganizacaoBrasileiro.getDdi());
            statement.setInt(7, membroOrganizacaoBrasileiro.getDdd());
            statement.setInt(8, membroOrganizacaoBrasileiro.getPrefixo());
            statement.setInt(9, membroOrganizacaoBrasileiro.getNumeroTelefone());
            statement.setString(10, membroOrganizacaoBrasileiro.getLogin());
            statement.setString(11, membroOrganizacaoBrasileiro.getDominio());
            statement.setLong(12, membroOrganizacaoBrasileiro.getCpfPessoa());
            statement.setString(13, membroOrganizacaoBrasileiro.getPais());
            statement.setString(14, membroOrganizacaoBrasileiro.getEstado());
            statement.setString(15, membroOrganizacaoBrasileiro.getCidade());
            statement.setString(16, membroOrganizacaoBrasileiro.getBairro());
            statement.setString(17, membroOrganizacaoBrasileiro.getComplemento());
            statement.setInt(18, membroOrganizacaoBrasileiro.getIdComite());
            statement.setString(19, membroOrganizacaoBrasileiro.getEhResponsavel());
            statement.setString(20, membroOrganizacaoBrasileiro.getEhCorresponsavel());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public MembroOrganizacaoBrasileiro get(Long cpf) {
		MembroOrganizacaoBrasileiro membroOrganizacaoBrasileiro = null;

        String sql = "SELECT * from MembroOrganizacao, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and MembroOrganizacao.idPessoa = Pessoa.idPessoa";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, cpf);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String primeiroNome = resultSet.getString("primeiroNome");
                String sobrenome = resultSet.getString("sobrenome");
                String cep = resultSet.getString("cep");
                int numero = resultSet.getInt("numero");
                String filiacao = resultSet.getString("filiacao");
                int ddi = resultSet.getInt("ddi");
                int ddd = resultSet.getInt("ddd");
                int prefixo = resultSet.getInt("prefixo");
                int numeroTelefone = resultSet.getInt("numeroTelefone");
                String login = resultSet.getString("login");
                String dominio = resultSet.getString("dominio");
                Long cpfPessoa = resultSet.getLong("cpf");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String complemento = resultSet.getString("complemento");
                int idComite = resultSet.getInt("idComite");
                String ehResponsavel = resultSet.getString("ehResponsavel");
                String ehCorresponsavel = resultSet.getString("ehCorresponsavel");

                membroOrganizacaoBrasileiro = new MembroOrganizacaoBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                        cpfPessoa, pais, estado, cidade, bairro, complemento, idComite, ehResponsavel, ehCorresponsavel);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return membroOrganizacaoBrasileiro;
    }
	
	public List<MembroOrganizacaoBrasileiro> getAll() {

        List<MembroOrganizacaoBrasileiro> listaMembroOrganizacaoBrasileiro = new ArrayList<>();

        String sql = "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
            	String primeiroNome = resultSet.getString("primeiroNome");
                String sobrenome = resultSet.getString("sobrenome");
                String cep = resultSet.getString("cep");
                int numero = resultSet.getInt("numero");
                String filiacao = resultSet.getString("filiacao");
                int ddi = resultSet.getInt("ddi");
                int ddd = resultSet.getInt("ddd");
                int prefixo = resultSet.getInt("prefixo");
                int numeroTelefone = resultSet.getInt("numeroTelefone");
                String login = resultSet.getString("login");
                String dominio = resultSet.getString("dominio");
                Long cpfPessoa = resultSet.getLong("cpf");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String complemento = resultSet.getString("complemento");
                int idComite = resultSet.getInt("idComite");
                String ehResponsavel = resultSet.getString("ehResponsavel");
                String ehCorresponsavel = resultSet.getString("ehCorresponsavel");

                MembroOrganizacaoBrasileiro membroOrganizacaoBrasileiro = new MembroOrganizacaoBrasileiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                        cpfPessoa, pais, estado, cidade, bairro, complemento, idComite, ehResponsavel, ehCorresponsavel);
                listaMembroOrganizacaoBrasileiro.add(membroOrganizacaoBrasileiro);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaMembroOrganizacaoBrasileiro;
    }
}
