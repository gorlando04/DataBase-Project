package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.AvaliadorEstrangeiro;

public class AvaliadorEstrangeiroDAO extends GenericDAO{

public void insert(AvaliadorEstrangeiro avaliadorEstrangeiro) {
		
		String sql = "call InsertAvaliadorEstrangeiro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, avaliadorEstrangeiro.getPrimeiroNome());
            statement.setString(2, avaliadorEstrangeiro.getSobrenome());
            statement.setString(3, avaliadorEstrangeiro.getCep());
            statement.setInt(4, avaliadorEstrangeiro.getNumero());
            statement.setString(5, avaliadorEstrangeiro.getFiliacao());
            statement.setInt(6, avaliadorEstrangeiro.getDdi());
            statement.setInt(7, avaliadorEstrangeiro.getDdd());
            statement.setInt(8, avaliadorEstrangeiro.getPrefixo());
            statement.setInt(9, avaliadorEstrangeiro.getNumeroTelefone());
            statement.setString(10, avaliadorEstrangeiro.getLogin());
            statement.setString(11, avaliadorEstrangeiro.getDominio());
            statement.setString(12, avaliadorEstrangeiro.getNroPassaporte());
            statement.setDate(13, (Date) avaliadorEstrangeiro.getDataEmissao());
            statement.setDate(14, (Date) avaliadorEstrangeiro.getDataExpiracao());
            statement.setString(15, avaliadorEstrangeiro.getGovEmissor());
            statement.setString(16, avaliadorEstrangeiro.getPais());
            statement.setString(17, avaliadorEstrangeiro.getEstado());
            statement.setString(18, avaliadorEstrangeiro.getCidade());
            statement.setString(19, avaliadorEstrangeiro.getBairro());
            statement.setString(20, avaliadorEstrangeiro.getLogradouro());
            statement.setString(21, avaliadorEstrangeiro.getComplemento());
            statement.setString(22, avaliadorEstrangeiro.getPrazoRespConv());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public AvaliadorEstrangeiro get(String nroPassaporte) {
		AvaliadorEstrangeiro avaliadorEstrangeiro = null;

        String sql = "SELECT * from Avaliador, Pessoa, Estrangeiro where Estrangeiro.nroPassaporte = ? and Estrangeiro.idPessoa = Pessoa.idPessoa and Avaliador.idAvaliador = Pessoa.idPessoa";

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
                String logradouro = resultSet.getString("logradouro");
                String complemento = resultSet.getString("complemento");
                String prazoRespConv = resultSet.getString("prazoRespConv");

                avaliadorEstrangeiro = new AvaliadorEstrangeiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                		numeroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, logradouro, complemento, prazoRespConv);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return avaliadorEstrangeiro;
    }
	
	public List<AvaliadorEstrangeiro> getAll() {

        List<AvaliadorEstrangeiro> listaAvaliadorEstrangeiro = new ArrayList<>();

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
                String logradouro = resultSet.getString("logradouro");
                String complemento = resultSet.getString("complemento");
                String prazoRespConv = resultSet.getString("prazoRespConv");

                AvaliadorEstrangeiro avaliadorEstrangeiro = new AvaliadorEstrangeiro(primeiroNome, sobrenome, cep, numero, filiacao, ddi, ddd, prefixo, numeroTelefone, login, dominio, 
                		numeroPassaporte, dataEmissao, dataExpiracao, govEmissor, pais, estado, cidade, bairro, logradouro, complemento, prazoRespConv);
                listaAvaliadorEstrangeiro.add(avaliadorEstrangeiro);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaAvaliadorEstrangeiro;
    }

}
