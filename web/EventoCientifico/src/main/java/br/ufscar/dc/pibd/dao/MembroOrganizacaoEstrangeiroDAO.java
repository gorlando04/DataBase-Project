package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.MembroOrganizacaoEstrangeiro;

public class MembroOrganizacaoEstrangeiroDAO extends GenericDAO{

public void insert(MembroOrganizacaoEstrangeiro membroOrganizacaoEstrangeiro) {
		
		String sql = "call InsertMembroOrganizacaoEstrangeiro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, membroOrganizacaoEstrangeiro.getPrimeiroNome());
            statement.setString(2, membroOrganizacaoEstrangeiro.getSobrenome());
            statement.setString(3, membroOrganizacaoEstrangeiro.getCep());
            statement.setInt(4, membroOrganizacaoEstrangeiro.getNumero());
            statement.setString(5, membroOrganizacaoEstrangeiro.getFiliacao());
            statement.setInt(6, membroOrganizacaoEstrangeiro.getDdi());
            statement.setInt(7, membroOrganizacaoEstrangeiro.getDdd());
            statement.setInt(8, membroOrganizacaoEstrangeiro.getPrefixo());
            statement.setInt(9, membroOrganizacaoEstrangeiro.getNumeroTelefone());
            statement.setString(10, membroOrganizacaoEstrangeiro.getLogin());
            statement.setString(11, membroOrganizacaoEstrangeiro.getDominio());
            statement.setString(12, membroOrganizacaoEstrangeiro.getNroPassaporte());
            statement.setDate(13, (Date) membroOrganizacaoEstrangeiro.getDataEmissao());
            statement.setDate(14, (Date) membroOrganizacaoEstrangeiro.getDataExpiracao());
            statement.setString(15, membroOrganizacaoEstrangeiro.getGovEmissor());
            statement.setString(16, membroOrganizacaoEstrangeiro.getPais());
            statement.setString(17, membroOrganizacaoEstrangeiro.getEstado());
            statement.setString(18, membroOrganizacaoEstrangeiro.getCidade());
            statement.setString(19, membroOrganizacaoEstrangeiro.getBairro());
            statement.setString(20, membroOrganizacaoEstrangeiro.getComplemento());
            statement.setInt(21, membroOrganizacaoEstrangeiro.getIdComite());
            statement.setString(22, membroOrganizacaoEstrangeiro.getEhResponsavel());
            statement.setString(23, membroOrganizacaoEstrangeiro.getEhCorresponsavel());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public MembroOrganizacaoEstrangeiro get(String nroPassaporte) {
		MembroOrganizacaoEstrangeiro membroOrganizacaoEstrangeiro = null;

        String sql = "SELECT * from Autor, Pessoa, Estrangeiro where Estrangeiro.nroPassaporte = ? and Estrangeiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, nroPassaporte);
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
                String numeroPassaporte = resultSet.getString("nroPassaporte");
                Date dataEmissao = resultSet.getDate("dataEmissao");
                Date dataExpiracao = resultSet.getDate("dataExpiracao");
                String govEmissor = resultSet.getString("govEmissor");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String complemento = resultSet.getString("complemento");
                int idComite = resultSet.getInt("idComite");
                String ehResponsavel = resultSet.getString("ehResponsavel");
                String ehCorresponsavel = resultSet.getString("ehCorresponsavel");

                membroOrganizacaoEstrangeiro = new MembroOrganizacaoEstrangeiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                		numeroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, complemento, idComite, ehResponsavel, ehCorresponsavel);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return membroOrganizacaoEstrangeiro;
    }
	
	public List<MembroOrganizacaoEstrangeiro> getAll() {

        List<MembroOrganizacaoEstrangeiro> listaMembroOrganizacaoEstrangeiro = new ArrayList<>();

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
                String numeroPassaporte = resultSet.getString("nroPassaporte");
                Date dataEmissao = resultSet.getDate("dataEmissao");
                Date dataExpiracao = resultSet.getDate("dataExpiracao");
                String govEmissor = resultSet.getString("govEmissor");
                String pais = resultSet.getString("pais");
                String estado = resultSet.getString("estado");
                String cidade = resultSet.getString("cidade");
                String bairro = resultSet.getString("bairro");
                String complemento = resultSet.getString("complemento");
                int idComite = resultSet.getInt("idComite");
                String ehResponsavel = resultSet.getString("ehResponsavel");
                String ehCorresponsavel = resultSet.getString("ehCorresponsavel");
                

                MembroOrganizacaoEstrangeiro membroOrganizacaoEstrangeiro = new MembroOrganizacaoEstrangeiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                		numeroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, complemento, idComite, ehResponsavel, ehCorresponsavel);
                listaMembroOrganizacaoEstrangeiro.add(membroOrganizacaoEstrangeiro);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaMembroOrganizacaoEstrangeiro;
    }
}
